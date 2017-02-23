library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity iis2st_tb is
end;

architecture bench of iis2st_tb is

  component iis2st
    generic (
      bitperiod : time);
    port (
      clk              : in  std_logic;
      reset_n          : in  std_logic;
      ast_sink_data    : in  std_logic_vector(23 downto 0);
      ast_sink_ready   : out std_logic;
      ast_sink_valid   : in  std_logic;
      ast_sink_error   : in  std_logic_vector(1 downto 0);
      ast_source_data  : out std_logic_vector(23 downto 0);
      ast_source_ready : in  std_logic;
      ast_source_valid : out std_logic;
      ast_source_error : out std_logic_vector(1 downto 0);
      bitclk           : in  std_logic;
      adcdat           : in  std_logic;
      dacdat           : out std_logic;
      adclrck          : in  std_logic;
      daclrck          : in  std_logic
      );
  end component;

  signal reset_n          : std_logic                     := '0';
  signal ast_data         : std_logic_vector(23 downto 0);
  signal ast_ready        : std_logic                     := '1';
  signal ast_valid        : std_logic;
  signal ast_error        : std_logic_vector(1 downto 0);
  signal adcdat           : std_logic                     := '0';
  signal adclrck          : std_logic                     := '0';
  signal dacdat           : std_logic                     := '0';
  signal daclrck          : std_logic                     := '0';
  signal bitclk           : std_logic                     := '0';
  signal i2svalue         : unsigned(23 downto 0)         := X"153000";

  -- clock
  constant bitperiod    : time := 10 ns;    -- clk period time
  constant sampleperiod : time := 3000 ns;  -- clk period time
  
  --procedures
  
	procedure impulse(bitclk, adclrck : in std_logic; value : in integer range 0 to ((2**24)-1); signal adcdat : out std_logic) is
	variable tmp : std_logic_vector(23 downto 0);
	begin
		tmp := std_logic_vector(to_unsigned(value, 24));
		
		wait for bitperiod;
		
		for i in 23 downto 0 loop
			adcdat <= tmp(i);
			wait for bitperiod;
		end loop;
		adcdat <= '0';
	end impulse;
  
begin

  iis2st_inst : iis2st
    generic map (
      bitperiod => bitperiod)
    port map (
      clk              => adclrck,       --48KHz Clock
      reset_n          => reset_n,
      ast_sink_data    => ast_data,
      ast_sink_ready   => ast_ready,
      ast_sink_valid   => ast_valid,
      ast_sink_error   => ast_error,
      ast_source_data  => ast_data,
      ast_source_ready => ast_ready,
      ast_source_valid => ast_valid,
      ast_source_error => ast_error,
      bitclk           => bitclk,
      adcdat           => adcdat,
      dacdat           => dacdat,
      adclrck          => adclrck,
      daclrck          => daclrck);

  -- clock generation
  bitclk <= not bitclk after bitperiod/2;
  adclrck <= not adclrck after sampleperiod/2;
  daclrck <= not daclrck after sampleperiod/2;

  -- reset generation
  reset_n         <= '0', '1' after 125 ns;

  -----------------------------------------------------------------------------
  -- IIS data generation procedure
  -- LEFT Channel ONLY!
  --          ___                             ____...______
  -- adclrck:    \________...________________/            
  --                  ____..._____
  -- adcdat: ________/  i2svalue  \_______________...______
  --            _   _   _    _   _   _   _   _   _      _
  -- bitclk   _/ \_/ \_/ \... \_/ \_/ \_/ \_/ \_/ ... _/ \_
  -----------------------------------------------------------------------------

  -- Create a IIS data generation process here..
  -- Use the i2svalue as input
  

  -----------------------------------------------------------------------------
  -- Stimulus process
  -- Does nothing but wait
  -----------------------------------------------------------------------------
  stimulus : process
  begin
    
    wait until reset_n = '1';
    --wait until adclrck = '1';
	wait until adclrck = '0';
	impulse(bitclk, adclrck, to_integer(i2svalue), adcdat);
	
    -- YOU COULD DO SOME SEQUENTIAL STUFF HERE
--	for i in 9 downto 0 loop
--		adcdat <= '0';
--		wait for 100 us;
--		adcdat <= '1';
--		wait for 100 us;
--	end loop;
	
    wait;
  end process;

end;  -- Architecture


-------------------------------------------------------------------------------
-- Functional simulation of iis/st-bus bridge
-------------------------------------------------------------------------------
configuration functional_sim_cfg of iis2st_tb is  -- config name of arch
  for bench                                       -- TB architecture name
    for iis2st_inst : iis2st                      -- For the specific instance
      use entity work.iis2st(functional);         -- use its "functional" arch
    end for;
  end for;
end functional_sim_cfg;

-------------------------------------------------------------------------------
-- RTL simulation of iis/st-bus bridge
-------------------------------------------------------------------------------
configuration rtl_sim_cfg of iis2st_tb is  -- config name of arch
  for bench                                -- TB architecture name
    for iis2st_inst : iis2st               -- For the specific instance
      use entity work.iis2st(rtl);         -- use its "functional" arch
    end for;
  end for;
end rtl_sim_cfg;

-------------------------------------------------------------------------------
