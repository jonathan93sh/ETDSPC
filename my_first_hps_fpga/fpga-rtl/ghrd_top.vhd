-- ============================================================================
-- Copyright (c) 2013 by Terasic Technologies Inc.
-- ============================================================================
--
-- Permission:
--
--   Terasic grants permission to use and modify this code for use
--   in synthesis for all Terasic Development Boards and Altera Development 
--   Kits made by Terasic.  Other use of this code, including the selling 
--   ,duplication, or modification of any portion is strictly prohibited.
--
-- Disclaimer:
--
--   This VHDL/Verilog or C/C++ source code is intended as a design reference
--   which illustrates how these types of functions can be implemented.
--   It is the user's responsibility to verify their design for
--   consistency and functionality through the use of formal
--   verification methods.  Terasic provides no warranty regarding the use 
--   or functionality of this code.
--
-- ============================================================================
--           
--  Terasic Technologies Inc
--  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
--  
--  
--                     web: http:--www.terasic.com/  
--                     email: support@terasic.com
--
-- ============================================================================
--Date:  Mon Jun 17 20:35:29 2013
-- ============================================================================


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ghrd_top is
  port (
    --ADC_CS_N       : inout   std_logic;
    --ADC_DIN        : out  std_logic;
    --ADC_DOUT       : in   std_logic;
    --ADC_SCLK       : out  std_logic;
    
    --AUD_ADCDAT     : in   std_logic;
    --AUD_ADCLRCK    : inout   std_logic;
    --AUD_BCLK       : inout   std_logic;
    --AUD_DACDAT     : out  std_logic;
    --AUD_DACLRCK    : inout   std_logic;
    --AUD_XCK        : out  std_logic;
    
    CLOCK2_50      : in   std_logic;
    
    CLOCK3_50      : in   std_logic;
    
    CLOCK4_50      : in   std_logic;
    
    CLOCK_50       : in   std_logic;
    
    --DRAM_ADDR      : out  std_logic_vector(12 downto 0);
    --DRAM_BA        : out  std_logic_vector(1 downto 0);
    --DRAM_CAS_N     : out  std_logic;
    --DRAM_CKE       : out  std_logic;
    --DRAM_CLK       : out  std_logic;
    --DRAM_CS_N      : out  std_logic;
    --DRAM_DQ        : inout   std_logic_vector(15 downto 0);
    --DRAM_LDQM      : out  std_logic;
    --DRAM_RAS_N     : out  std_logic;
    --DRAM_UDQM      : out  std_logic;
    --DRAM_WE_N      : out  std_logic;
    
    --FAN_CTRL       : out  std_logic;
    
    --FPGA_I2C_SCLK  : out  std_logic;
    --FPGA_I2C_SDAT  : inout   std_logic;
    
    GPIO_0         : inout   std_logic_vector(35 downto 0);
    GPIO_1         : inout   std_logic_vector(35 downto 0);

    HEX0           : out  std_logic_vector(6 downto 0);
    HEX1           : out  std_logic_vector(6 downto 0);
    HEX2           : out  std_logic_vector(6 downto 0);
    HEX3           : out  std_logic_vector(6 downto 0);
    --HEX4           : out  std_logic_vector(6 downto 0);
    --HEX5           : out  std_logic_vector(6 downto 0);

    HPS_CONV_USB_N : inout   std_logic;
    HPS_DDR3_ADDR  : out  std_logic_vector(14 downto 0);
    HPS_DDR3_BA    : out  std_logic_vector(2 downto 0);
    HPS_DDR3_CAS_N : out  std_logic;
    HPS_DDR3_CKE   : out  std_logic;
    HPS_DDR3_CK_N  : out  std_logic;
    HPS_DDR3_CK_P  : out  std_logic;
    HPS_DDR3_CS_N  : out  std_logic;
    HPS_DDR3_DM    : out  std_logic_vector(3 downto 0);
    HPS_DDR3_DQ    : inout   std_logic_vector(31 downto 0);
    HPS_DDR3_DQS_N : inout   std_logic_vector(3 downto 0);
    HPS_DDR3_DQS_P : inout   std_logic_vector(3 downto 0);
    HPS_DDR3_ODT   : out  std_logic;
    HPS_DDR3_RAS_N : out  std_logic;
    HPS_DDR3_RESET_N:out   std_logic;
    HPS_DDR3_RZQ   : in   std_logic;
    HPS_DDR3_WE_N   :out  std_logic;
    HPS_ENET_GTX_CLK : out   std_logic;
    HPS_ENET_INT_N  :inout   std_logic;
    HPS_ENET_MDC    :out  std_logic;
    HPS_ENET_MDIO   :inout   std_logic;
    HPS_ENET_RX_CLK :in   std_logic;
    HPS_ENET_RX_DATA:in    std_logic_vector(3 downto 0);
    HPS_ENET_RX_DV  :in   std_logic;
    HPS_ENET_TX_DATA:out   std_logic_vector(3 downto 0);
    HPS_ENET_TX_EN  :out  std_logic;
    HPS_FLASH_DATA  :inout   std_logic_vector(3 downto 0);
    HPS_FLASH_DCLK  :out  std_logic;
    HPS_FLASH_NCSO  :out  std_logic;
    HPS_GSENSOR_INT :inout   std_logic;
    HPS_I2C1_SCLK   :inout   std_logic;
    HPS_I2C1_SDAT   :inout   std_logic;
    HPS_I2C2_SCLK   :inout   std_logic;
    HPS_I2C2_SDAT   :inout   std_logic;
    HPS_I2C_CONTROL :inout   std_logic;
    HPS_KEY         :inout   std_logic;
    HPS_LED         :inout   std_logic;
    HPS_LTC_GPIO    :inout   std_logic;
    HPS_SD_CLK      :out  std_logic;
    HPS_SD_CMD      :inout   std_logic;
    HPS_SD_DATA     :inout   std_logic_vector(3 downto 0);
    HPS_SPIM_CLK    :out  std_logic;
    HPS_SPIM_MISO   :in   std_logic;
    HPS_SPIM_MOSI   :out  std_logic;
    HPS_SPIM_SS     :inout   std_logic;
    HPS_UART_RX     :in   std_logic;
    HPS_UART_TX     :out  std_logic;
    HPS_USB_CLKOUT  :in   std_logic;
    HPS_USB_DATA    :inout   std_logic_vector(7 downto 0);
    HPS_USB_DIR     :in   std_logic;
    HPS_USB_NXT     :in   std_logic;
    HPS_USB_STP     :out  std_logic;
    
    --IRDA_RXD        :in   std_logic;
    --IRDA_TXD        :out  std_logic;
    
    KEY             :in   std_logic_vector(3 downto 0);
    
    LEDR            :out std_logic_vector(9 downto 0); 
    
    --PS2_CLK         :inout   std_logic;
    --PS2_CLK2        :inout   std_logic;
    --PS2_DAT         :inout   std_logic;
    --PS2_DAT2        :inout   std_logic;
    
    SW              :in   std_logic_vector(9 downto 0);
       
    --VGA_B           :out  std_logic_vector(7 downto 0);
    --VGA_BLANK_N     :out  std_logic;
    --VGA_CLK         :out  std_logic;
    --VGA_G           :out  std_logic_vector(7 downto 0);
    --VGA_HS          :out  std_logic;
    --VGA_R           :out  std_logic_vector(7 downto 0);
    --VGA_SYNC_N      :out  std_logic;
    --VGA_VS	       :out  std_logic;

    TD_CLK27        :in   std_logic;
    TD_DATA         :in   std_logic_vector(7 downto 0);
    TD_HS           :in   std_logic;
    TD_RESET_N      :out  std_logic;
    TD_VS           :in   std_logic
	
   );

end ghrd_top;

architecture behaviour of ghrd_top is

signal hps_fpga_reset_n : std_logic;
signal hps_cold_reset : std_logic;
signal hps_warm_reset : std_logic;
signal hps_debug_reset : std_logic;
signal stm_hw_events : std_logic_vector(27 downto 0);

    component soc_system is
        port (
            clk_clk                               : in    std_logic                     := 'X';             -- clk
            hps_0_f2h_cold_reset_req_reset_n      : in    std_logic                     := 'X';             -- reset_n
            hps_0_f2h_debug_reset_req_reset_n     : in    std_logic                     := 'X';             -- reset_n
            hps_0_f2h_stm_hw_events_stm_hwevents  : in    std_logic_vector(27 downto 0) := (others => 'X'); -- stm_hwevents
            hps_0_f2h_warm_reset_req_reset_n      : in    std_logic                     := 'X';             -- reset_n
            --hps_0_h2f_reset_reset_n               : out   std_logic;                                        -- reset_n
            hps_0_hps_io_hps_io_emac1_inst_TX_CLK : out   std_logic;                                        -- hps_io_emac1_inst_TX_CLK
            hps_0_hps_io_hps_io_emac1_inst_TXD0   : out   std_logic;                                        -- hps_io_emac1_inst_TXD0
            hps_0_hps_io_hps_io_emac1_inst_TXD1   : out   std_logic;                                        -- hps_io_emac1_inst_TXD1
            hps_0_hps_io_hps_io_emac1_inst_TXD2   : out   std_logic;                                        -- hps_io_emac1_inst_TXD2
            hps_0_hps_io_hps_io_emac1_inst_TXD3   : out   std_logic;                                        -- hps_io_emac1_inst_TXD3
            hps_0_hps_io_hps_io_emac1_inst_RXD0   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD0
            hps_0_hps_io_hps_io_emac1_inst_MDIO   : inout std_logic                     := 'X';             -- hps_io_emac1_inst_MDIO
            hps_0_hps_io_hps_io_emac1_inst_MDC    : out   std_logic;                                        -- hps_io_emac1_inst_MDC
            hps_0_hps_io_hps_io_emac1_inst_RX_CTL : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CTL
            hps_0_hps_io_hps_io_emac1_inst_TX_CTL : out   std_logic;                                        -- hps_io_emac1_inst_TX_CTL
            hps_0_hps_io_hps_io_emac1_inst_RX_CLK : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CLK
            hps_0_hps_io_hps_io_emac1_inst_RXD1   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD1
            hps_0_hps_io_hps_io_emac1_inst_RXD2   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD2
            hps_0_hps_io_hps_io_emac1_inst_RXD3   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD3
            hps_0_hps_io_hps_io_qspi_inst_IO0     : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO0
            hps_0_hps_io_hps_io_qspi_inst_IO1     : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO1
            hps_0_hps_io_hps_io_qspi_inst_IO2     : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO2
            hps_0_hps_io_hps_io_qspi_inst_IO3     : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO3
            hps_0_hps_io_hps_io_qspi_inst_SS0     : out   std_logic;                                        -- hps_io_qspi_inst_SS0
            hps_0_hps_io_hps_io_qspi_inst_CLK     : out   std_logic;                                        -- hps_io_qspi_inst_CLK
            hps_0_hps_io_hps_io_sdio_inst_CMD     : inout std_logic                     := 'X';             -- hps_io_sdio_inst_CMD
            hps_0_hps_io_hps_io_sdio_inst_D0      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D0
            hps_0_hps_io_hps_io_sdio_inst_D1      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D1
            hps_0_hps_io_hps_io_sdio_inst_CLK     : out   std_logic;                                        -- hps_io_sdio_inst_CLK
            hps_0_hps_io_hps_io_sdio_inst_D2      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D2
            hps_0_hps_io_hps_io_sdio_inst_D3      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D3
            hps_0_hps_io_hps_io_usb1_inst_D0      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D0
            hps_0_hps_io_hps_io_usb1_inst_D1      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D1
            hps_0_hps_io_hps_io_usb1_inst_D2      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D2
            hps_0_hps_io_hps_io_usb1_inst_D3      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D3
            hps_0_hps_io_hps_io_usb1_inst_D4      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D4
            hps_0_hps_io_hps_io_usb1_inst_D5      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D5
            hps_0_hps_io_hps_io_usb1_inst_D6      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D6
            hps_0_hps_io_hps_io_usb1_inst_D7      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D7
            hps_0_hps_io_hps_io_usb1_inst_CLK     : in    std_logic                     := 'X';             -- hps_io_usb1_inst_CLK
            hps_0_hps_io_hps_io_usb1_inst_STP     : out   std_logic;                                        -- hps_io_usb1_inst_STP
            hps_0_hps_io_hps_io_usb1_inst_DIR     : in    std_logic                     := 'X';             -- hps_io_usb1_inst_DIR
            hps_0_hps_io_hps_io_usb1_inst_NXT     : in    std_logic                     := 'X';             -- hps_io_usb1_inst_NXT
            hps_0_hps_io_hps_io_spim1_inst_CLK    : out   std_logic;                                        -- hps_io_spim1_inst_CLK
            hps_0_hps_io_hps_io_spim1_inst_MOSI   : out   std_logic;                                        -- hps_io_spim1_inst_MOSI
            hps_0_hps_io_hps_io_spim1_inst_MISO   : in    std_logic                     := 'X';             -- hps_io_spim1_inst_MISO
            hps_0_hps_io_hps_io_spim1_inst_SS0    : out   std_logic;                                        -- hps_io_spim1_inst_SS0
            hps_0_hps_io_hps_io_uart0_inst_RX     : in    std_logic                     := 'X';             -- hps_io_uart0_inst_RX
            hps_0_hps_io_hps_io_uart0_inst_TX     : out   std_logic;                                        -- hps_io_uart0_inst_TX
            hps_0_hps_io_hps_io_i2c0_inst_SDA     : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SDA
            hps_0_hps_io_hps_io_i2c0_inst_SCL     : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SCL
            hps_0_hps_io_hps_io_i2c1_inst_SDA     : inout std_logic                     := 'X';             -- hps_io_i2c1_inst_SDA
            hps_0_hps_io_hps_io_i2c1_inst_SCL     : inout std_logic                     := 'X';             -- hps_io_i2c1_inst_SCL
            hps_0_hps_io_hps_io_gpio_inst_GPIO09  : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO09
            hps_0_hps_io_hps_io_gpio_inst_GPIO35  : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO35
            hps_0_hps_io_hps_io_gpio_inst_GPIO40  : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO40
            hps_0_hps_io_hps_io_gpio_inst_GPIO48  : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO48
            hps_0_hps_io_hps_io_gpio_inst_GPIO53  : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO53
            hps_0_hps_io_hps_io_gpio_inst_GPIO54  : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO54
            hps_0_hps_io_hps_io_gpio_inst_GPIO61  : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO61
            memory_mem_a                          : out   std_logic_vector(14 downto 0);                    -- mem_a
            memory_mem_ba                         : out   std_logic_vector(2 downto 0);                     -- mem_ba
            memory_mem_ck                         : out   std_logic;                                        -- mem_ck
            memory_mem_ck_n                       : out   std_logic;                                        -- mem_ck_n
            memory_mem_cke                        : out   std_logic;                                        -- mem_cke
            memory_mem_cs_n                       : out   std_logic;                                        -- mem_cs_n
            memory_mem_ras_n                      : out   std_logic;                                        -- mem_ras_n
            memory_mem_cas_n                      : out   std_logic;                                        -- mem_cas_n
            memory_mem_we_n                       : out   std_logic;                                        -- mem_we_n
            memory_mem_reset_n                    : out   std_logic;                                        -- mem_reset_n
            memory_mem_dq                         : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
            memory_mem_dqs                        : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
            memory_mem_dqs_n                      : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
            memory_mem_odt                        : out   std_logic;                                        -- mem_odt
            memory_mem_dm                         : out   std_logic_vector(3 downto 0);                     -- mem_dm
            memory_oct_rzqin                      : in    std_logic                     := 'X';             -- oct_rzqin
            pio_0_external_connection_export    : out   std_logic_vector(9 downto 0);                     -- export
            a_7_seg_hex_display_0_hex_out_hex0    : out   std_logic_vector(6 downto 0);                     -- hex0
            a_7_seg_hex_display_0_hex_out_hex1    : out   std_logic_vector(6 downto 0);                     -- hex1
            a_7_seg_hex_display_0_hex_out_hex2    : out   std_logic_vector(6 downto 0);                     -- hex2
            a_7_seg_hex_display_0_hex_out_hex3    : out   std_logic_vector(6 downto 0);                     -- hex3
				--hex_id1                               : out   std_logic_vector(6 downto 0);                     -- id1
            --hex_id2                               : out   std_logic_vector(6 downto 0);                     -- id2
            --hex_id3                               : out   std_logic_vector(6 downto 0);                     -- id3
            --hex_id4                               : out   std_logic_vector(6 downto 0);                     -- id4
				upcounter_input_irq_input_irq         : in    std_logic;            -- input_irq
				upcounter_input_counter_input_counter : in    std_logic;
            reset_reset_n                         : in    std_logic                     := 'X'              -- reset_n
				);
    end component soc_system;
	 
begin
	
    u0 : component soc_system
        port map (
            clk_clk                               => CLOCK_50,
            hps_0_f2h_cold_reset_req_reset_n      => not hps_cold_reset,
            hps_0_f2h_debug_reset_req_reset_n     => not hps_debug_reset,
            hps_0_f2h_stm_hw_events_stm_hwevents  => stm_hw_events,
            hps_0_f2h_warm_reset_req_reset_n      => not hps_warm_reset,
            --hps_0_h2f_reset_reset_n               => hps_fpga_reset_n,
            hps_0_hps_io_hps_io_emac1_inst_TX_CLK => HPS_ENET_GTX_CLK,
            hps_0_hps_io_hps_io_emac1_inst_TXD0   => HPS_ENET_TX_DATA(0),
            hps_0_hps_io_hps_io_emac1_inst_TXD1   => HPS_ENET_TX_DATA(1),
            hps_0_hps_io_hps_io_emac1_inst_TXD2   => HPS_ENET_TX_DATA(2),
            hps_0_hps_io_hps_io_emac1_inst_TXD3   => HPS_ENET_TX_DATA(3),
            hps_0_hps_io_hps_io_emac1_inst_RXD0   => HPS_ENET_RX_DATA(0),
            hps_0_hps_io_hps_io_emac1_inst_MDIO   => HPS_ENET_MDIO, 
            hps_0_hps_io_hps_io_emac1_inst_MDC    => HPS_ENET_MDC,
            hps_0_hps_io_hps_io_emac1_inst_RX_CTL => HPS_ENET_RX_DV,
            hps_0_hps_io_hps_io_emac1_inst_TX_CTL => HPS_ENET_TX_EN,
            hps_0_hps_io_hps_io_emac1_inst_RX_CLK => HPS_ENET_RX_CLK,
            hps_0_hps_io_hps_io_emac1_inst_RXD1   => HPS_ENET_RX_DATA(1),
            hps_0_hps_io_hps_io_emac1_inst_RXD2   => HPS_ENET_RX_DATA(2),
            hps_0_hps_io_hps_io_emac1_inst_RXD3   => HPS_ENET_RX_DATA(3),
            hps_0_hps_io_hps_io_qspi_inst_IO0     => HPS_FLASH_DATA(0),
            hps_0_hps_io_hps_io_qspi_inst_IO1     => HPS_FLASH_DATA(1),
            hps_0_hps_io_hps_io_qspi_inst_IO2     => HPS_FLASH_DATA(2),
            hps_0_hps_io_hps_io_qspi_inst_IO3     => HPS_FLASH_DATA(3),
            hps_0_hps_io_hps_io_qspi_inst_SS0     => HPS_FLASH_NCSO,
            hps_0_hps_io_hps_io_qspi_inst_CLK     => HPS_FLASH_DCLK,
            hps_0_hps_io_hps_io_sdio_inst_CMD     => HPS_SD_CMD,
            hps_0_hps_io_hps_io_sdio_inst_D0      => HPS_SD_DATA(0),
            hps_0_hps_io_hps_io_sdio_inst_D1      => HPS_SD_DATA(1),
            hps_0_hps_io_hps_io_sdio_inst_CLK     => HPS_SD_CLK,
            hps_0_hps_io_hps_io_sdio_inst_D2      => HPS_SD_DATA(2),
            hps_0_hps_io_hps_io_sdio_inst_D3      => HPS_SD_DATA(3),
            hps_0_hps_io_hps_io_usb1_inst_D0      => HPS_USB_DATA(0),
            hps_0_hps_io_hps_io_usb1_inst_D1      => HPS_USB_DATA(1),
            hps_0_hps_io_hps_io_usb1_inst_D2      => HPS_USB_DATA(2),
            hps_0_hps_io_hps_io_usb1_inst_D3      => HPS_USB_DATA(3),
            hps_0_hps_io_hps_io_usb1_inst_D4      => HPS_USB_DATA(4),
            hps_0_hps_io_hps_io_usb1_inst_D5      => HPS_USB_DATA(5),
            hps_0_hps_io_hps_io_usb1_inst_D6      => HPS_USB_DATA(6),
            hps_0_hps_io_hps_io_usb1_inst_D7      => HPS_USB_DATA(7),
            hps_0_hps_io_hps_io_usb1_inst_CLK     => HPS_USB_CLKOUT,
            hps_0_hps_io_hps_io_usb1_inst_STP     => HPS_USB_STP,
            hps_0_hps_io_hps_io_usb1_inst_DIR     => HPS_USB_DIR,
            hps_0_hps_io_hps_io_usb1_inst_NXT     => HPS_USB_NXT,
            hps_0_hps_io_hps_io_spim1_inst_CLK    => HPS_SPIM_CLK, 
            hps_0_hps_io_hps_io_spim1_inst_MOSI   => HPS_SPIM_MOSI,
            hps_0_hps_io_hps_io_spim1_inst_MISO   => HPS_SPIM_MISO,
            hps_0_hps_io_hps_io_spim1_inst_SS0    => HPS_SPIM_SS,
            hps_0_hps_io_hps_io_uart0_inst_RX     => HPS_UART_RX,
            hps_0_hps_io_hps_io_uart0_inst_TX     => HPS_UART_TX,
            hps_0_hps_io_hps_io_i2c0_inst_SDA     => HPS_I2C1_SDAT,
            hps_0_hps_io_hps_io_i2c0_inst_SCL     => HPS_I2C1_SCLK,
            hps_0_hps_io_hps_io_i2c1_inst_SDA     => HPS_I2C2_SDAT,
            hps_0_hps_io_hps_io_i2c1_inst_SCL     => HPS_I2C2_SCLK,
            hps_0_hps_io_hps_io_gpio_inst_GPIO09  => HPS_CONV_USB_N,
            hps_0_hps_io_hps_io_gpio_inst_GPIO35  => HPS_ENET_INT_N,
            hps_0_hps_io_hps_io_gpio_inst_GPIO40  => HPS_LTC_GPIO,
            hps_0_hps_io_hps_io_gpio_inst_GPIO48  => HPS_I2C_CONTROL,
            hps_0_hps_io_hps_io_gpio_inst_GPIO53  => HPS_LED,
            hps_0_hps_io_hps_io_gpio_inst_GPIO54  => HPS_KEY,
            hps_0_hps_io_hps_io_gpio_inst_GPIO61  => HPS_GSENSOR_INT,
            memory_mem_a                          => HPS_DDR3_ADDR,  
            memory_mem_ba                         => HPS_DDR3_BA,    
            memory_mem_ck                         => HPS_DDR3_CK_P,  
            memory_mem_ck_n                       => HPS_DDR3_CK_N,  
            memory_mem_cke                        => HPS_DDR3_CKE,   
            memory_mem_cs_n                       => HPS_DDR3_CS_N,  
            memory_mem_ras_n                      => HPS_DDR3_RAS_N, 
            memory_mem_cas_n                      => HPS_DDR3_CAS_N, 
            memory_mem_we_n                       => HPS_DDR3_WE_N,  
            memory_mem_reset_n                    => HPS_DDR3_RESET_N,
            memory_mem_dq                         => HPS_DDR3_DQ,    
            memory_mem_dqs                        => HPS_DDR3_DQS_P, 
            memory_mem_dqs_n                      => HPS_DDR3_DQS_N, 
            memory_mem_odt                        => HPS_DDR3_ODT,   
            memory_mem_dm                         => HPS_DDR3_DM,    
            memory_oct_rzqin                      => HPS_DDR3_RZQ,   
            pio_0_external_connection_export    => LEDR,
				upcounter_input_irq_input_irq         => KEY(1),          -- input_irq
				upcounter_input_counter_input_counter => KEY(0),
				a_7_seg_hex_display_0_hex_out_hex0    => HEX0,                    -- hex0
            a_7_seg_hex_display_0_hex_out_hex1    => HEX1,                   -- hex1
            a_7_seg_hex_display_0_hex_out_hex2    => HEX2,                    -- hex2
            a_7_seg_hex_display_0_hex_out_hex3    => HEX3,                    -- hex3
            --hex_id1                               => HEX0,
            --hex_id2                               => HEX1,
            --hex_id3                               => HEX2,
            --hex_id4                               => HEX3,				
            reset_reset_n                         => hps_fpga_reset_n
        );

	--ledr <= "000000" & KEY;
		  
	reset_logic_INST: entity work.reset_logic
		port map (
			clock_50    => CLOCK_50,
			reset_n     => hps_fpga_reset_n,
			debug_reset => hps_debug_reset,
			cold_reset  => hps_cold_reset,
			warm_reset  => hps_warm_reset);
		
  stm_hw_events <= "0000" & SW & "0000000000" & "0000";
  		
end behaviour;