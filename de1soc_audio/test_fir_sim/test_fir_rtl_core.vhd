-- ------------------------------------------------------------------------- 
-- Intel Altera DSP Builder Advanced Flow Tools Release Version 16.1
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2016 Intel Corporation.  All rights reserved.
-- Your use of  Intel  Corporation's design tools,  logic functions and other
-- software and tools,  and its AMPP  partner logic functions, and  any output
-- files  any of the  foregoing  device programming or simulation files),  and
-- any associated  documentation or information are expressly subject  to  the
-- terms and conditions  of the Intel FPGA Software License Agreement,
-- Intel  MegaCore  Function  License  Agreement, or other applicable license
-- agreement,  including,  without limitation,  that your use  is for the sole
-- purpose of  programming  logic  devices  manufactured by Intel and sold by
-- Intel or its authorized  distributors.  Please  refer  to  the  applicable
-- agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from test_fir_rtl_core
-- VHDL created on Fri Feb 17 15:19:16 2017


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity test_fir_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(23 downto 0);  -- sfix24
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(37 downto 0);  -- sfix38
        clk : in std_logic;
        areset : in std_logic
    );
end test_fir_rtl_core;

architecture normal of test_fir_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split16_c_11_q : STD_LOGIC_VECTOR (23 downto 0);
    type u0_m0_wo0_cma0_a0type is array(0 to 15) of SIGNED(23 downto 0);
    signal u0_m0_wo0_cma0_a0 : u0_m0_wo0_cma0_a0type;
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_cma0_a0 : signal is true;
    type u0_m0_wo0_cma0_c0type is array(0 to 15) of UNSIGNED(2 downto 0);
    signal u0_m0_wo0_cma0_c0 : u0_m0_wo0_cma0_c0type;
    attribute preserve of u0_m0_wo0_cma0_c0 : signal is true;
    type u0_m0_wo0_cma0_rtype is array(0 to 15) of SIGNED(10 downto 0);
    signal u0_m0_wo0_cma0_r : u0_m0_wo0_cma0_rtype;
    type u0_m0_wo0_cma0_ptype is array(0 to 15) of SIGNED(34 downto 0);
    signal u0_m0_wo0_cma0_p : u0_m0_wo0_cma0_ptype;
    type u0_m0_wo0_cma0_utype is array(0 to 15) of SIGNED(38 downto 0);
    signal u0_m0_wo0_cma0_u : u0_m0_wo0_cma0_utype;
    signal u0_m0_wo0_cma0_w : u0_m0_wo0_cma0_utype;
    signal u0_m0_wo0_cma0_x : u0_m0_wo0_cma0_utype;
    signal u0_m0_wo0_cma0_y : u0_m0_wo0_cma0_utype;
    type u0_m0_wo0_cma0_k0type is array(0 to 7) of SIGNED(10 downto 0);
    signal u0_m0_wo0_cma0_k0 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(8,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k1 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(6,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k2 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k3 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(-7,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k4 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(-11,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k5 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(-8,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k6 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k7 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(10,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k8 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(16,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k9 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(12,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k10 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k11 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(-16,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k12 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(-26,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k13 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(-22,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k14 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k15 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(38,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_s : u0_m0_wo0_cma0_utype;
    signal u0_m0_wo0_cma0_qq : STD_LOGIC_VECTOR (38 downto 0);
    signal u0_m0_wo0_cma0_q : STD_LOGIC_VECTOR (38 downto 0);
    signal u0_m0_wo0_cma1_a0 : u0_m0_wo0_cma0_a0type;
    attribute preserve of u0_m0_wo0_cma1_a0 : signal is true;
    signal u0_m0_wo0_cma1_c0 : u0_m0_wo0_cma0_c0type;
    attribute preserve of u0_m0_wo0_cma1_c0 : signal is true;
    signal u0_m0_wo0_cma1_r : u0_m0_wo0_cma0_rtype;
    signal u0_m0_wo0_cma1_p : u0_m0_wo0_cma0_ptype;
    signal u0_m0_wo0_cma1_u : u0_m0_wo0_cma0_utype;
    signal u0_m0_wo0_cma1_w : u0_m0_wo0_cma0_utype;
    signal u0_m0_wo0_cma1_x : u0_m0_wo0_cma0_utype;
    signal u0_m0_wo0_cma1_y : u0_m0_wo0_cma0_utype;
    signal u0_m0_wo0_cma1_k0 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(80,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k1 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(114,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k2 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(127,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k3 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(114,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k4 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(80,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k5 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(38,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k6 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k7 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(-22,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k8 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(-26,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k9 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(-16,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k10 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k11 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(12,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k12 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(16,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k13 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(10,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k14 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_k15 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(-8,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma1_s : u0_m0_wo0_cma0_utype;
    signal u0_m0_wo0_cma1_qq : STD_LOGIC_VECTOR (38 downto 0);
    signal u0_m0_wo0_cma1_q : STD_LOGIC_VECTOR (38 downto 0);
    type u0_m0_wo0_cma2_a0type is array(0 to 4) of SIGNED(23 downto 0);
    signal u0_m0_wo0_cma2_a0 : u0_m0_wo0_cma2_a0type;
    attribute preserve of u0_m0_wo0_cma2_a0 : signal is true;
    type u0_m0_wo0_cma2_c0type is array(0 to 4) of UNSIGNED(2 downto 0);
    signal u0_m0_wo0_cma2_c0 : u0_m0_wo0_cma2_c0type;
    attribute preserve of u0_m0_wo0_cma2_c0 : signal is true;
    type u0_m0_wo0_cma2_rtype is array(0 to 4) of SIGNED(10 downto 0);
    signal u0_m0_wo0_cma2_r : u0_m0_wo0_cma2_rtype;
    type u0_m0_wo0_cma2_ptype is array(0 to 4) of SIGNED(34 downto 0);
    signal u0_m0_wo0_cma2_p : u0_m0_wo0_cma2_ptype;
    type u0_m0_wo0_cma2_utype is array(0 to 4) of SIGNED(37 downto 0);
    signal u0_m0_wo0_cma2_u : u0_m0_wo0_cma2_utype;
    signal u0_m0_wo0_cma2_w : u0_m0_wo0_cma2_utype;
    signal u0_m0_wo0_cma2_x : u0_m0_wo0_cma2_utype;
    signal u0_m0_wo0_cma2_y : u0_m0_wo0_cma2_utype;
    signal u0_m0_wo0_cma2_k0 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(-11,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma2_k1 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(-7,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma2_k2 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma2_k3 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(6,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma2_k4 : u0_m0_wo0_cma0_k0type := (
        0 => TO_SIGNED(8,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma2_s : u0_m0_wo0_cma2_utype;
    signal u0_m0_wo0_cma2_qq : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_cma2_q : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_delayr16_mem_ia : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_mem_iq : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_mem_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_delayr16_rdcnt_i : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr16_rdcnt_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_delayr16_rdcnt_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr16_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr16_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_rdmux_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_cmp_a : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal out0_m0_wo0_lineup_select_delay_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_split16_in : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_wi0_r0_split16_b : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_wi0_r0_split16_c : STD_LOGIC_VECTOR (23 downto 0);
    signal out0_m0_wo0_assign_id3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_join16_q : STD_LOGIC_VECTOR (47 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- u0_m0_wo0_wi0_r0_delayr16_notEnable(LOGICAL,111)@10
    u0_m0_wo0_wi0_r0_delayr16_notEnable_a <= STD_LOGIC_VECTOR(xIn_v);
    u0_m0_wo0_wi0_r0_delayr16_notEnable_q <= not (u0_m0_wo0_wi0_r0_delayr16_notEnable_a);

    -- u0_m0_wo0_wi0_r0_delayr16_nor(LOGICAL,112)@10
    u0_m0_wo0_wi0_r0_delayr16_nor_a <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_notEnable_q);
    u0_m0_wo0_wi0_r0_delayr16_nor_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q);
    u0_m0_wo0_wi0_r0_delayr16_nor_q <= not (u0_m0_wo0_wi0_r0_delayr16_nor_a or u0_m0_wo0_wi0_r0_delayr16_nor_b);

    -- u0_m0_wo0_wi0_r0_delayr16_mem_last(CONSTANT,108)
    u0_m0_wo0_wi0_r0_delayr16_mem_last_q <= "01101";

    -- u0_m0_wo0_wi0_r0_delayr16_cmp(LOGICAL,109)@10
    u0_m0_wo0_wi0_r0_delayr16_cmp_a <= u0_m0_wo0_wi0_r0_delayr16_mem_last_q;
    u0_m0_wo0_wi0_r0_delayr16_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_delayr16_rdmux_q);
    u0_m0_wo0_wi0_r0_delayr16_cmp_q <= "1" WHEN u0_m0_wo0_wi0_r0_delayr16_cmp_a = u0_m0_wo0_wi0_r0_delayr16_cmp_b ELSE "0";

    -- u0_m0_wo0_wi0_r0_delayr16_cmpReg(REG,110)@10 + 1
    u0_m0_wo0_wi0_r0_delayr16_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr16_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_r0_delayr16_cmpReg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr16_sticky_ena(REG,113)@10 + 1
    u0_m0_wo0_wi0_r0_delayr16_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_delayr16_nor_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr16_enaAnd(LOGICAL,114)@10
    u0_m0_wo0_wi0_r0_delayr16_enaAnd_a <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q);
    u0_m0_wo0_wi0_r0_delayr16_enaAnd_b <= STD_LOGIC_VECTOR(xIn_v);
    u0_m0_wo0_wi0_r0_delayr16_enaAnd_q <= u0_m0_wo0_wi0_r0_delayr16_enaAnd_a and u0_m0_wo0_wi0_r0_delayr16_enaAnd_b;

    -- u0_m0_wo0_wi0_r0_delayr16_rdcnt(COUNTER,105)@10 + 1
    -- low=0, high=14, step=1, init=0
    u0_m0_wo0_wi0_r0_delayr16_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr16_rdcnt_i <= TO_UNSIGNED(0, 4);
            u0_m0_wo0_wi0_r0_delayr16_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                IF (u0_m0_wo0_wi0_r0_delayr16_rdcnt_i = TO_UNSIGNED(13, 4)) THEN
                    u0_m0_wo0_wi0_r0_delayr16_rdcnt_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_delayr16_rdcnt_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_delayr16_rdcnt_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_delayr16_rdcnt_i <= u0_m0_wo0_wi0_r0_delayr16_rdcnt_i + 2;
                ELSE
                    u0_m0_wo0_wi0_r0_delayr16_rdcnt_i <= u0_m0_wo0_wi0_r0_delayr16_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_delayr16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_delayr16_rdcnt_i, 4)));

    -- u0_m0_wo0_wi0_r0_delayr16_rdmux(MUX,106)@10
    u0_m0_wo0_wi0_r0_delayr16_rdmux_s <= xIn_v;
    u0_m0_wo0_wi0_r0_delayr16_rdmux_combproc: PROCESS (u0_m0_wo0_wi0_r0_delayr16_rdmux_s, u0_m0_wo0_wi0_r0_delayr16_wraddr_q, u0_m0_wo0_wi0_r0_delayr16_rdcnt_q)
    BEGIN
        CASE (u0_m0_wo0_wi0_r0_delayr16_rdmux_s) IS
            WHEN "0" => u0_m0_wo0_wi0_r0_delayr16_rdmux_q <= u0_m0_wo0_wi0_r0_delayr16_wraddr_q;
            WHEN "1" => u0_m0_wo0_wi0_r0_delayr16_rdmux_q <= u0_m0_wo0_wi0_r0_delayr16_rdcnt_q;
            WHEN OTHERS => u0_m0_wo0_wi0_r0_delayr16_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_join16(BITJOIN,29)@10
    u0_m0_wo0_wi0_r0_join16_q <= u0_m0_wo0_wi0_r0_split16_b & xIn_0;

    -- xIn(PORTIN,2)@10

    -- u0_m0_wo0_wi0_r0_delayr16_wraddr(REG,107)@10 + 1
    u0_m0_wo0_wi0_r0_delayr16_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr16_wraddr_q <= "1110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_delayr16_wraddr_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_rdmux_q);
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr16_mem(DUALMEM,104)@10 + 2
    u0_m0_wo0_wi0_r0_delayr16_mem_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join16_q);
    u0_m0_wo0_wi0_r0_delayr16_mem_aa <= u0_m0_wo0_wi0_r0_delayr16_wraddr_q;
    u0_m0_wo0_wi0_r0_delayr16_mem_ab <= u0_m0_wo0_wi0_r0_delayr16_rdmux_q;
    u0_m0_wo0_wi0_r0_delayr16_mem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_delayr16_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 48,
        widthad_a => 4,
        numwords_a => 15,
        width_b => 48,
        widthad_b => 4,
        numwords_b => 15,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => u0_m0_wo0_wi0_r0_delayr16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_r0_delayr16_mem_reset0,
        clock1 => clk,
        address_a => u0_m0_wo0_wi0_r0_delayr16_mem_aa,
        data_a => u0_m0_wo0_wi0_r0_delayr16_mem_ia,
        wren_a => xIn_v(0),
        address_b => u0_m0_wo0_wi0_r0_delayr16_mem_ab,
        q_b => u0_m0_wo0_wi0_r0_delayr16_mem_iq
    );
    u0_m0_wo0_wi0_r0_delayr16_mem_q <= u0_m0_wo0_wi0_r0_delayr16_mem_iq(47 downto 0);

    -- u0_m0_wo0_wi0_r0_split16(BITSELECT,30)@10
    u0_m0_wo0_wi0_r0_split16_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_mem_q);
    u0_m0_wo0_wi0_r0_split16_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split16_in(23 downto 0));
    u0_m0_wo0_wi0_r0_split16_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split16_in(47 downto 24));

    -- d_u0_m0_wo0_wi0_r0_split16_c_11(DELAY,103)@10 + 1
    d_u0_m0_wo0_wi0_r0_split16_c_11 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split16_c, xout => d_u0_m0_wo0_wi0_r0_split16_c_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_12(DELAY,101)@11 + 1
    d_u0_m0_wo0_compute_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_11_q, xout => d_u0_m0_wo0_compute_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_11(DELAY,100)@10 + 1
    d_u0_m0_wo0_compute_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_compute_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cma2(CHAINMULTADD,90)@11 + 2
    -- altera synthesis_off
    u0_m0_wo0_cma2_k0 <= (
        0 => TO_SIGNED(-11,11),
        others => (others => '0'));
    u0_m0_wo0_cma2_k1 <= (
        0 => TO_SIGNED(-7,11),
        others => (others => '0'));
    u0_m0_wo0_cma2_k2 <= (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    u0_m0_wo0_cma2_k3 <= (
        0 => TO_SIGNED(6,11),
        others => (others => '0'));
    u0_m0_wo0_cma2_k4 <= (
        0 => TO_SIGNED(8,11),
        others => (others => '0'));
    -- altera synthesis_on
    u0_m0_wo0_cma2_r(0) <= u0_m0_wo0_cma2_k0(TO_INTEGER(u0_m0_wo0_cma2_c0(0)));
    u0_m0_wo0_cma2_r(1) <= u0_m0_wo0_cma2_k1(TO_INTEGER(u0_m0_wo0_cma2_c0(1)));
    u0_m0_wo0_cma2_r(2) <= u0_m0_wo0_cma2_k2(TO_INTEGER(u0_m0_wo0_cma2_c0(2)));
    u0_m0_wo0_cma2_r(3) <= u0_m0_wo0_cma2_k3(TO_INTEGER(u0_m0_wo0_cma2_c0(3)));
    u0_m0_wo0_cma2_r(4) <= u0_m0_wo0_cma2_k4(TO_INTEGER(u0_m0_wo0_cma2_c0(4)));
    u0_m0_wo0_cma2_p(0) <= u0_m0_wo0_cma2_a0(0) * u0_m0_wo0_cma2_r(0);
    u0_m0_wo0_cma2_p(1) <= u0_m0_wo0_cma2_a0(1) * u0_m0_wo0_cma2_r(1);
    u0_m0_wo0_cma2_p(2) <= u0_m0_wo0_cma2_a0(2) * u0_m0_wo0_cma2_r(2);
    u0_m0_wo0_cma2_p(3) <= u0_m0_wo0_cma2_a0(3) * u0_m0_wo0_cma2_r(3);
    u0_m0_wo0_cma2_p(4) <= u0_m0_wo0_cma2_a0(4) * u0_m0_wo0_cma2_r(4);
    u0_m0_wo0_cma2_u(0) <= RESIZE(u0_m0_wo0_cma2_p(0),38);
    u0_m0_wo0_cma2_u(1) <= RESIZE(u0_m0_wo0_cma2_p(1),38);
    u0_m0_wo0_cma2_u(2) <= RESIZE(u0_m0_wo0_cma2_p(2),38);
    u0_m0_wo0_cma2_u(3) <= RESIZE(u0_m0_wo0_cma2_p(3),38);
    u0_m0_wo0_cma2_u(4) <= RESIZE(u0_m0_wo0_cma2_p(4),38);
    u0_m0_wo0_cma2_w(0) <= u0_m0_wo0_cma2_u(0);
    u0_m0_wo0_cma2_w(1) <= u0_m0_wo0_cma2_u(1);
    u0_m0_wo0_cma2_w(2) <= u0_m0_wo0_cma2_u(2);
    u0_m0_wo0_cma2_w(3) <= u0_m0_wo0_cma2_u(3);
    u0_m0_wo0_cma2_w(4) <= u0_m0_wo0_cma2_u(4);
    u0_m0_wo0_cma2_x(0) <= u0_m0_wo0_cma2_w(0);
    u0_m0_wo0_cma2_x(1) <= u0_m0_wo0_cma2_w(1);
    u0_m0_wo0_cma2_x(2) <= u0_m0_wo0_cma2_w(2);
    u0_m0_wo0_cma2_x(3) <= u0_m0_wo0_cma2_w(3);
    u0_m0_wo0_cma2_x(4) <= u0_m0_wo0_cma2_w(4);
    u0_m0_wo0_cma2_y(0) <= u0_m0_wo0_cma2_s(1) + u0_m0_wo0_cma2_x(0);
    u0_m0_wo0_cma2_y(1) <= u0_m0_wo0_cma2_s(2) + u0_m0_wo0_cma2_x(1);
    u0_m0_wo0_cma2_y(2) <= u0_m0_wo0_cma2_s(3) + u0_m0_wo0_cma2_x(2);
    u0_m0_wo0_cma2_y(3) <= u0_m0_wo0_cma2_s(4) + u0_m0_wo0_cma2_x(3);
    u0_m0_wo0_cma2_y(4) <= u0_m0_wo0_cma2_x(4);
    u0_m0_wo0_cma2_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma2_a0 <= (others => (others => '0'));
            u0_m0_wo0_cma2_c0 <= (others => (others => '0'));
            u0_m0_wo0_cma2_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_11_q = "1") THEN
                u0_m0_wo0_cma2_a0(0) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_split16_c_11_q),24);
                u0_m0_wo0_cma2_a0(1) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_split16_c_11_q),24);
                u0_m0_wo0_cma2_a0(2) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_split16_c_11_q),24);
                u0_m0_wo0_cma2_a0(3) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_split16_c_11_q),24);
                u0_m0_wo0_cma2_a0(4) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_split16_c_11_q),24);
                u0_m0_wo0_cma2_c0(0) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma2_c0(1) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma2_c0(2) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma2_c0(3) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma2_c0(4) <= RESIZE(UNSIGNED(GND_q),3);
            END IF;
            IF (d_u0_m0_wo0_compute_q_12_q = "1") THEN
                u0_m0_wo0_cma2_s(0) <= u0_m0_wo0_cma2_y(0);
                u0_m0_wo0_cma2_s(1) <= u0_m0_wo0_cma2_y(1);
                u0_m0_wo0_cma2_s(2) <= u0_m0_wo0_cma2_y(2);
                u0_m0_wo0_cma2_s(3) <= u0_m0_wo0_cma2_y(3);
                u0_m0_wo0_cma2_s(4) <= u0_m0_wo0_cma2_y(4);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma2_delay : dspba_delay
    GENERIC MAP ( width => 38, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_cma2_s(0)(37 downto 0)), xout => u0_m0_wo0_cma2_qq, clk => clk, aclr => areset );
    u0_m0_wo0_cma2_q <= STD_LOGIC_VECTOR(u0_m0_wo0_cma2_qq(37 downto 0));

    -- u0_m0_wo0_cma1(CHAINMULTADD,89)@10 + 2
    -- altera synthesis_off
    u0_m0_wo0_cma1_k0 <= (
        0 => TO_SIGNED(80,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k1 <= (
        0 => TO_SIGNED(114,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k2 <= (
        0 => TO_SIGNED(127,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k3 <= (
        0 => TO_SIGNED(114,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k4 <= (
        0 => TO_SIGNED(80,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k5 <= (
        0 => TO_SIGNED(38,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k6 <= (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k7 <= (
        0 => TO_SIGNED(-22,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k8 <= (
        0 => TO_SIGNED(-26,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k9 <= (
        0 => TO_SIGNED(-16,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k10 <= (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k11 <= (
        0 => TO_SIGNED(12,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k12 <= (
        0 => TO_SIGNED(16,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k13 <= (
        0 => TO_SIGNED(10,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k14 <= (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    u0_m0_wo0_cma1_k15 <= (
        0 => TO_SIGNED(-8,11),
        others => (others => '0'));
    -- altera synthesis_on
    u0_m0_wo0_cma1_r(0) <= u0_m0_wo0_cma1_k0(TO_INTEGER(u0_m0_wo0_cma1_c0(0)));
    u0_m0_wo0_cma1_r(1) <= u0_m0_wo0_cma1_k1(TO_INTEGER(u0_m0_wo0_cma1_c0(1)));
    u0_m0_wo0_cma1_r(2) <= u0_m0_wo0_cma1_k2(TO_INTEGER(u0_m0_wo0_cma1_c0(2)));
    u0_m0_wo0_cma1_r(3) <= u0_m0_wo0_cma1_k3(TO_INTEGER(u0_m0_wo0_cma1_c0(3)));
    u0_m0_wo0_cma1_r(4) <= u0_m0_wo0_cma1_k4(TO_INTEGER(u0_m0_wo0_cma1_c0(4)));
    u0_m0_wo0_cma1_r(5) <= u0_m0_wo0_cma1_k5(TO_INTEGER(u0_m0_wo0_cma1_c0(5)));
    u0_m0_wo0_cma1_r(6) <= u0_m0_wo0_cma1_k6(TO_INTEGER(u0_m0_wo0_cma1_c0(6)));
    u0_m0_wo0_cma1_r(7) <= u0_m0_wo0_cma1_k7(TO_INTEGER(u0_m0_wo0_cma1_c0(7)));
    u0_m0_wo0_cma1_r(8) <= u0_m0_wo0_cma1_k8(TO_INTEGER(u0_m0_wo0_cma1_c0(8)));
    u0_m0_wo0_cma1_r(9) <= u0_m0_wo0_cma1_k9(TO_INTEGER(u0_m0_wo0_cma1_c0(9)));
    u0_m0_wo0_cma1_r(10) <= u0_m0_wo0_cma1_k10(TO_INTEGER(u0_m0_wo0_cma1_c0(10)));
    u0_m0_wo0_cma1_r(11) <= u0_m0_wo0_cma1_k11(TO_INTEGER(u0_m0_wo0_cma1_c0(11)));
    u0_m0_wo0_cma1_r(12) <= u0_m0_wo0_cma1_k12(TO_INTEGER(u0_m0_wo0_cma1_c0(12)));
    u0_m0_wo0_cma1_r(13) <= u0_m0_wo0_cma1_k13(TO_INTEGER(u0_m0_wo0_cma1_c0(13)));
    u0_m0_wo0_cma1_r(14) <= u0_m0_wo0_cma1_k14(TO_INTEGER(u0_m0_wo0_cma1_c0(14)));
    u0_m0_wo0_cma1_r(15) <= u0_m0_wo0_cma1_k15(TO_INTEGER(u0_m0_wo0_cma1_c0(15)));
    u0_m0_wo0_cma1_p(0) <= u0_m0_wo0_cma1_a0(0) * u0_m0_wo0_cma1_r(0);
    u0_m0_wo0_cma1_p(1) <= u0_m0_wo0_cma1_a0(1) * u0_m0_wo0_cma1_r(1);
    u0_m0_wo0_cma1_p(2) <= u0_m0_wo0_cma1_a0(2) * u0_m0_wo0_cma1_r(2);
    u0_m0_wo0_cma1_p(3) <= u0_m0_wo0_cma1_a0(3) * u0_m0_wo0_cma1_r(3);
    u0_m0_wo0_cma1_p(4) <= u0_m0_wo0_cma1_a0(4) * u0_m0_wo0_cma1_r(4);
    u0_m0_wo0_cma1_p(5) <= u0_m0_wo0_cma1_a0(5) * u0_m0_wo0_cma1_r(5);
    u0_m0_wo0_cma1_p(6) <= u0_m0_wo0_cma1_a0(6) * u0_m0_wo0_cma1_r(6);
    u0_m0_wo0_cma1_p(7) <= u0_m0_wo0_cma1_a0(7) * u0_m0_wo0_cma1_r(7);
    u0_m0_wo0_cma1_p(8) <= u0_m0_wo0_cma1_a0(8) * u0_m0_wo0_cma1_r(8);
    u0_m0_wo0_cma1_p(9) <= u0_m0_wo0_cma1_a0(9) * u0_m0_wo0_cma1_r(9);
    u0_m0_wo0_cma1_p(10) <= u0_m0_wo0_cma1_a0(10) * u0_m0_wo0_cma1_r(10);
    u0_m0_wo0_cma1_p(11) <= u0_m0_wo0_cma1_a0(11) * u0_m0_wo0_cma1_r(11);
    u0_m0_wo0_cma1_p(12) <= u0_m0_wo0_cma1_a0(12) * u0_m0_wo0_cma1_r(12);
    u0_m0_wo0_cma1_p(13) <= u0_m0_wo0_cma1_a0(13) * u0_m0_wo0_cma1_r(13);
    u0_m0_wo0_cma1_p(14) <= u0_m0_wo0_cma1_a0(14) * u0_m0_wo0_cma1_r(14);
    u0_m0_wo0_cma1_p(15) <= u0_m0_wo0_cma1_a0(15) * u0_m0_wo0_cma1_r(15);
    u0_m0_wo0_cma1_u(0) <= RESIZE(u0_m0_wo0_cma1_p(0),39);
    u0_m0_wo0_cma1_u(1) <= RESIZE(u0_m0_wo0_cma1_p(1),39);
    u0_m0_wo0_cma1_u(2) <= RESIZE(u0_m0_wo0_cma1_p(2),39);
    u0_m0_wo0_cma1_u(3) <= RESIZE(u0_m0_wo0_cma1_p(3),39);
    u0_m0_wo0_cma1_u(4) <= RESIZE(u0_m0_wo0_cma1_p(4),39);
    u0_m0_wo0_cma1_u(5) <= RESIZE(u0_m0_wo0_cma1_p(5),39);
    u0_m0_wo0_cma1_u(6) <= RESIZE(u0_m0_wo0_cma1_p(6),39);
    u0_m0_wo0_cma1_u(7) <= RESIZE(u0_m0_wo0_cma1_p(7),39);
    u0_m0_wo0_cma1_u(8) <= RESIZE(u0_m0_wo0_cma1_p(8),39);
    u0_m0_wo0_cma1_u(9) <= RESIZE(u0_m0_wo0_cma1_p(9),39);
    u0_m0_wo0_cma1_u(10) <= RESIZE(u0_m0_wo0_cma1_p(10),39);
    u0_m0_wo0_cma1_u(11) <= RESIZE(u0_m0_wo0_cma1_p(11),39);
    u0_m0_wo0_cma1_u(12) <= RESIZE(u0_m0_wo0_cma1_p(12),39);
    u0_m0_wo0_cma1_u(13) <= RESIZE(u0_m0_wo0_cma1_p(13),39);
    u0_m0_wo0_cma1_u(14) <= RESIZE(u0_m0_wo0_cma1_p(14),39);
    u0_m0_wo0_cma1_u(15) <= RESIZE(u0_m0_wo0_cma1_p(15),39);
    u0_m0_wo0_cma1_w(0) <= u0_m0_wo0_cma1_u(0);
    u0_m0_wo0_cma1_w(1) <= u0_m0_wo0_cma1_u(1);
    u0_m0_wo0_cma1_w(2) <= u0_m0_wo0_cma1_u(2);
    u0_m0_wo0_cma1_w(3) <= u0_m0_wo0_cma1_u(3);
    u0_m0_wo0_cma1_w(4) <= u0_m0_wo0_cma1_u(4);
    u0_m0_wo0_cma1_w(5) <= u0_m0_wo0_cma1_u(5);
    u0_m0_wo0_cma1_w(6) <= u0_m0_wo0_cma1_u(6);
    u0_m0_wo0_cma1_w(7) <= u0_m0_wo0_cma1_u(7);
    u0_m0_wo0_cma1_w(8) <= u0_m0_wo0_cma1_u(8);
    u0_m0_wo0_cma1_w(9) <= u0_m0_wo0_cma1_u(9);
    u0_m0_wo0_cma1_w(10) <= u0_m0_wo0_cma1_u(10);
    u0_m0_wo0_cma1_w(11) <= u0_m0_wo0_cma1_u(11);
    u0_m0_wo0_cma1_w(12) <= u0_m0_wo0_cma1_u(12);
    u0_m0_wo0_cma1_w(13) <= u0_m0_wo0_cma1_u(13);
    u0_m0_wo0_cma1_w(14) <= u0_m0_wo0_cma1_u(14);
    u0_m0_wo0_cma1_w(15) <= u0_m0_wo0_cma1_u(15);
    u0_m0_wo0_cma1_x(0) <= u0_m0_wo0_cma1_w(0);
    u0_m0_wo0_cma1_x(1) <= u0_m0_wo0_cma1_w(1);
    u0_m0_wo0_cma1_x(2) <= u0_m0_wo0_cma1_w(2);
    u0_m0_wo0_cma1_x(3) <= u0_m0_wo0_cma1_w(3);
    u0_m0_wo0_cma1_x(4) <= u0_m0_wo0_cma1_w(4);
    u0_m0_wo0_cma1_x(5) <= u0_m0_wo0_cma1_w(5);
    u0_m0_wo0_cma1_x(6) <= u0_m0_wo0_cma1_w(6);
    u0_m0_wo0_cma1_x(7) <= u0_m0_wo0_cma1_w(7);
    u0_m0_wo0_cma1_x(8) <= u0_m0_wo0_cma1_w(8);
    u0_m0_wo0_cma1_x(9) <= u0_m0_wo0_cma1_w(9);
    u0_m0_wo0_cma1_x(10) <= u0_m0_wo0_cma1_w(10);
    u0_m0_wo0_cma1_x(11) <= u0_m0_wo0_cma1_w(11);
    u0_m0_wo0_cma1_x(12) <= u0_m0_wo0_cma1_w(12);
    u0_m0_wo0_cma1_x(13) <= u0_m0_wo0_cma1_w(13);
    u0_m0_wo0_cma1_x(14) <= u0_m0_wo0_cma1_w(14);
    u0_m0_wo0_cma1_x(15) <= u0_m0_wo0_cma1_w(15);
    u0_m0_wo0_cma1_y(0) <= u0_m0_wo0_cma1_s(1) + u0_m0_wo0_cma1_x(0);
    u0_m0_wo0_cma1_y(1) <= u0_m0_wo0_cma1_s(2) + u0_m0_wo0_cma1_x(1);
    u0_m0_wo0_cma1_y(2) <= u0_m0_wo0_cma1_s(3) + u0_m0_wo0_cma1_x(2);
    u0_m0_wo0_cma1_y(3) <= u0_m0_wo0_cma1_s(4) + u0_m0_wo0_cma1_x(3);
    u0_m0_wo0_cma1_y(4) <= u0_m0_wo0_cma1_s(5) + u0_m0_wo0_cma1_x(4);
    u0_m0_wo0_cma1_y(5) <= u0_m0_wo0_cma1_s(6) + u0_m0_wo0_cma1_x(5);
    u0_m0_wo0_cma1_y(6) <= u0_m0_wo0_cma1_s(7) + u0_m0_wo0_cma1_x(6);
    u0_m0_wo0_cma1_y(7) <= u0_m0_wo0_cma1_s(8) + u0_m0_wo0_cma1_x(7);
    u0_m0_wo0_cma1_y(8) <= u0_m0_wo0_cma1_s(9) + u0_m0_wo0_cma1_x(8);
    u0_m0_wo0_cma1_y(9) <= u0_m0_wo0_cma1_s(10) + u0_m0_wo0_cma1_x(9);
    u0_m0_wo0_cma1_y(10) <= u0_m0_wo0_cma1_s(11) + u0_m0_wo0_cma1_x(10);
    u0_m0_wo0_cma1_y(11) <= u0_m0_wo0_cma1_s(12) + u0_m0_wo0_cma1_x(11);
    u0_m0_wo0_cma1_y(12) <= u0_m0_wo0_cma1_s(13) + u0_m0_wo0_cma1_x(12);
    u0_m0_wo0_cma1_y(13) <= u0_m0_wo0_cma1_s(14) + u0_m0_wo0_cma1_x(13);
    u0_m0_wo0_cma1_y(14) <= u0_m0_wo0_cma1_s(15) + u0_m0_wo0_cma1_x(14);
    u0_m0_wo0_cma1_y(15) <= u0_m0_wo0_cma1_x(15);
    u0_m0_wo0_cma1_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma1_a0 <= (others => (others => '0'));
            u0_m0_wo0_cma1_c0 <= (others => (others => '0'));
            u0_m0_wo0_cma1_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_cma1_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(2) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(3) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(4) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(5) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(6) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(7) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(8) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(9) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(10) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(11) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(12) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(13) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(14) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_a0(15) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),24);
                u0_m0_wo0_cma1_c0(0) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(1) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(2) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(3) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(4) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(5) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(6) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(7) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(8) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(9) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(10) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(11) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(12) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(13) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(14) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma1_c0(15) <= RESIZE(UNSIGNED(GND_q),3);
            END IF;
            IF (d_u0_m0_wo0_compute_q_11_q = "1") THEN
                u0_m0_wo0_cma1_s(0) <= u0_m0_wo0_cma1_y(0);
                u0_m0_wo0_cma1_s(1) <= u0_m0_wo0_cma1_y(1);
                u0_m0_wo0_cma1_s(2) <= u0_m0_wo0_cma1_y(2);
                u0_m0_wo0_cma1_s(3) <= u0_m0_wo0_cma1_y(3);
                u0_m0_wo0_cma1_s(4) <= u0_m0_wo0_cma1_y(4);
                u0_m0_wo0_cma1_s(5) <= u0_m0_wo0_cma1_y(5);
                u0_m0_wo0_cma1_s(6) <= u0_m0_wo0_cma1_y(6);
                u0_m0_wo0_cma1_s(7) <= u0_m0_wo0_cma1_y(7);
                u0_m0_wo0_cma1_s(8) <= u0_m0_wo0_cma1_y(8);
                u0_m0_wo0_cma1_s(9) <= u0_m0_wo0_cma1_y(9);
                u0_m0_wo0_cma1_s(10) <= u0_m0_wo0_cma1_y(10);
                u0_m0_wo0_cma1_s(11) <= u0_m0_wo0_cma1_y(11);
                u0_m0_wo0_cma1_s(12) <= u0_m0_wo0_cma1_y(12);
                u0_m0_wo0_cma1_s(13) <= u0_m0_wo0_cma1_y(13);
                u0_m0_wo0_cma1_s(14) <= u0_m0_wo0_cma1_y(14);
                u0_m0_wo0_cma1_s(15) <= u0_m0_wo0_cma1_y(15);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma1_delay : dspba_delay
    GENERIC MAP ( width => 39, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_cma1_s(0)(38 downto 0)), xout => u0_m0_wo0_cma1_qq, clk => clk, aclr => areset );
    u0_m0_wo0_cma1_q <= STD_LOGIC_VECTOR(u0_m0_wo0_cma1_qq(38 downto 0));

    -- u0_m0_wo0_cma0(CHAINMULTADD,88)@10 + 2
    -- altera synthesis_off
    u0_m0_wo0_cma0_k0 <= (
        0 => TO_SIGNED(8,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k1 <= (
        0 => TO_SIGNED(6,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k2 <= (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k3 <= (
        0 => TO_SIGNED(-7,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k4 <= (
        0 => TO_SIGNED(-11,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k5 <= (
        0 => TO_SIGNED(-8,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k6 <= (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k7 <= (
        0 => TO_SIGNED(10,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k8 <= (
        0 => TO_SIGNED(16,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k9 <= (
        0 => TO_SIGNED(12,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k10 <= (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k11 <= (
        0 => TO_SIGNED(-16,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k12 <= (
        0 => TO_SIGNED(-26,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k13 <= (
        0 => TO_SIGNED(-22,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k14 <= (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k15 <= (
        0 => TO_SIGNED(38,11),
        others => (others => '0'));
    -- altera synthesis_on
    u0_m0_wo0_cma0_r(0) <= u0_m0_wo0_cma0_k0(TO_INTEGER(u0_m0_wo0_cma0_c0(0)));
    u0_m0_wo0_cma0_r(1) <= u0_m0_wo0_cma0_k1(TO_INTEGER(u0_m0_wo0_cma0_c0(1)));
    u0_m0_wo0_cma0_r(2) <= u0_m0_wo0_cma0_k2(TO_INTEGER(u0_m0_wo0_cma0_c0(2)));
    u0_m0_wo0_cma0_r(3) <= u0_m0_wo0_cma0_k3(TO_INTEGER(u0_m0_wo0_cma0_c0(3)));
    u0_m0_wo0_cma0_r(4) <= u0_m0_wo0_cma0_k4(TO_INTEGER(u0_m0_wo0_cma0_c0(4)));
    u0_m0_wo0_cma0_r(5) <= u0_m0_wo0_cma0_k5(TO_INTEGER(u0_m0_wo0_cma0_c0(5)));
    u0_m0_wo0_cma0_r(6) <= u0_m0_wo0_cma0_k6(TO_INTEGER(u0_m0_wo0_cma0_c0(6)));
    u0_m0_wo0_cma0_r(7) <= u0_m0_wo0_cma0_k7(TO_INTEGER(u0_m0_wo0_cma0_c0(7)));
    u0_m0_wo0_cma0_r(8) <= u0_m0_wo0_cma0_k8(TO_INTEGER(u0_m0_wo0_cma0_c0(8)));
    u0_m0_wo0_cma0_r(9) <= u0_m0_wo0_cma0_k9(TO_INTEGER(u0_m0_wo0_cma0_c0(9)));
    u0_m0_wo0_cma0_r(10) <= u0_m0_wo0_cma0_k10(TO_INTEGER(u0_m0_wo0_cma0_c0(10)));
    u0_m0_wo0_cma0_r(11) <= u0_m0_wo0_cma0_k11(TO_INTEGER(u0_m0_wo0_cma0_c0(11)));
    u0_m0_wo0_cma0_r(12) <= u0_m0_wo0_cma0_k12(TO_INTEGER(u0_m0_wo0_cma0_c0(12)));
    u0_m0_wo0_cma0_r(13) <= u0_m0_wo0_cma0_k13(TO_INTEGER(u0_m0_wo0_cma0_c0(13)));
    u0_m0_wo0_cma0_r(14) <= u0_m0_wo0_cma0_k14(TO_INTEGER(u0_m0_wo0_cma0_c0(14)));
    u0_m0_wo0_cma0_r(15) <= u0_m0_wo0_cma0_k15(TO_INTEGER(u0_m0_wo0_cma0_c0(15)));
    u0_m0_wo0_cma0_p(0) <= u0_m0_wo0_cma0_a0(0) * u0_m0_wo0_cma0_r(0);
    u0_m0_wo0_cma0_p(1) <= u0_m0_wo0_cma0_a0(1) * u0_m0_wo0_cma0_r(1);
    u0_m0_wo0_cma0_p(2) <= u0_m0_wo0_cma0_a0(2) * u0_m0_wo0_cma0_r(2);
    u0_m0_wo0_cma0_p(3) <= u0_m0_wo0_cma0_a0(3) * u0_m0_wo0_cma0_r(3);
    u0_m0_wo0_cma0_p(4) <= u0_m0_wo0_cma0_a0(4) * u0_m0_wo0_cma0_r(4);
    u0_m0_wo0_cma0_p(5) <= u0_m0_wo0_cma0_a0(5) * u0_m0_wo0_cma0_r(5);
    u0_m0_wo0_cma0_p(6) <= u0_m0_wo0_cma0_a0(6) * u0_m0_wo0_cma0_r(6);
    u0_m0_wo0_cma0_p(7) <= u0_m0_wo0_cma0_a0(7) * u0_m0_wo0_cma0_r(7);
    u0_m0_wo0_cma0_p(8) <= u0_m0_wo0_cma0_a0(8) * u0_m0_wo0_cma0_r(8);
    u0_m0_wo0_cma0_p(9) <= u0_m0_wo0_cma0_a0(9) * u0_m0_wo0_cma0_r(9);
    u0_m0_wo0_cma0_p(10) <= u0_m0_wo0_cma0_a0(10) * u0_m0_wo0_cma0_r(10);
    u0_m0_wo0_cma0_p(11) <= u0_m0_wo0_cma0_a0(11) * u0_m0_wo0_cma0_r(11);
    u0_m0_wo0_cma0_p(12) <= u0_m0_wo0_cma0_a0(12) * u0_m0_wo0_cma0_r(12);
    u0_m0_wo0_cma0_p(13) <= u0_m0_wo0_cma0_a0(13) * u0_m0_wo0_cma0_r(13);
    u0_m0_wo0_cma0_p(14) <= u0_m0_wo0_cma0_a0(14) * u0_m0_wo0_cma0_r(14);
    u0_m0_wo0_cma0_p(15) <= u0_m0_wo0_cma0_a0(15) * u0_m0_wo0_cma0_r(15);
    u0_m0_wo0_cma0_u(0) <= RESIZE(u0_m0_wo0_cma0_p(0),39);
    u0_m0_wo0_cma0_u(1) <= RESIZE(u0_m0_wo0_cma0_p(1),39);
    u0_m0_wo0_cma0_u(2) <= RESIZE(u0_m0_wo0_cma0_p(2),39);
    u0_m0_wo0_cma0_u(3) <= RESIZE(u0_m0_wo0_cma0_p(3),39);
    u0_m0_wo0_cma0_u(4) <= RESIZE(u0_m0_wo0_cma0_p(4),39);
    u0_m0_wo0_cma0_u(5) <= RESIZE(u0_m0_wo0_cma0_p(5),39);
    u0_m0_wo0_cma0_u(6) <= RESIZE(u0_m0_wo0_cma0_p(6),39);
    u0_m0_wo0_cma0_u(7) <= RESIZE(u0_m0_wo0_cma0_p(7),39);
    u0_m0_wo0_cma0_u(8) <= RESIZE(u0_m0_wo0_cma0_p(8),39);
    u0_m0_wo0_cma0_u(9) <= RESIZE(u0_m0_wo0_cma0_p(9),39);
    u0_m0_wo0_cma0_u(10) <= RESIZE(u0_m0_wo0_cma0_p(10),39);
    u0_m0_wo0_cma0_u(11) <= RESIZE(u0_m0_wo0_cma0_p(11),39);
    u0_m0_wo0_cma0_u(12) <= RESIZE(u0_m0_wo0_cma0_p(12),39);
    u0_m0_wo0_cma0_u(13) <= RESIZE(u0_m0_wo0_cma0_p(13),39);
    u0_m0_wo0_cma0_u(14) <= RESIZE(u0_m0_wo0_cma0_p(14),39);
    u0_m0_wo0_cma0_u(15) <= RESIZE(u0_m0_wo0_cma0_p(15),39);
    u0_m0_wo0_cma0_w(0) <= u0_m0_wo0_cma0_u(0);
    u0_m0_wo0_cma0_w(1) <= u0_m0_wo0_cma0_u(1);
    u0_m0_wo0_cma0_w(2) <= u0_m0_wo0_cma0_u(2);
    u0_m0_wo0_cma0_w(3) <= u0_m0_wo0_cma0_u(3);
    u0_m0_wo0_cma0_w(4) <= u0_m0_wo0_cma0_u(4);
    u0_m0_wo0_cma0_w(5) <= u0_m0_wo0_cma0_u(5);
    u0_m0_wo0_cma0_w(6) <= u0_m0_wo0_cma0_u(6);
    u0_m0_wo0_cma0_w(7) <= u0_m0_wo0_cma0_u(7);
    u0_m0_wo0_cma0_w(8) <= u0_m0_wo0_cma0_u(8);
    u0_m0_wo0_cma0_w(9) <= u0_m0_wo0_cma0_u(9);
    u0_m0_wo0_cma0_w(10) <= u0_m0_wo0_cma0_u(10);
    u0_m0_wo0_cma0_w(11) <= u0_m0_wo0_cma0_u(11);
    u0_m0_wo0_cma0_w(12) <= u0_m0_wo0_cma0_u(12);
    u0_m0_wo0_cma0_w(13) <= u0_m0_wo0_cma0_u(13);
    u0_m0_wo0_cma0_w(14) <= u0_m0_wo0_cma0_u(14);
    u0_m0_wo0_cma0_w(15) <= u0_m0_wo0_cma0_u(15);
    u0_m0_wo0_cma0_x(0) <= u0_m0_wo0_cma0_w(0);
    u0_m0_wo0_cma0_x(1) <= u0_m0_wo0_cma0_w(1);
    u0_m0_wo0_cma0_x(2) <= u0_m0_wo0_cma0_w(2);
    u0_m0_wo0_cma0_x(3) <= u0_m0_wo0_cma0_w(3);
    u0_m0_wo0_cma0_x(4) <= u0_m0_wo0_cma0_w(4);
    u0_m0_wo0_cma0_x(5) <= u0_m0_wo0_cma0_w(5);
    u0_m0_wo0_cma0_x(6) <= u0_m0_wo0_cma0_w(6);
    u0_m0_wo0_cma0_x(7) <= u0_m0_wo0_cma0_w(7);
    u0_m0_wo0_cma0_x(8) <= u0_m0_wo0_cma0_w(8);
    u0_m0_wo0_cma0_x(9) <= u0_m0_wo0_cma0_w(9);
    u0_m0_wo0_cma0_x(10) <= u0_m0_wo0_cma0_w(10);
    u0_m0_wo0_cma0_x(11) <= u0_m0_wo0_cma0_w(11);
    u0_m0_wo0_cma0_x(12) <= u0_m0_wo0_cma0_w(12);
    u0_m0_wo0_cma0_x(13) <= u0_m0_wo0_cma0_w(13);
    u0_m0_wo0_cma0_x(14) <= u0_m0_wo0_cma0_w(14);
    u0_m0_wo0_cma0_x(15) <= u0_m0_wo0_cma0_w(15);
    u0_m0_wo0_cma0_y(0) <= u0_m0_wo0_cma0_s(1) + u0_m0_wo0_cma0_x(0);
    u0_m0_wo0_cma0_y(1) <= u0_m0_wo0_cma0_s(2) + u0_m0_wo0_cma0_x(1);
    u0_m0_wo0_cma0_y(2) <= u0_m0_wo0_cma0_s(3) + u0_m0_wo0_cma0_x(2);
    u0_m0_wo0_cma0_y(3) <= u0_m0_wo0_cma0_s(4) + u0_m0_wo0_cma0_x(3);
    u0_m0_wo0_cma0_y(4) <= u0_m0_wo0_cma0_s(5) + u0_m0_wo0_cma0_x(4);
    u0_m0_wo0_cma0_y(5) <= u0_m0_wo0_cma0_s(6) + u0_m0_wo0_cma0_x(5);
    u0_m0_wo0_cma0_y(6) <= u0_m0_wo0_cma0_s(7) + u0_m0_wo0_cma0_x(6);
    u0_m0_wo0_cma0_y(7) <= u0_m0_wo0_cma0_s(8) + u0_m0_wo0_cma0_x(7);
    u0_m0_wo0_cma0_y(8) <= u0_m0_wo0_cma0_s(9) + u0_m0_wo0_cma0_x(8);
    u0_m0_wo0_cma0_y(9) <= u0_m0_wo0_cma0_s(10) + u0_m0_wo0_cma0_x(9);
    u0_m0_wo0_cma0_y(10) <= u0_m0_wo0_cma0_s(11) + u0_m0_wo0_cma0_x(10);
    u0_m0_wo0_cma0_y(11) <= u0_m0_wo0_cma0_s(12) + u0_m0_wo0_cma0_x(11);
    u0_m0_wo0_cma0_y(12) <= u0_m0_wo0_cma0_s(13) + u0_m0_wo0_cma0_x(12);
    u0_m0_wo0_cma0_y(13) <= u0_m0_wo0_cma0_s(14) + u0_m0_wo0_cma0_x(13);
    u0_m0_wo0_cma0_y(14) <= u0_m0_wo0_cma0_s(15) + u0_m0_wo0_cma0_x(14);
    u0_m0_wo0_cma0_y(15) <= u0_m0_wo0_cma0_x(15);
    u0_m0_wo0_cma0_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_a0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_c0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_cma0_a0(0) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(1) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(2) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(3) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(4) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(5) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(6) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(7) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(8) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(9) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(10) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(11) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(12) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(13) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(14) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_a0(15) <= RESIZE(SIGNED(xIn_0),24);
                u0_m0_wo0_cma0_c0(0) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(1) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(2) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(3) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(4) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(5) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(6) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(7) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(8) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(9) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(10) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(11) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(12) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(13) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(14) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(15) <= RESIZE(UNSIGNED(GND_q),3);
            END IF;
            IF (d_u0_m0_wo0_compute_q_11_q = "1") THEN
                u0_m0_wo0_cma0_s(0) <= u0_m0_wo0_cma0_y(0);
                u0_m0_wo0_cma0_s(1) <= u0_m0_wo0_cma0_y(1);
                u0_m0_wo0_cma0_s(2) <= u0_m0_wo0_cma0_y(2);
                u0_m0_wo0_cma0_s(3) <= u0_m0_wo0_cma0_y(3);
                u0_m0_wo0_cma0_s(4) <= u0_m0_wo0_cma0_y(4);
                u0_m0_wo0_cma0_s(5) <= u0_m0_wo0_cma0_y(5);
                u0_m0_wo0_cma0_s(6) <= u0_m0_wo0_cma0_y(6);
                u0_m0_wo0_cma0_s(7) <= u0_m0_wo0_cma0_y(7);
                u0_m0_wo0_cma0_s(8) <= u0_m0_wo0_cma0_y(8);
                u0_m0_wo0_cma0_s(9) <= u0_m0_wo0_cma0_y(9);
                u0_m0_wo0_cma0_s(10) <= u0_m0_wo0_cma0_y(10);
                u0_m0_wo0_cma0_s(11) <= u0_m0_wo0_cma0_y(11);
                u0_m0_wo0_cma0_s(12) <= u0_m0_wo0_cma0_y(12);
                u0_m0_wo0_cma0_s(13) <= u0_m0_wo0_cma0_y(13);
                u0_m0_wo0_cma0_s(14) <= u0_m0_wo0_cma0_y(14);
                u0_m0_wo0_cma0_s(15) <= u0_m0_wo0_cma0_y(15);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_delay : dspba_delay
    GENERIC MAP ( width => 39, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_cma0_s(0)(38 downto 0)), xout => u0_m0_wo0_cma0_qq, clk => clk, aclr => areset );
    u0_m0_wo0_cma0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_cma0_qq(38 downto 0));

    -- u0_m0_wo0_mtree_add0_0(ADD,91)@12 + 1
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(u0_m0_wo0_cma0_q(36 downto 0));
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cma1_q(36 downto 0));
    u0_m0_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(36 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,92)@13 + 1
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 37 => u0_m0_wo0_mtree_add0_0_q(36)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cma2_q);
    u0_m0_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(37 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- d_u0_m0_wo0_compute_q_13(DELAY,102)@12 + 1
    d_u0_m0_wo0_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_12_q, xout => d_u0_m0_wo0_compute_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_oseq_gated_reg(REG,93)@13 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_compute_q_13_q);
        END IF;
    END PROCESS;

    -- out0_m0_wo0_lineup_select_delay_0(DELAY,95)@14
    out0_m0_wo0_lineup_select_delay_0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_reg_q);

    -- out0_m0_wo0_assign_id3(DELAY,97)@14
    out0_m0_wo0_assign_id3_q <= STD_LOGIC_VECTOR(out0_m0_wo0_lineup_select_delay_0_q);

    -- xOut(PORTOUT,98)@14 + 1
    xOut_v <= out0_m0_wo0_assign_id3_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_mtree_add1_0_q;

END normal;
