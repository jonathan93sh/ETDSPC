-- Top level wrapper entity
library  ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ex_four_bit_adder is
	port(SW   : in  std_logic_vector(9 downto 0);
		 LEDR : out std_logic_vector(4 downto 0)); 
end ex_four_bit_adder;

architecture structural of ex_four_bit_adder is
signal a, b : std_logic_vector(3 downto 0);
signal sum : std_logic_vector(4 downto 0);
 begin
	
	a <= SW(7 downto 4);
	b <= SW(3 downto 0);
	
	fba : entity work.four_bit_adder port map(a => a, b => b, c => sum);
	
	with SW(9 downto 8) select
		LEDR <= std_logic_vector(resize(unsigned(a),5) + resize(unsigned(b),5)) when "00",
					std_logic_vector(resize(signed(a),5) + resize(signed(b),5)) when "01",
					sum when "10",
					(others => '0') when others;
		
	
	
	
	

	
 -- Instantiate your top-level entity here 
 -- and map its ports to DE2 board 
 -- connections, ex SW(0) and LEDR(1)
	
	end structural;