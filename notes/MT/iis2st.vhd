library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity iis2st is
  generic (bitperiod : time := 20 ns);  -- Default value
  port (
    -- Common --
    clk              : in  std_logic;
    reset_n          : in  std_logic;
    -- ST Bus --
    ast_sink_data    : in  std_logic_vector(23 downto 0);
    ast_sink_ready   : out std_logic := '0'; -- Value at startup
    ast_sink_valid   : in  std_logic;  
    ast_sink_error   : in  std_logic_vector(1 downto 0);
    ast_source_data  : out std_logic_vector(23 downto 0):=(others=>'0');
    ast_source_ready : in  std_logic;
    ast_source_valid : out std_logic:= '0';
    ast_source_error : out std_logic_vector(1 downto 0):=(others=>'0');
    -- IIS Interface --
    bitclk           : in  std_logic;
    adcdat           : in  std_logic;
    dacdat           : out std_logic := '0';
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
    variable bitcount          : integer range 0 to 23 := 0;
    variable st_source_data_temp : std_logic_vector(23 downto 0):=(others=>'0');
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
    variable bitcount            : integer range 0 to 23;
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

  ast_source_error <= (others=>'0');
  ast_sink_ready <= '1';
  
end architecture;


-------------------------------------------------------------------------------
-- RTL version of iis2st 
-- For actual implementation
-------------------------------------------------------------------------------
architecture rtl of iis2st is

-- IIS2ST

signal adclrck_pre : std_logic;
signal bitSelect : integer range 0 to ast_source_data'high;
signal ast_source_data_tmp : std_logic_vector(ast_source_data'range);
signal ast_source_valid_tmp, ast_done : std_logic;
 

 --ST2IIS
 
 signal daclrck_pre, sink_done : std_logic;
 signal ast_sink_data_tmp : std_logic_vector(ast_sink_data'range);
 signal sink_bitSelect : integer range 0 to ast_source_data'high;
 
 
begin
	
	IIS2ST: process(bitclk, reset_n)
	begin
		if reset_n = '0' then
			ast_source_valid <= '0';
			ast_source_valid_tmp <= '0';
			ast_source_data <= (others => '0');
			ast_source_data_tmp <= (others => '0');
			ast_done <= '1';
			bitSelect <= ast_source_data'high;
		elsif rising_edge(bitclk) then
			ast_source_data_tmp <= ast_source_data_tmp;
			if adclrck = '1' and adclrck_pre = '0' then
				bitSelect <= ast_source_data'high;
				ast_source_data <= ast_source_data_tmp;
				ast_source_valid_tmp <= '0';
				ast_done <= '0';
				ast_source_valid <= '1';
			elsif adclrck = '0' and adclrck_pre = '1' then
				bitSelect <= ast_source_data'high;
				ast_source_valid_tmp <= '0';
				ast_done <= '0';
				ast_source_valid <= '1';
			elsif adclrck = '0' and ast_done = '0' then
				ast_source_data_tmp(bitSelect) <= adcdat;
				if bitSelect = 0 then
					ast_done <= '1';
				else
					bitSelect <= bitSelect - 1;
				end if;
			end if;
			
			adclrck_pre <= adclrck;
		end if;
	end process;
	
	ST2IIS: process(bitclk, reset_n)
	begin
		if reset_n = '0' then
			dacdat <= '0';
			daclrck_pre <= '0';
			sink_bitSelect <= 0;
			sink_done <= '1';
		elsif rising_edge(bitclk) then
			dacdat <= '0';
			if daclrck = '1' and daclrck_pre = '0' then
				sink_done <='0';
				sink_bitSelect <= ast_sink_data'high;
			elsif daclrck = '0' and daclrck_pre = '1' then
				if ast_sink_valid = '1' then
					ast_sink_data_tmp <= ast_sink_data;
				end if;
				sink_done <='0';
				sink_bitSelect <= ast_sink_data'high;
			elsif daclrck = '0' and sink_done = '0' then
				dacdat <= ast_sink_data_tmp(sink_bitSelect);
				if sink_bitSelect = 0 then
					sink_done <='1';
				else
					sink_bitSelect <= sink_bitSelect - 1;
				end if;
			end if;
			
			daclrck_pre <= daclrck;
		end if;
	end process;
	
	
		--ast_source_ready <= '1';
  -- YOUR IMPLEMENTATION CODE HERE!!!
  ast_source_error <= (others=>'1');    -- Just for testing

end architecture;

