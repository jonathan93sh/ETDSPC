library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity reset_logic is
  port (
    clock_50 : in std_logic;
	reset_n  : in std_logic;
	debug_reset : out std_logic;
	cold_reset : out std_logic;
	warm_reset : out std_logic
  );
end entity;

architecture arch of reset_logic is
 
signal reset_req : std_logic_vector(2 downto 0);
 
component hps_reset is
	port (
		source_clk : in std_logic;
		source : out std_logic_vector(2 downto 0));
end component hps_reset;


component altera_edge_detector is
	generic (
		PULSE_EXT : integer;
		EDGE_TYPE : integer;
		IGNORE_RST_WHILE_BUSY : integer);
	port(
		clk    : in std_logic;
		rst_n  : in std_logic;
		signal_in : in std_logic;
		pulse_out : out std_logic);
end component; 

begin

hps_reset_inst: component hps_reset
	port map (
  source_clk => clock_50,
  source     => reset_req
);

pulse_cold_reset: component altera_edge_detector
	generic map (
		PULSE_EXT => 6,
		EDGE_TYPE => 1,
		IGNORE_RST_WHILE_BUSY => 1
	)
	port map (
		clk    => clock_50,
		rst_n  => reset_n,
      signal_in => reset_req(0),
		pulse_out => cold_reset
	);

pulse_warm_reset: component altera_edge_detector
	generic map (
		PULSE_EXT => 2,
		EDGE_TYPE => 1,
		IGNORE_RST_WHILE_BUSY => 1
	)
	port map (
		clk    => clock_50,
		rst_n  => reset_n,
        signal_in => reset_req(1),
		pulse_out => warm_reset
	);	
	
pulse_debug_reset: component altera_edge_detector
	generic map (
		PULSE_EXT => 32,
		EDGE_TYPE => 1,
		IGNORE_RST_WHILE_BUSY => 1
	)
	port map (
		clk    => clock_50,
		rst_n  => reset_n,
        signal_in => reset_req(2),
		pulse_out => debug_reset
	);	

end architecture;

