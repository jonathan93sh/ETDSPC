library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
--library unisim;
--use unisim.vcomponents.all;

entity audio_system is
  port (
    -- System Clock/Reset --
    sys_clk_50M      : in  std_logic;   --50MHz
    sys_clk_12M      : in  std_logic;   --12.288MHz
    sys_reset_n      : in  std_logic;
    -- Codec Clock/Reset --
    aud_clk_12M      : in  std_logic;   --12.288MHz
    aud_reset_n      : in  std_logic;
    -- IIS Interface --
    bitclk           : in  std_logic;
    adcdat           : in  std_logic;
    dacdat           : out std_logic := '0';
    adclrck          : in  std_logic;
    daclrck          : in  std_logic;

	test             : out  std_logic_vector(1 downto 0);	
	bypass_filter    : in  std_logic

    );
end entity;

architecture arch of audio_system is

signal sys_clk_48K   : std_logic;
signal aud_clk_48K   : std_logic;

signal   ast_from_adc_data    : std_logic_vector(23 downto 0);
signal   ast_from_adc_ready   : std_logic;
signal   ast_from_adc_valid   : std_logic;
signal   ast_from_adc_error   : std_logic_vector(1 downto 0);
signal   ast_to_dac_data  : std_logic_vector(23 downto 0);
signal   ast_to_dac_ready : std_logic;
signal   ast_to_dac_valid : std_logic;
signal   ast_to_dac_error : std_logic_vector(1 downto 0);
signal   ast_loopback_data  : std_logic_vector(23 downto 0);
signal   ast_loopback_ready : std_logic;
signal   ast_loopback_valid : std_logic;
signal   ast_loopback_error : std_logic_vector(1 downto 0);

component iis2st is
  generic (bitperiod : time := 20 ns);  
  port (
    
    ast_clk_48K      : in  std_logic;   
    ast_reset_n      : in  std_logic;
	
    ast_sink_data    : in  std_logic_vector(23 downto 0);
    ast_sink_ready   : out std_logic                     := '0';  
    ast_sink_valid   : in  std_logic;
    ast_sink_error   : in  std_logic_vector(1 downto 0);
	
    ast_source_data  : out std_logic_vector(23 downto 0) := (others => '0');
    ast_source_ready : in  std_logic;
    ast_source_valid : out std_logic                     := '0';
    ast_source_error : out std_logic_vector(1 downto 0)  := (others => '0');
    
    bitclk           : in  std_logic;
    adcdat           : in  std_logic;
    dacdat           : out std_logic                     := '0';
    adclrck          : in  std_logic;
    daclrck          : in  std_logic

    );
end component iis2st;

begin
-- Clock Generation

   -- This clock divider generates a 47.985 KHz clock
   comp_clock_gen : entity work.clock_gen
      generic map (
                   count_max => 1042
   )
      port map (
                clk     => sys_clk_50M,
                reset_n => sys_reset_n,
                clk_out => sys_clk_48K
   );

   -- Codec Domain 48K is exactly 48.000KHz
   aud_clk_48K <= adclrck;  -- 48.000 KHz
   
-- IIS2ST Interface (In Codec Clock Domain)

	test(0) <= aud_clk_48K;
	test(1) <= sys_clk_48K;
	
   comp_iis2st : entity work.iis2st(rtl) --iis2st(rtl)
      port map (
                ast_clk_48K      => aud_clk_48K,
                ast_reset_n      => aud_reset_n,
                ast_sink_data    => ast_to_dac_data,
                ast_sink_ready   => ast_to_dac_ready,
                ast_sink_valid   => ast_to_dac_valid,
                ast_sink_error   => ast_to_dac_error,
                ast_source_data  => ast_from_adc_data,
                ast_source_ready => ast_from_adc_ready,
                ast_source_valid => ast_from_adc_valid,
                ast_source_error => ast_from_adc_error,
                bitclk           => bitclk,
                adcdat           => adcdat,
                dacdat           => dacdat,
                adclrck          => adclrck,
                daclrck          => daclrck
   );
   
-- Elastic Buffer (Codec Clk Domain <-> System Clk Domain)

   comp_elastic_buffer : entity work.elastic_buffer
      port map (
                bypass_filter      => bypass_filter,
				-- System Clock Domain
                clk_a              => sys_clk_12M,
                ast_clk_a          => sys_clk_48K,
                reset_a_n          => sys_reset_n,
                ast_sink_data_a    => ast_loopback_data,
                ast_sink_ready_a   => ast_loopback_ready,
                ast_sink_valid_a   => ast_loopback_valid,
                ast_sink_error_a   => ast_loopback_error,
                ast_source_data_a  => ast_loopback_data,
                ast_source_ready_a => ast_loopback_ready,
                ast_source_valid_a => ast_loopback_valid,
                ast_source_error_a => ast_loopback_error,
				-- Codec Clock Domain
                clk_b              => aud_clk_12M,
                ast_clk_b          => aud_clk_48K,
                reset_b_n          => aud_reset_n,
                ast_sink_data_b    => ast_from_adc_data, 
                ast_sink_ready_b   => ast_from_adc_ready,
                ast_sink_valid_b   => ast_from_adc_valid,
                ast_sink_error_b   => ast_from_adc_error,
                ast_source_data_b  => ast_to_dac_data,
                ast_source_ready_b => ast_to_dac_ready,
                ast_source_valid_b => ast_to_dac_valid,
                ast_source_error_b => ast_to_dac_error
   );
  
end architecture;

