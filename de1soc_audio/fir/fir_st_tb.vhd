library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity fir_st_tb is
end;

architecture bench of fir_st_tb is

component fir_st 
	generic(
		filterOrder : integer 	:= 10;
		inputWidth 	: integer 	:= 24;
		coefWidth 	: integer 	:= 8;
		coefShift	: integer	:= 8
		);
	port(
    -- Common --
    clk              : in  std_logic;   -- 48KHz
    reset_n          : in  std_logic;
    -- ST Bus --
    ast_sink_data    : in  std_logic_vector(inputWidth-1 downto 0);
    ast_sink_ready   : out std_logic;
    ast_sink_valid   : in  std_logic;
    ast_sink_error   : in  std_logic_vector(1 downto 0);
    ast_source_data  : out std_logic_vector(inputWidth-1 downto 0);
    ast_source_ready : in  std_logic;
    ast_source_valid : out std_logic;
    ast_source_error : out std_logic_vector(1 downto 0));
	end component;

    -- Common --
signal    clk              :  std_logic := '1';   -- 48KHz
signal    reset_n          :  std_logic := '0';
    -- ST Bus --
signal    ast_sink_data    :  std_logic_vector(24-1 downto 0) := (others =>'0');
signal    ast_sink_ready   :  std_logic;
signal    ast_sink_valid   :  std_logic;
signal    ast_sink_error   :  std_logic_vector(1 downto 0);
signal    ast_source_data  :  std_logic_vector(24-1 downto 0);
signal    ast_source_ready :  std_logic;
signal    ast_source_valid :  std_logic;
signal    ast_source_error :  std_logic_vector(1 downto 0);

constant periode : time := 20833 ns;
begin
	
	
	
	UUT : entity work.fir_st port map(
								clk => clk,
								reset_n => reset_n,
								ast_sink_data => ast_sink_data,
								ast_sink_ready => ast_sink_ready,
								ast_sink_valid => ast_sink_valid,
								ast_sink_error => ast_sink_error,
								ast_source_data => ast_source_data,
								ast_source_ready => ast_source_ready,
								ast_source_valid => ast_source_valid,
								ast_source_error => ast_source_error
								);
	
	reset_n <= '0', '1' after periode * 2;
		
	clk_gen : process
	begin
		

			clk <= not clk;
			wait for periode/2;
			clk <= not clk;
			wait for periode/2;
			
	end process;
	
	sim : process
	begin
		wait until reset_n = '1';
		
		wait until clk = '1';
		
		ast_sink_data <= std_logic_vector(to_signed(2**22 - 1, 24));
		
		for i in 15 downto 0 loop
		wait until clk = '1';
		end loop;
		ast_sink_data <= (others => '0');
		
		wait;
		
	end process;
	
end;