-- Top level wrapper entity
library  ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library STD;
use STD.textio.all;

entity TB_four_bit_adder_TEXTIO is
end TB_four_bit_adder_TEXTIO;

architecture testbench of TB_four_bit_adder_TEXTIO is
signal a, b : std_logic_vector(3 downto 0);
signal sum : std_logic_vector(4 downto 0);
begin
	
	fba : entity work.four_bit_adder port map(a => a, b => b, c => sum);
	
	sim: process
	file my_input : TEXT open READ_MODE is "file_io.in";
	variable my_line : LINE;
	variable a_int, b_int : integer;
	begin
		loop
			exit when endfile(my_input);
			readline(my_input,my_line);
			READ(my_line, a_int);
			
			exit when endfile(my_input);
			readline(my_input,my_line);
			READ(my_line, b_int);
			
			
			
			a <= std_logic_vector(to_unsigned(a_int, a'length));
			b <= std_logic_vector(to_unsigned(b_int, b'length));
			wait for 10 ns;
				
			assert unsigned(sum) = to_unsigned(a_int+b_int,sum'length)
				report "four_bit_adder wrong calculation a=> " & integer'image(to_integer(unsigned(a))) & " b=> " & integer'image(to_integer(unsigned(b))) & " and sum is => " & integer'image(to_integer(unsigned(sum))) & " excpected to be => " & integer'image(a_int+b_int)
				severity failure;

		end loop;
		
		wait;
	end process;
	
end testbench;
