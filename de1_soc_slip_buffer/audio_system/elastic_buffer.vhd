library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity elastic_buffer is
  port (
    -- Common --
    bypass_filter      : in  std_logic;

    -- Side A --
    clk_a              : in  std_logic;   -- 12.288 MHz
    ast_clk_a          : in  std_logic;   -- 48KHz
    reset_a_n          : in  std_logic;
    ast_sink_data_a    : in  std_logic_vector(23 downto 0);
    ast_sink_ready_a   : out std_logic := '0'; -- Value at startup
    ast_sink_valid_a   : in  std_logic;  
    ast_sink_error_a   : in  std_logic_vector(1 downto 0);
    ast_source_data_a  : out std_logic_vector(23 downto 0):=(others=>'0');
    ast_source_ready_a : in  std_logic;
    ast_source_valid_a : out std_logic:= '0';
    ast_source_error_a : out std_logic_vector(1 downto 0):=(others=>'0');

    -- Side B --
    clk_b              : in  std_logic;   -- 12.288 MHz
    ast_clk_b          : in  std_logic;   -- 48KHz
    reset_b_n          : in  std_logic;
    ast_sink_data_b    : in  std_logic_vector(23 downto 0);
    ast_sink_ready_b   : out std_logic := '0'; -- Value at startup
    ast_sink_valid_b   : in  std_logic;  
    ast_sink_error_b   : in  std_logic_vector(1 downto 0);
    ast_source_data_b  : out std_logic_vector(23 downto 0):=(others=>'0');
    ast_source_ready_b : in  std_logic;
    ast_source_valid_b : out std_logic:= '0';
    ast_source_error_b : out std_logic_vector(1 downto 0):=(others=>'0')
    );

end elastic_buffer;

architecture behaviour of elastic_buffer is
signal slip, ast_clk_a_last  : std_logic := '0';
signal ast_source_data_b_bp  : std_logic_vector(23 downto 0);
signal ast_source_valid_b_bp : std_logic;
signal ast_source_error_b_bp : std_logic_vector(1 downto 0);
signal ast_sink_ready_a_bp : std_logic;
signal ast_source_data_a_bp  : std_logic_vector(23 downto 0);
signal ast_source_valid_a_bp : std_logic;
signal ast_source_error_a_bp : std_logic_vector(1 downto 0);
signal ast_sink_ready_b_bp : std_logic;

signal ast_source_data_b_sb  : std_logic_vector(23 downto 0);
signal ast_source_valid_b_sb : std_logic;
signal ast_source_error_b_sb : std_logic_vector(1 downto 0);
signal ast_sink_ready_a_sb   : std_logic;
signal ast_source_data_a_sb  : std_logic_vector(23 downto 0);
signal ast_source_valid_a_sb : std_logic;
signal ast_source_error_a_sb : std_logic_vector(1 downto 0);
signal ast_sink_ready_b_sb   : std_logic;

signal sink_a, source_a, sink_b, source_b : std_logic_vector(27 downto 0);

begin

  -- (Un)Bundle data for Push-Synchronizer
  sink_a(27 downto 4) <= ast_sink_data_a;
  sink_a(3 downto 2)  <= ast_sink_error_a;
  sink_a(1) <= ast_sink_valid_a;
  sink_a(0) <= ast_source_ready_a;
  
  sink_b(27 downto 4) <= ast_sink_data_b;
  sink_b(3 downto 2) <= ast_sink_error_b;
  sink_b(1) <= ast_sink_valid_b;
  sink_b(0) <= ast_source_ready_b;

  ast_source_data_b_sb  <= source_b(27 downto 4);
  ast_source_error_b_sb <= source_b(3 downto 2);
  ast_source_valid_b_sb <= source_b(1);
  ast_sink_ready_b_sb   <= source_b(0);

  ast_source_data_a_sb  <= source_a(27 downto 4);
  ast_source_error_a_sb <= source_a(3 downto 2);
  ast_source_valid_a_sb <= source_a(1);
  ast_sink_ready_a_sb   <= source_a(0);
  

  -- Mute output until push_synchronizer is implemented
  --source_b <= "0000000000000000000000000011";
  --source_a <= "0000000000000000000000000011";
  
-- ADC data to system
push_synchronizer_1: entity work.push_synchronizer
  generic map (
    NbrBits   => 28)
  port map (
      tx_clk   => clk_b,
      tx_reset_n => reset_b_n,
      rx_clk   => clk_a,
      rx_reset_n => reset_a_n,
      tx_sync  => ast_clk_b,
      rx_sync  => ast_clk_a,
      tx_data  => sink_b,
      rx_data  => source_a);

-- System data to DAC 
push_synchronizer_2: entity work.push_synchronizer
  generic map (
    NbrBits   => 28)
    port map (
      tx_clk   => clk_a,
      tx_reset_n => reset_a_n,
      rx_clk   => clk_b,
      rx_reset_n => reset_b_n,
      tx_sync  => ast_clk_a,
      rx_sync  => ast_clk_b,
      tx_data  => sink_a,
      rx_data  => source_b);


-- Sample 'a' domain data in 'b' domain
-- Creates cracks and pops in sound
  A2B_proc : process (ast_clk_b)
  begin  -- process IIS2ST_proc
    if ast_clk_b'event and ast_clk_b = '1' then  -- rising clock edge
     ast_source_data_b_bp <= ast_sink_data_a;
     ast_source_valid_b_bp <= ast_sink_valid_a;
     ast_source_error_b_bp <= ast_sink_error_a;
     ast_sink_ready_b_bp <= ast_source_ready_a;
   end if;
end process;
		
-- Sample 'b' domain data in 'a' domain
B2A_proc : process (ast_clk_a)
  begin  -- process IIS2ST_proc
	if ast_clk_a'event and ast_clk_a = '1' then  -- rising clock edge
		ast_source_data_a_bp <= ast_sink_data_b;
		ast_source_valid_a_bp <= ast_sink_valid_b;
		ast_source_error_a_bp <= ast_sink_error_b;
		ast_sink_ready_a_bp <= ast_source_ready_b;
	end if;
end process;

-- ST-Bus Switching
ast_source_data_a <= ast_source_data_a_bp when bypass_filter = '1' else
                     ast_source_data_a_sb;
ast_source_valid_a <= ast_source_valid_a_bp when bypass_filter = '1' else
                     ast_source_valid_a_sb;
ast_source_error_a <= ast_source_error_a_bp when bypass_filter = '1' else
                     ast_source_error_a_sb;
ast_sink_ready_a <= ast_sink_ready_a_bp when bypass_filter = '1' else
                     ast_sink_ready_a_sb;

ast_source_data_b <= ast_source_data_b_bp when bypass_filter = '1' else
                     ast_source_data_b_sb;
ast_source_valid_b <= ast_source_valid_b_bp when bypass_filter = '1' else
                     ast_source_valid_b_sb;
ast_source_error_b <= ast_source_error_b_bp when bypass_filter = '1' else
                     ast_source_error_b_sb;
ast_sink_ready_b <= ast_sink_ready_b_bp when bypass_filter = '1' else
                     ast_sink_ready_b_sb;


end behaviour;
