library  ieee;
use ieee.std_logic_1164.all;

-- No default header stored in vhdlConfig.txt
entity full_adder is
   port (
	a, b, carry_in : in std_logic;
	sum, carry : out std_logic
   );
end entity full_adder;

architecture rtl of full_adder is
signal s2a, c2or1, c2or2 : std_logic;
begin
	
	ha1 : entity work.half_adder port map(a => a, b => b, sum => s2a, carry => c2or1);
	ha2 : entity work.half_adder port map(a => s2a, b => carry_in, sum => sum, carry => c2or2);
	
	carry <= c2or1 or c2or2;
	
end architecture rtl;