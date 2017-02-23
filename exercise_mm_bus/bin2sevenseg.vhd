library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2sevenseg is

  port (
    bin : in  std_logic_vector(3 downto 0);   -- bin input
    hex : out std_logic_vector(6 downto 0));  -- 7-seg output
    
end bin2sevenseg;

architecture behavioural of bin2sevenseg is

begin  -- behavioural

  -- purpose: converts bin to hex
  -- type   : combinational
  -- inputs : bin
  -- outputs: hex
  code_hex: process (bin)
  begin  -- process code_hex
    case bin is
      when "0000" => hex <= "1000000";  -- 0
      when "0001" => hex <= "1111001";  -- 1
      when "0010" => hex <= "0100100";  -- 2
      when "0011" => hex <= "0110000";  -- 3
      when "0100" => hex <= "0011001";  -- 4
      when "0101" => hex <= "0010010";  -- 5
      when "0110" => hex <= "0000010";  -- 6
      when "0111" => hex <= "1111000";  -- 7
      when "1000" => hex <= "0000000";  -- 8
      when "1001" => hex <= "0011000";  -- 9
      when "1010" => hex <= "0001000";  -- a
      when "1011" => hex <= "0000011";  -- b
      when "1100" => hex <= "1000110";  -- c
      when "1101" => hex <= "0100001";  -- d
      when "1110" => hex <= "0000110";  -- e
      when "1111" => hex <= "0001110";  -- f
      when others => null;
    end case;
  end process code_hex;

end behavioural;


