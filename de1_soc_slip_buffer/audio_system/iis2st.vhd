library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity iis2st is
  generic (bitperiod : time := 20 ns);  -- Default value
  port (
    -- Common --
    ast_clk_48K      : in  std_logic;   --48KHz
    ast_reset_n      : in  std_logic;
	-- Data to DAC
    ast_sink_data    : in  std_logic_vector(23 downto 0);
    ast_sink_ready   : out std_logic                     := '0';  -- Value at startup
    ast_sink_valid   : in  std_logic;
    ast_sink_error   : in  std_logic_vector(1 downto 0);
	-- Data from ADC
    ast_source_data  : out std_logic_vector(23 downto 0) := (others => '0');
    ast_source_ready : in  std_logic;
    ast_source_valid : out std_logic                     := '0';
    ast_source_error : out std_logic_vector(1 downto 0)  := (others => '0');
    -- IIS Interface --
    bitclk           : in  std_logic;
    adcdat           : in  std_logic;
    dacdat           : out std_logic                     := '0';
    adclrck          : in  std_logic;
    daclrck          : in  std_logic

    );
end entity iis2st;


-------------------------------------------------------------------------------
-- Functional version of iis2st 
-- For simulation / test ONLY!
-------------------------------------------------------------------------------
architecture functional of iis2st is

begin

 -----------------------------------------------------------------------------
 -- This process de-serializes the IIS data stream and
 -- creates the appropriate ST-BUS handshaking
 -- It converts the IIS' LEFT channel only! to an ST-BUS 
 -- signal with the following parameteres:
 -- 8 bit/symbol ; 24-bits/beat ; NO backpressure
 -- NOTE! it uses "wait for" etc and can absolutely NOT
 -- be compiled to real FPGA hardware. It is solely for
 -- simulation / testing
 -----------------------------------------------------------------------------
 IIS2ST : process
   variable bitcount            : integer range 0 to 23         := 0;
   variable st_source_data_temp : std_logic_vector(23 downto 0) := (others => '0');
 begin
   wait until adclrck = '0';
   wait for bitperiod;
   wait until bitclk = '1';
   for bitcount in 23 downto 0 loop    --shift register
     st_source_data_temp(bitcount) := adcdat;
     wait for bitperiod;
   end loop;
   wait until adclrck = '1';
   ast_source_valid <= '0';
   ast_source_data  <= st_source_data_temp;
   ast_source_valid <= '1';
 end process;

 ST2IIS : process
   variable bitcount          : integer range 0 to 23;
   variable st_sink_data_temp : std_logic_vector(23 downto 0) := (others => '0');
 begin
   wait until daclrck = '0';
   wait for bitperiod;
   if ast_sink_valid = '1' then
     st_sink_data_temp := ast_sink_data;
   end if;
   for bitcount in 23 downto 0 loop    --shift register
     dacdat <= st_sink_data_temp(bitcount);
     wait for bitperiod;
   end loop;
   dacdat <= '0';
 end process;

 ast_source_error <= (others => '0');
 ast_sink_ready   <= '1';
  
end architecture;


-------------------------------------------------------------------------------
-- RTL version of iis2st 
-- For actual implementation
-------------------------------------------------------------------------------
architecture rtl of iis2st is

  -- Build an enumerated type for the state machine
  type state_type is (idle, sample_bit, latch_word, wait_for_daclrck_high );

  -- Register to hold the current state
  signal i2s_state : state_type;
  signal s2i_state : state_type;
  signal adc_data : std_logic_vector(23 downto 0) := (others => '0');
  signal dac_data : std_logic_vector(23 downto 0) := (others => '0');
  signal adc_data_req, adc_data_ack : std_logic := '0';

begin

  -- purpose: Converts IIS to ST format
  -- type   : sequential
  -- inputs : clk, reset_n
  -- outputs: 
  IIS2ST_proc : process (bitclk, ast_reset_n)
    variable bit_count : integer range 0 to 23;
    variable data      : std_logic_vector(23 downto 0) := (others => '0');
  begin  -- process IIS2ST_proc
    if ast_reset_n = '0' then               -- asynchronous reset (active low)
		bit_count := 0;
		data := (others => '0');
		i2s_state <= idle;
    elsif bitclk'event and bitclk = '1' then  -- rising bitclk edge 
      case i2s_state is
        when idle=>
          if adclrck = '0' then
            i2s_state <= sample_bit;
          end if;
        when sample_bit =>
          data(23 - bit_count) := adcdat;
          if bit_count < 23 then
            bit_count := bit_count + 1;
          else
            i2s_state     <= latch_word;
            bit_count := 0;
          end if;
        when latch_word =>
          --adc_data <= data;
		  ast_source_data <= data;
          i2s_state <= wait_for_daclrck_high;
        when wait_for_daclrck_high =>
          if daclrck = '1' then
            i2s_state <= idle;
          end if;
        when others =>
	      i2s_state <= idle;
      end case;
    end if;
  end process IIS2ST_proc;

  -- purpose: Converts IIS to ST format
  -- type   : sequential
  -- inputs : clk, ast_reset_n
  -- outputs: 
  ST2IIS_proc : process (bitclk, ast_reset_n)
    variable bit_count : integer range 0 to 23;
    --variable dac_data : std_logic_vector(23 downto 0) := (others => '0');
  begin  -- process IIS2ST_proc
    if ast_reset_n = '0' then               -- asynchronous reset (active low)
      s2i_state <= idle;
      dacdat <= '0';
      bit_count := 0;
	  --dac_data := (others => '0');
    elsif bitclk'event and bitclk = '0' then  -- falling bitclk edge
      case s2i_state is
        when idle=>
		  if daclrck = '0' then
			--dac_data := ast_sink_data;
            s2i_state <= sample_bit;
            dacdat <= dac_data(23);
          end if;
        when sample_bit =>
          dacdat <= dac_data(22 - bit_count);
          if bit_count < 22 then
            bit_count := bit_count + 1;
          else
            s2i_state <= wait_for_daclrck_high;
            bit_count := 0;
          end if;
        when wait_for_daclrck_high =>
          dacdat <= '0';
          if daclrck = '1' then
            s2i_state <= idle;
          end if;
        when others =>
          s2i_state <= idle;
      end case;
    end if;
  end process ST2IIS_proc;
  
  ast_source_valid <= '1';
  ast_source_error <= (others => '0');
  ast_sink_ready <= '1';
  
  -- latch_to_st_bus : process (ast_clk_48K, ast_reset_n)
  -- begin  
    -- if ast_reset_n = '0' then               -- asynchronous reset (active low)
      -- ast_source_data  <= (others => '0');
    -- elsif ast_clk_48K'event and ast_clk_48K = '1' then  -- rising clock edge
      -- if ast_source_ready = '1' then
		-- ast_source_data  <= adc_data;
	  -- end if;
    -- end if;
  -- end process latch_to_st_bus;

  latch_to_iis_bus : process (ast_clk_48K, ast_reset_n)
  begin  
    if ast_reset_n = '0' then               -- asynchronous reset (active low)
      dac_data  <= (others => '0');
    elsif ast_clk_48K'event and ast_clk_48K = '0' then  -- falling clock edge
      if ast_sink_valid = '1' then
        dac_data <= ast_sink_data;
      end if;
    end if;
  end process latch_to_iis_bus;
  
end architecture;

