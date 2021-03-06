-- Top level wrapper entity
library  ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_four_bit_adder is
end TB_four_bit_adder;

architecture testbench of TB_four_bit_adder is
signal a, b : std_logic_vector(3 downto 0);
signal sum : std_logic_vector(4 downto 0);
begin
	
	fba : entity work.four_bit_adder port map(a => a, b => b, c => sum);
	
	sim: process
	begin
		for a_int in ((2**a'length)-1) downto 0 loop
			for b_int in ((2**b'length)-1) downto 0 loop
				a <= std_logic_vector(to_unsigned(a_int, a'length));
				b <= std_logic_vector(to_unsigned(b_int, b'length));
				wait for 10 ns;
				
				assert unsigned(sum) = to_unsigned(a_int+b_int,sum'length)
					report "four_bit_adder wrong calculation a=> " & integer'image(to_integer(unsigned(a))) & " b=> " & integer'image(to_integer(unsigned(b))) & " and sum is => " & integer'image(to_integer(unsigned(sum))) & " excpected to be => " & integer'image(a_int+b_int)
					severity failure;
				
			end loop;
		end loop;
		
		wait;
	end process;
	
end testbench;
