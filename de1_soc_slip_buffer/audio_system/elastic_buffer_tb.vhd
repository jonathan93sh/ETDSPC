library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


--------------------------------------------------------------------------------
entity  tb_elastic_buffer is

end entity ;
--------------------------------------------------------------------------------


architecture Bhv of tb_elastic_buffer is
  -----------------------------
  -- Port Signals 
  -----------------------------
signal   reset_n            : std_logic:='1';
signal   clk_a              : std_logic:='0';
signal   ast_clk_a          : std_logic:='0';
signal   ast_sink_data_a    : std_logic_vector(23 downto 0):=X"000001";
signal   ast_sink_ready_a   : std_logic:='1';
signal   ast_sink_valid_a   : std_logic:='1';
signal   ast_sink_error_a   : std_logic_vector(1 downto 0):="00";
signal   ast_source_data_a  : std_logic_vector(23 downto 0):=X"000002";
signal   ast_source_ready_a : std_logic:='1';
signal   ast_source_valid_a : std_logic:='1';
signal   ast_source_error_a : std_logic_vector(1 downto 0):="00";
signal   clk_b              : std_logic:='0';
signal   ast_clk_b          : std_logic:='0';
signal   ast_sink_data_b    : std_logic_vector(23 downto 0):=X"000002";
signal   ast_sink_ready_b   : std_logic:='1';
signal   ast_sink_valid_b   : std_logic:='1';
signal   ast_sink_error_b   : std_logic_vector(1 downto 0):="00";
signal   ast_source_data_b  : std_logic_vector(23 downto 0):=X"000002";
signal   ast_source_ready_b : std_logic:='1';
signal   ast_source_valid_b : std_logic:='1';
signal   ast_source_error_b : std_logic_vector(1 downto 0):="00";

signal   bypass_filter      : std_logic:='0';
  
begin  -- architecture Bhv

  -----------------------------
  -- component instantiation 
  -----------------------------
  elastic_buffer_INST: entity work.elastic_buffer
   port map (
	  bypass_filter      => bypass_filter,
      clk_a              => clk_a,
      ast_clk_a          => ast_clk_a,
      reset_a_n          => reset_n,
      ast_sink_data_a    => ast_sink_data_a,
      ast_sink_ready_a   => ast_sink_ready_a,
      ast_sink_valid_a   => ast_sink_valid_a,
      ast_sink_error_a   => ast_sink_error_a,
      ast_source_data_a  => ast_source_data_a,
      ast_source_ready_a => ast_source_ready_a,
      ast_source_valid_a => ast_source_valid_a,
      ast_source_error_a => ast_source_error_a,
      clk_b              => clk_b,
      ast_clk_b          => ast_clk_b,
      reset_b_n          => reset_n,
      ast_sink_data_b    => ast_sink_data_b,
      ast_sink_ready_b   => ast_sink_ready_b,
      ast_sink_valid_b   => ast_sink_valid_b,
      ast_sink_error_b   => ast_sink_error_b,
      ast_source_data_b  => ast_source_data_b,
      ast_source_ready_b => ast_source_ready_b,
      ast_source_valid_b => ast_source_valid_b,
      ast_source_error_b => ast_source_error_b);

	  clk_b <= not clk_b after 1 ns;
	  clk_a <= not clk_a after 1.5 ns;
	  ast_clk_a <= not ast_clk_a after 150 ns;
	  ast_clk_b <= not ast_clk_b after 100 ns;
	  
	reset_n <= '0', '1' after 20 ns;
	
  StimuliProcess : process
  begin

  wait until ast_clk_b = '1';
  ast_sink_data_b <= std_logic_vector(unsigned(ast_sink_data_b) + X"000001");
  ast_sink_data_a <= std_logic_vector(unsigned(ast_sink_data_a) + X"000001");
  
  end process StimuliProcess;
  
end architecture Bhv;