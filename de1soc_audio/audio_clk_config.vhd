library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity audio_clk_config is
  port (
  sys_clk_50M       : in   std_logic;
  sys_reset         : in   std_logic;
  aud_clk_12M       : out   std_logic;
  aud_reset         : out   std_logic;
  aud_i2c_sdat      : inout std_logic;
  aud_i2c_sclk      : out   std_logic
  );
end entity;

architecture arch of audio_clk_config is
    component audio_clk is
        port (
            ref_clk_clk        : in  std_logic := 'X'; -- clk
            ref_reset_reset    : in  std_logic := 'X'; -- reset
            audio_clk_clk      : out std_logic;        -- clk
            reset_source_reset : out std_logic         -- reset
        );
    end component audio_clk;

    component audio_config is
        port (
            clk         : in    std_logic                     := 'X';             -- clk
            reset       : in    std_logic                     := 'X';             -- reset
            address     : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- address
            byteenable  : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
            read        : in    std_logic                     := 'X';             -- read
            write       : in    std_logic                     := 'X';             -- write
            writedata   : in    std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
            readdata    : out   std_logic_vector(31 downto 0);                    -- readdata
            waitrequest : out   std_logic;                                        -- waitrequest
            I2C_SDAT    : inout std_logic                     := 'X';             -- SDAT
            I2C_SCLK    : out   std_logic                                         -- SCLK
        );
    end component audio_config;

begin

    u0 : component audio_clk
        port map (
            ref_clk_clk        => sys_clk_50M,
            ref_reset_reset    => sys_reset,
            audio_clk_clk      => aud_clk_12M,
            reset_source_reset => aud_reset
        );

    u1 : component audio_config
        port map (
            clk         => sys_clk_50M,
            reset       => sys_reset,
            address     => (others => '0'),
            byteenable  => (others => '0'),
            read        => '0',
            write       => '0',
            writedata   => (others => '0'),
            readdata    => open,
            waitrequest => open,
            I2C_SDAT    => aud_i2c_sdat,
            I2C_SCLK    => aud_i2c_sclk
        );

end architecture;