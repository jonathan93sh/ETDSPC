library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- No default header stored in vhdlConfig.txt
entity tb_clock_gen is
end entity tb_clock_gen;

architecture tb of tb_clock_gen is

-- Signal declarations
signal   clk       : std_logic := '0';
signal   reset_n   : std_logic;
signal   clk_out   : std_logic;

--! Component declaration for clock_gen
component clock_gen is
  generic (
    count_max : integer := 1042 
  );
  port (
    clk : in std_logic := '0';
    reset_n : in std_logic := '0';
	clk_out : out std_logic := '0'
  );
end component;
begin

clk <= not clk after 1 ns;
reset_n <= '0', '1' after 7 ns;

   --! Port map declaration for clock_gen
   comp_clock_gen : clock_gen
      generic map (
                   count_max => 1042
   )
      port map (
                clk     => clk,
                reset_n => reset_n,
                clk_out => clk_out
   );

end architecture tb;