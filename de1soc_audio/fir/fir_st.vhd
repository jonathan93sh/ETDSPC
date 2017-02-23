library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


 entity fir_st is
 generic(
		filterOrder : integer 	:= 10;
		inputWidth 	: integer 	:= 24;
		coefWidth 	: integer 	:= 8;
		coefShift	: integer	:= 8
		);
  port (
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
    ast_source_error : out std_logic_vector(1 downto 0)
    );
 end entity fir_st;
 
 architecture rtl of fir_st is

 subtype coeff_type is integer range -128 to 127;
 type coeff_array_type is array (0 to filterOrder/2) of coeff_type;

 subtype tap_type is signed(inputWidth-1 downto 0);
 type tap_array_type is array (0 to filterOrder) of tap_type;

 subtype prod_type is signed(inputWidth+coefWidth-1 downto 0);
 type prod_array_type is array (0 to filterOrder/2) of prod_type;

 constant coeff : coeff_array_type := (-1, -3, 0, 24, 65, 86);
 signal tap : tap_array_type;
 signal prod : prod_array_type;
 
 
 begin
	
	ast_source_valid <= '1';
	ast_source_error <= ast_sink_error;
	ast_sink_ready <= '1';
	
	filter : process (clk)
	variable sum : prod_type;
	variable tmp : prod_type;
	begin
		if rising_edge(clk) then
			if reset_n = '0' then
				tap <= (others => (others => '0'));
				prod <= (others => (others => '0'));
				ast_source_data <= (others => '0');
			else
				sum := (others => '0');
				
				tap(0) <= signed(ast_sink_data);
				
				for i in 0 to filterOrder-1 loop
					tap(i+1) <= tap(i);
				end loop;
				
				for i in 0 to (filterOrder/2) loop
					tmp := resize(tap(i) + tap(filterOrder-i), tmp'length); --+ tap(filterOrder-i));
					prod(i) <= resize(tmp * coeff(i), tmp'length);
				end loop;
				
				for i in 0 to (filterOrder/2) loop
					sum := sum + prod(i);
				end loop;
				
				sum := SHIFT_RIGHT(sum, coefShift);
				
				ast_source_data <= std_logic_vector(resize(sum, ast_source_data'length) );--sum(sum'high downto sum'high-inputWidth+1));
			end if;
		end if;
	end process;
 
 end;