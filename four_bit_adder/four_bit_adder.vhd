-- Top level wrapper entity
library  ieee;
use ieee.std_logic_1164.all;

entity four_bit_adder is
	port(A, B : in std_logic_vector(3 downto 0);
		 C : out std_logic_vector(4 downto 0)); 
end four_bit_adder;

architecture structural of four_bit_adder is
signal carry : std_logic_vector(3 downto 0);
begin
	


	
	FA0 : entity work.full_adder port map(a => a(0), b => b(0), carry_in => '0', sum => C(0), carry => carry(0));
	FA1 : entity work.full_adder port map(a => a(1), b => b(1), carry_in => carry(0), sum => C(1), carry => carry(1));
	FA2 : entity work.full_adder port map(a => a(2), b => b(2), carry_in => carry(1), sum => C(2), carry => carry(2));
	FA3 : entity work.full_adder port map(a => a(3), b => b(3), carry_in => carry(2), sum => C(3), carry => C(4));
	
end structural;