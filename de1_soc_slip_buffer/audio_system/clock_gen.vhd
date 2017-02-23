library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
--library unisim;
--use unisim.vcomponents.all;

entity clock_gen is
  generic (
    count_max : integer := 1042 -- ~50MHz/48Kz
  );
  port (
    clk : in std_logic := '0';
    reset_n : in std_logic := '0';
	clk_out : out std_logic := '0'
  );
end entity;

architecture arch of clock_gen is
signal count : integer range 0 to count_max;

begin

clk_proc: process (clk)
begin
  if reset_n = '0' then
    count <= 0;
	clk_out <= '0';
  elsif rising_edge(clk) then
    count <= count + 1;
	if count < count_max/2 then
	  clk_out <= '0';
	elsif count_max/2 <= count and count < count_max-1 then
	  clk_out <= '1';
	else
	  clk_out <= '0';
	  count <= 0;
	end if;
  end if;
end process;

end architecture;

