-- Copyright 2017 by Howard University All rights reserved.
--
-- Design Name: IYKEOSUJI_LC3.VHD
-- Description: Data Path Architecture
-- Name:   Iyke-Osuji Victor
-- ID: @02988642
-- For Final Project 	
-- Date:   04/2022
--
-- Advanced Digital Design Lab (412/406)
--------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity IYKEOSUJI_PATH_ALL is
    generic(  P: integer:= 16;
	      MW: integer:=9;
              N: integer:=3;
	     E: natural:= 8);
    port( CLK: IN STD_LOGIC;
          RSTn: IN STD_LOGIC
         );
end IYKEOSUJI_PATH_ALL;


architecture STRUCTURAL of IYKEOSUJI_PATH_ALL is

--------------------------------------------------------------
--  PATH COMPONENTS
-------------------SEQUENTIAL----------------------------------

component IYKEOSUJI_MAR
    generic(
		P: integer:= 16;
		MW: integer:= 9);
    port (
          CLK: in std_logic;
	  RSTn: in std_logic;
	  EN: in std_logic;
          BUS_IN: in std_logic_vector(P-1 downto 0);
	  MAR_OUT: out std_logic_vector(MW-1 downto 0)
         );
end component;

component IYKEOSUJI_MDR
    generic(P: integer:= 16);
    port (
          CLK: in std_logic;
	  RSTn: in std_logic;
	  EN: in std_logic;
          BUS_IN: in std_logic_vector(P-1 downto 0);
          MEM_IN: in std_logic_vector(P-1 downto 0);
	  MDR_BUS: out std_logic_vector(P-1 downto 0)
         );
end component;


component IYKEOSUJI_RAM
    generic( P  : integer := 16;
	     MW : integer := 9);
    port (
          CLK: in std_logic;
	  MEM_EN: in std_logic;
	  read_write_en: in std_logic;
	  mem_wr_rd_add: in std_logic_vector(MW-1 downto 0);
          DATA_IN: in std_logic_vector(P-1 downto 0);
          DATA_OUT: out std_logic_vector(P-1 downto 0)
         );
end component;


component IYKEOSUJI_IR
    generic(P: integer:= 16);
    port (
          CLK: in std_logic;
	  RSTn: in std_logic;
	  EN: in std_logic;
          IR_BUS_IN: in std_logic_vector(P-1 downto 0);
	  IR_OUT: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_PC
    generic(P: integer:= 16);
    port (
	  CLK: in std_logic;
	  RSTn: in std_logic;
          EN: in std_logic;
          A1_PC: in std_logic_vector(P-1 downto 0);
	  CNTRL_BUS: out std_logic_vector(P-1 downto 0);
	  CNTRL_INC: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_NZP
    generic(
		P: integer:= 16;
		N: integer:= 3);
    port (
          CLK: in std_logic;
	  RSTn: in std_logic;
	  EN: in std_logic;
          NZP_BUS_IN: in std_logic_vector(P-1 downto 0);
	  OP_NZP: out std_logic_vector(N-1 downto 0)
         );
end component;

component IYKEOSUJI_REG_ARRAY
    generic( P: integer:= 16;
	     W: integer:= 3;
	     E: natural:= 8
		);
    port (
          CLK: in std_logic;
	  RSTn: in std_logic;
	  LD_REG: in std_logic;
          ARR_BUS_IN: in std_logic_vector(P-1 downto 0);  
          DR: in std_logic_vector(N-1 downto 0);
          SR1: in std_logic_vector(N-1 downto 0);
          SR2: in std_logic_vector(N-1 downto 0);
	  SR1_OUT: out std_logic_vector(P-1 downto 0);
	  SR2_OUT: out std_logic_vector(P-1 downto 0)
         );
end component;




-----------------COMBINATIONAL------------------------------
component IYKEOSUJI_gate_mdr
    generic(
		P: integer:= 16);
    port (
	  EN: in std_logic;
          gate_mdr_IN: in std_logic_vector(P-1 downto 0);
	  gate_mdr_OUT: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_gate_PC
    generic(
		P: integer:= 16);
    port (
	  EN: in std_logic;
          gate_PC_IN: in std_logic_vector(P-1 downto 0);
	  gate_PC_OUT: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_gate_ALU
    generic(
		P: integer:= 16);
    port (
	  EN: in std_logic;
          gate_ALU_IN: in std_logic_vector(P-1 downto 0);
	  gate_ALU_OUT: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_gate_MARMUX
    generic(
		P: integer:= 16);
    port (
	  EN: in std_logic;
          gate_MARMUX_IN: in std_logic_vector(P-1 downto 0);
	  gate_MARMUX_OUT: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_MARMUX
    generic(
		P: integer:= 16);
    port (
          OP_A, OP_B: in std_logic_vector(P-1 downto 0);
	  Sel: in std_logic;
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_ADDR1MUX
    generic(
		P: integer:= 16);
    port (
          OP_A, OP_B: in std_logic_vector(P-1 downto 0);
	  Sel: in std_logic;
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_SR2MUX
    generic(
		P: integer:= 16);
    port (
          OP_A, OP_B: in std_logic_vector(P-1 downto 0);
	  Sel: in std_logic;
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_PCMUX
    generic(
		P: integer:= 16);
    port (
          OP_A, OP_B, OP_C: in std_logic_vector(P-1 downto 0);
	  Sel: in std_logic_vector(1 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_ADDR2MUX
    generic(
		P: integer:= 16);
    port (
          OP_A, OP_B, OP_C: in std_logic_vector(P-1 downto 0);
	  Sel: in std_logic_vector(1 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_ALU
    generic(
		P: integer:= 16);
    port (
          OP_A: in std_logic_vector(P-1 downto 0);
          OP_B: in std_logic_vector(P-1 downto 0);
	  Sel: in std_logic_vector(1 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_comb_adder
    port (
          OP_A: in std_logic_vector(15 downto 0);
          OP_B: in std_logic_vector(15 downto 0);
	  OP_Q: out std_logic_vector(15 downto 0)
         );
end component;

component IYKEOSUJI_Sext_5_16
    generic(
		P: integer:= 16);

    port (
          OP_A: in std_logic_vector(4 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_Sext_6_16
    generic(
		P: integer:= 16);

    port (
          OP_A: in std_logic_vector(5 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_Sext_9_16
    generic(
		P: integer:= 16);

    port (
          OP_A: in std_logic_vector(8 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_Sext_11_16
    generic(
		P: integer:= 16);

    port (
          OP_A: in std_logic_vector(10 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_Zext_8_16
    generic(
		P: integer:= 16);

    port (
          OP_A: in std_logic_vector(7 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end component;

component IYKEOSUJI_LC3_FSM
    port( CLK: IN STD_LOGIC;
          RSTn: IN STD_LOGIC;
	  FROM_IR: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	  FROM_NZP: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          MAR_EN: OUT STD_LOGIC;
          MDR_EN: OUT STD_LOGIC;
          MEM_EN: OUT STD_LOGIC;
          READ_WRITE_ENABLE: OUT STD_LOGIC;
          GATE_MDR: OUT STD_LOGIC;
          GATE_PC: OUT STD_LOGIC;
          GATE_MARMUX: OUT STD_LOGIC;
          GATE_ALU: OUT STD_LOGIC;
	  LD_IR: OUT STD_LOGIC;
	  LD_PC: OUT STD_LOGIC;
	  LD_CC: OUT STD_LOGIC;
	  LD_REG: OUT STD_LOGIC;
	  MM_SEL: OUT STD_LOGIC;
	  ADDR1MUX_SEL: OUT STD_LOGIC;
	  SR2MUX_SEL: OUT STD_LOGIC;
	  PCMUX_SEL: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	  ADDR2MUX_SEL: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	  ALU_SEL: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	  DR_SEL: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	  SR1_SEL: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	  SR2_SEL: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
         );
end component;


---------------------Intermediate Component Signals------------------------------
signal S_MAR_OUT: std_logic_vector(MW-1 downto 0):= (others => 'X');
signal S_MDR_BUS: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_MEM_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_PC_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_PC_INC: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_SR1_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_SR2_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_SEXT5_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_SEXT6_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_SEXT9_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_SEXT11_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_ZEXT8_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_SR2MUX_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_ALU_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_ADDR2MUX_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_ADDR1MUX_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_ADDER_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_PCMUX_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_MARMUX_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_IR_OUT: std_logic_vector(P-1 downto 0):= (others => 'X');
signal S_NZP_OUT: std_logic_vector(N-1 downto 0):= (others => 'X');
signal BUS_DATA: std_logic_vector(P-1 downto 0):= (others => 'X');

------------Control Signals-----------------------------------------
signal S_MAR_EN: std_logic:= 'X';
signal S_MDR_EN: std_logic:= 'X';
signal S_MEM_EN: std_logic:= 'X';
signal S_READ_WRITE_ENABLE: std_logic:= 'X';
signal S_GATE_MDR: std_logic:= 'X';
signal S_GATE_PC: std_logic:= 'X';
signal S_GATE_MARMUX: std_logic:= 'X';
signal S_GATE_ALU: std_logic:= 'X';
signal S_LD_IR: std_logic:= 'X';
signal S_LD_PC: std_logic:= 'X';
signal S_LD_CC: std_logic:= 'X';
signal S_LD_REG: std_logic:= 'X';
signal S_MM_SEL: std_logic:= 'X';
signal S_ADDR1MUX_SEL: std_logic:= 'X';
signal S_SR2MUX_SEL: std_logic:= 'X';
signal S_PCMUX_SEL: std_logic_vector(1 downto 0):= (others => 'X');
signal S_ADDR2MUX_SEL: std_logic_vector(1 downto 0):= (others => 'X');
signal S_ALU_SEL: std_logic_vector(1 downto 0):= (others => 'X');
signal S_DR_SEL: std_logic_vector(2 downto 0):= (others => 'X');
signal S_SR1_SEL: std_logic_vector(2 downto 0):= (others => 'X');
signal S_SR2_SEL: std_logic_vector(2 downto 0):= (others => 'X');



begin
--------------------------------INSTANTIATIONS--------------------------------------------------

Inst1_MAR: IYKEOSUJI_MAR generic map(P, MW) port map(CLK, RSTn, S_MAR_EN, BUS_DATA, S_MAR_OUT);

Inst2_RAM: IYKEOSUJI_RAM generic map(P, MW) port map(CLK, S_MEM_EN, S_READ_WRITE_ENABLE, S_MAR_OUT, S_MDR_BUS, S_MEM_OUT);

Inst3_MDR: IYKEOSUJI_MDR generic map(P) port map(CLK, RSTn, S_MDR_EN, BUS_DATA, S_MEM_OUT, S_MDR_BUS);

Inst4_Gate_MDR: IYKEOSUJI_gate_mdr generic map(P) port map(S_GATE_MDR, S_MDR_BUS, BUS_DATA);

Inst5_IR: IYKEOSUJI_IR generic map(P) port map(CLK, RSTn, S_LD_IR, BUS_DATA, S_IR_OUT);

Inst6_PC: IYKEOSUJI_PC generic map(P) port map(CLK, RSTn, S_LD_PC, S_PCMUX_OUT, S_PC_OUT, S_PC_INC);

Inst7_Gate_PC: IYKEOSUJI_gate_PC generic map(P) port map(S_GATE_PC, S_PC_OUT, BUS_DATA);

Inst8_NZP: IYKEOSUJI_NZP generic map(P, N) port map(CLK, RSTn, S_LD_CC, BUS_DATA, S_NZP_OUT);

Inst9_REGFILE: IYKEOSUJI_REG_ARRAY generic map(P, N, E) port map(CLK, RSTn, S_LD_REG, BUS_DATA, S_DR_SEL, S_SR1_SEL, S_SR2_SEL, S_SR1_OUT, S_SR2_OUT);

Inst10_Gate_MARMUX: IYKEOSUJI_gate_MARMUX generic map(P) port map(S_GATE_MARMUX, S_MARMUX_OUT, BUS_DATA);

Inst11_Gate_ALU: IYKEOSUJI_gate_ALU generic map(P) port map(S_GATE_ALU, S_ALU_OUT, BUS_DATA);

Inst12_5Sext16: IYKEOSUJI_Sext_5_16 generic map(P) port map(S_IR_OUT(4 downto 0), S_SEXT5_OUT);

Inst13_6Sext16: IYKEOSUJI_Sext_6_16 generic map(P) port map(S_IR_OUT(5 downto 0), S_SEXT6_OUT);

Inst14_9Sext16: IYKEOSUJI_Sext_9_16 generic map(P) port map(S_IR_OUT(8 downto 0), S_SEXT9_OUT);

Inst15_11Sext16: IYKEOSUJI_Sext_11_16 generic map(P) port map(S_IR_OUT(10 downto 0), S_SEXT11_OUT);

Inst16_8Zext16: IYKEOSUJI_Zext_8_16 generic map(P) port map(S_IR_OUT(7 downto 0), S_ZEXT8_OUT);

Inst17_ADDR2MUX: IYKEOSUJI_ADDR2MUX generic map(P) port map(S_SEXT6_OUT, S_SEXT9_OUT, S_SEXT11_OUT, S_ADDR2MUX_SEL, S_ADDR2MUX_OUT);

Inst18_ADDR1MUX: IYKEOSUJI_ADDR1MUX generic map(P) port map(S_PC_INC, S_SR1_OUT, S_ADDR1MUX_SEL, S_ADDR1MUX_OUT);

Inst19_SR2MUX: IYKEOSUJI_SR2MUX generic map(P) port map(S_SR2_OUT, S_SEXT5_OUT, S_SR2MUX_SEL, S_SR2MUX_OUT);

Inst20_ALU: IYKEOSUJI_ALU generic map(P) port map(S_SR1_OUT, S_SR2MUX_OUT, S_ALU_SEL, S_ALU_OUT);

Inst21_Adder: IYKEOSUJI_comb_adder generic map(P) port map(S_ADDR1MUX_OUT, S_ADDR2MUX_OUT, S_ADDER_OUT);

Inst22_MARMUX: IYKEOSUJI_MARMUX generic map(P) port map(S_ADDER_OUT, S_ZEXT8_OUT, S_MM_SEL, S_MARMUX_OUT);

Inst23_PCMUX: IYKEOSUJI_PCMUX generic map(P) port map(S_PC_INC, S_ADDER_OUT, BUS_DATA, S_PCMUX_SEL, S_PCMUX_OUT);

inst_DATAPATH: IYKEOSUJI_LC3_FSM port map(CLK, RSTn, S_IR_OUT, S_NZP_OUT, S_MAR_EN, S_MDR_EN, S_MEM_EN, S_READ_WRITE_ENABLE, 
					  S_GATE_MDR, S_GATE_PC, S_GATE_MARMUX, S_GATE_ALU, S_LD_IR, S_LD_PC, 
					  S_LD_CC, S_LD_REG, S_MM_SEL, S_ADDR1MUX_SEL, S_SR2MUX_SEL, S_PCMUX_SEL,
					  S_ADDR2MUX_SEL, S_ALU_SEL, S_DR_SEL, S_SR1_SEL, S_SR2_SEl);



end STRUCTURAL;



































