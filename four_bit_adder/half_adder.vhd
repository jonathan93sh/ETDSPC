library  ieee;
use ieee.std_logic_1164.all;

-- No default header stored in vhdlConfig.txt
entity half_adder is
   port (
	a, b : in std_logic;
	sum, carry : out std_logic
   );
end entity half_adder;

architecture rtl of half_adder is

begin
	sum <= a xor b;
	
	carry <= a and b;
	
end architecture rtl;