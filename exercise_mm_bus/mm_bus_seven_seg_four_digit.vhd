library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mm_bus_seven_seg_four_digit is
  
  port (
    -- Avalon Interface
    csi_clockreset_clk     : in  std_logic;                     -- Avalon Clk
    csi_clockreset_reset_n : in  std_logic;                     -- Avalon Reset
    avs_s1_write           : in  std_logic;                     -- Avalon wr
    avs_s1_read            : in  std_logic;                     -- Avalon rd
    avs_s1_chipselect      : in  std_logic;                     -- Avalon cs
    avs_s1_address         : in  std_logic_vector(7 downto 0);  -- Avalon address
    avs_s1_writedata       : in  std_logic_vector(15 downto 0); -- Avalon wr data
    avs_s1_readdata        : out std_logic_vector(15 downto 0); -- Avalon rd data
    -- 7-Segment Displays
    hex0 : out std_logic_vector(6 downto 0);
    hex1 : out std_logic_vector(6 downto 0);
    hex2 : out std_logic_vector(6 downto 0);
    hex3 : out std_logic_vector(6 downto 0));
end mm_bus_seven_seg_four_digit;

architecture behaviour of mm_bus_seven_seg_four_digit is

signal slv_reg0 : std_logic_vector(15 downto 0);

begin
	
	b2s_0 :entity work.bin2sevenseg port map(bin => slv_reg0(3 downto 0), hex => hex0);
	
	b2s_1 :entity work.bin2sevenseg port map(bin => slv_reg0(7 downto 4), hex => hex1);
	
	b2s_2 :entity work.bin2sevenseg port map(bin => slv_reg0(11 downto 8), hex => hex2);
	
	b2s_3 :entity work.bin2sevenseg port map(bin => slv_reg0(15 downto 12), hex => hex3);
	
	
	read_proc: process(csi_clockreset_clk, csi_clockreset_reset_n)
	begin
		if csi_clockreset_reset_n = '0' then
			avs_s1_readdata <= (others => 'Z');
		elsif rising_edge(csi_clockreset_clk) then
			avs_s1_readdata <= (others => 'Z');
			if avs_s1_read = '1' and avs_s1_chipselect = '1' then
				case avs_s1_address is
				when "00000000" =>
					avs_s1_readdata <= slv_reg0;
				when others => 
					avs_s1_readdata <= (others => '0');
				end case;
			end if;
		end if;
	end process;
	
	write_proc: process(csi_clockreset_clk, csi_clockreset_reset_n)
	begin
		if csi_clockreset_reset_n = '0' then
			slv_reg0 <= (others => '0');
		elsif rising_edge(csi_clockreset_clk) then
			slv_reg0 <= slv_reg0;
			if avs_s1_write = '1' and avs_s1_chipselect = '1' then
				case avs_s1_address is
				when "00000000" =>
					slv_reg0 <= avs_s1_writedata;
				when others => NULL;
				end case; 
			end if;
		end if;
	end process;
	
	
-- Functionality 

end behaviour;
