-- Copyright 2017 by Howard University All rights reserved.
-----------------------------------------------------------
-- LC3 Data Path Components
-----------------------------------------------------------
-- Name:   Iyke-Osuji Victor
-- ID: @02988642
-- For Final Project
-- Date:   04/2022
-- Advanced Digital Design Lab (412/406)
-----------------------------------------------------------
-- All Entities are components
-- 2-1 Multiplex (Address1 Mux, Marmux, Sr2Mux)
-- 3-1 Multiplex (PC Mux)
-- 4-1 Multiplex (Address2 Mux)
-- 5-16 Sign Extender
-- 6-16 Sign Extender
-- 9-16 Sign Extender
-- 11-16 Sign Extender
-- 8-16 Zero Extender
-- ALU
-- Combinational Adder
-- Tristate (Gate Mdr, Gate PC, Gate ALU, Gate MarMux)
-- 16Bit Register (Instruction Register)
-- 16Bit Program Counter
-- 16Bit NZP
-- Register Array (Register File)
-- MAR
-- MDR
-- RAM
-----------------------------------------------------------
-- GENERICS P(16), MW(9), N(3), E(8)
-----------------------------------------------------------
-- PATH I/O
-----------------------------------------------------------
-- Clk: Global
-- RSTn: Global
-----------------------------------------------------------



-----------------------------------------------------------
-----------------------------------------------------------
-- Memory Address Register (MAR)
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: 16-bit Register for Memory Addresses
-- Output 9-bits to Memory  
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity IYKEOSUJI_MAR is
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
end IYKEOSUJI_MAR;


architecture MAR_BEH of IYKEOSUJI_MAR is

    SIGNAL MAR_DATA_OUT : std_logic_vector(MW-1 downto 0) := (others => 'X');

    begin

    SYNRES_MAR: process(CLK)
    begin
        if (CLK'event and CLK = '1') then
	    if (RSTn = '1') then
		MAR_DATA_OUT <= (others => 'Z');
	    elsif (EN = '1') then
		MAR_DATA_OUT <= BUS_IN(8 downto 0);
	    else
		MAR_DATA_OUT <= MAR_DATA_OUT;
	    end if;
	end if;
    end process SYNRES_MAR;
    
    MAR_OUT <= MAR_DATA_OUT;

end MAR_BEH;


-----------------------------------------------------------
-----------------------------------------------------------
-- Memory Data Register (MDR)
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: 16-bit Register for READ/WRITE DATA
-- Output to bus (READ) or to memory (WRITE)  
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity IYKEOSUJI_MDR is
    generic(P: integer:= 16);
    port (
          CLK: in std_logic;
	  RSTn: in std_logic;
	  EN: in std_logic;
          BUS_IN: in std_logic_vector(P-1 downto 0);
          MEM_IN: in std_logic_vector(P-1 downto 0);
	  MDR_BUS: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_MDR;


architecture MDR_BEH of IYKEOSUJI_MDR is

    SIGNAL MDR_DATA : std_logic_vector(P-1 downto 0) := (others => 'X');

    begin
    MDR_REG: process(CLK)
    begin
        if (CLK'event and CLK = '1') then
	    if (RSTn = '1') then
		MDR_DATA <= (others => 'Z');
	    elsif (EN = '1') then
		MDR_DATA <= BUS_IN;
	    elsif (EN = '0') then
		MDR_DATA <= MEM_IN;
	    else
		MDR_DATA <= MDR_DATA;
	    end if;
	else
	    MDR_DATA <= MDR_DATA;
	end if;
    end process MDR_REG;
    
    MDR_BUS <= MDR_DATA;

end MDR_BEH;



-----------------------------------------------------------
-----------------------------------------------------------
-- RAM 
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: MEMORY with 2**9 of 16 bit words
-- Output to MDR  
--------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


ENTITY IYKEOSUJI_RAM is
    generic( 
	     P  : integer := 16;
             MW : integer := 9);
    port (
          CLK: in std_logic;
	  MEM_EN: in std_logic;
	  read_write_en: in std_logic;
	  mem_wr_rd_add: in std_logic_vector(MW-1 downto 0);
          DATA_IN: in std_logic_vector(P-1 downto 0);
          DATA_OUT: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_RAM;


architecture RAM_512 of IYKEOSUJI_RAM is

    type data_array is array(integer range<>) of std_logic_vector(P-1 downto 0);

    SIGNAL DATA: data_array(0 to (2**MW-1)) := (
    "0010010000001110", "1010001000001110", "0010100000001110", "0101000001000100",
    "1001011100111111", "0001101001000010", "0001111100101101", "0011101000100001",
    "1011011000001111", "0000000000000000", "0000000000000000", "0000000000000000",
    "0000000000011011", "0000000000000011", "0000000000000110", "0000000000001001",
    "0000000000001100", "0000000000101101", "0000000000010010", "0000000000010101",
    "0000000000011000", "0000000000011011", "0000000000011110", "0000000000100001", 
    "0000000000100100", "0000000000100111", "0000000000101010", "0000000000101101", 
    "0000000000110000", "0000000000110011", "0000000000110110", "0000000000111001", 
    others => "XXXXXXXXXXXXXXXX");

    SIGNAL sDATA_OUT: std_logic_vector(P-1 downto 0) := (others => 'X');

    begin
    MEMORY: process(CLK, read_write_en)
    begin
        if (CLK'event and CLK = '1') then
	    if (mem_en = '0') then
		sDATA_OUT <= (others => 'Z');

	    elsif (read_write_en = '1') then
		DATA(to_integer(unsigned(mem_wr_rd_add))) <= DATA_IN;
		sDATA_OUT <= (others => 'Z');

	    elsif (read_write_en = '0') then
		sDATA_OUT <= DATA(to_integer(unsigned(mem_wr_rd_add)));

	    end if;
	else
	    sDATA_OUT <= sDATA_OUT;
	    DATA <= DATA;
	
        end if;
    end process MEMORY;
    
    DATA_OUT <= sDATA_OUT;

end RAM_512;



-----------------------------------------------------------
-----------------------------------------------------------
-- Gate MDR
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: Tristate gate for MDR Register
-- Controls OUTPUT to BUS. Output is 16 bits data
-- Output to Bus(EN= '1'). Bus isolated(EN='0')  
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity IYKEOSUJI_gate_mdr is
    generic(
		P: integer:= 16);
    port (
	  EN: in std_logic;
          gate_mdr_IN: in std_logic_vector(P-1 downto 0);
	  gate_mdr_OUT: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_gate_mdr;


architecture Tristate_BEH of IYKEOSUJI_gate_mdr is

    SIGNAL S_TRI_MDR : std_logic_vector(P-1 downto 0) := (others => 'Z');

    begin

    S_TRI_MDR <= gate_MDR_IN when (EN = '1') else
	        (others => 'Z');
    
    gate_mdr_OUT <= S_TRI_MDR;

end Tristate_BEH;



-----------------------------------------------------------
-----------------------------------------------------------
-- Instruction Register
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: 16 Bit Register to hold Instruction
-- Output to Combinational Circuit/FSM  
--------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity IYKEOSUJI_IR is
    generic(P: integer:= 16);
    port (
          CLK: in std_logic;
	  RSTn: in std_logic;
	  EN: in std_logic;
          IR_BUS_IN: in std_logic_vector(P-1 downto 0);
	  IR_OUT: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_IR;


architecture IR_BEH of IYKEOSUJI_IR is

SIGNAL sIR_OUT  : std_logic_vector(15 downto 0) := (others => 'X');

begin

Instr: process(CLK)
    begin
        if (CLK'event and Clk = '1') then
	    if (RSTn = '1') then
		sIR_OUT <= (others => '0');
	    elsif (EN = '1') then
		sIR_OUT <= IR_BUS_IN;
	    else
		sIR_OUT <= sIR_OUT;
	    end if;
	else
	    sIR_OUT <= sIR_OUT;
	end if;
end process Instr;
    
    IR_OUT <= sIR_OUT;

end IR_BEH;



-----------------------------------------------------------
-----------------------------------------------------------
-- Program Counter
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: 16 Bit Program Counter that keeps track of program
-- Contains next instruction address
-- Main Output to Bus, Increments output 
--------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity IYKEOSUJI_PC is
    generic(P: integer:= 16);
    port (
	  CLK: in std_logic;
	  RSTn: in std_logic;
          EN: in std_logic;
          A1_PC: in std_logic_vector(P-1 downto 0);
	  CNTRL_BUS: out std_logic_vector(P-1 downto 0);
	  CNTRL_INC: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_PC;


architecture PC_BEH of IYKEOSUJI_PC is

SIGNAL PC_DATA  : std_logic_vector(15 downto 0) := (others => 'X');
SIGNAL PC_DATA_PLUS  : std_logic_vector(15 downto 0) := (others => 'X');

begin

PC: process(CLK)
    begin
        if (CLK'event and CLK = '1') then
	    if (RSTn = '1') then
		PC_DATA         <= (others => '0');
		PC_DATA_PLUS    <= "0000000000000000" + '1';

	    elsif (EN = '1') then
		PC_DATA         <= A1_PC;
		PC_DATA_PLUS    <= A1_PC + '1';
	    else
		PC_DATA         <= PC_DATA;
		PC_DATA_PLUS    <= PC_DATA_PLUS;
	    end if;
	else
	    PC_DATA         <= PC_DATA;
	    PC_DATA_PLUS    <= PC_DATA_PLUS;
	end if;
end process PC;
    
    CNTRL_BUS        <= PC_DATA;
    CNTRL_INC   <= PC_DATA_PLUS;

end PC_BEH;



-----------------------------------------------------------
-----------------------------------------------------------
-- Gate PC
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: Tristate gate for PC Register
-- Controls OUTPUT to BUS. Output is 16 bits data
-- Output to Bus(EN= '1'). Bus isolated(EN='0')  
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity IYKEOSUJI_gate_PC is
    generic(
		P: integer:= 16);
    port (
	  EN: in std_logic;
          gate_PC_IN: in std_logic_vector(P-1 downto 0);
	  gate_PC_OUT: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_gate_PC;


architecture Tristate_BEH of IYKEOSUJI_gate_PC is

    SIGNAL S_TRI_PC : std_logic_vector(P-1 downto 0) := (others => 'Z');

    begin

    S_TRI_PC <= gate_PC_IN when (EN = '1') else
	        (others => 'Z');
    
    gate_PC_OUT <= S_TRI_PC;

end Tristate_BEH;


-----------------------------------------------------------
-----------------------------------------------------------
-- NZP Logic Register
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: 16-3 bit special register
-- Checks if input is positive, negative, or zero
-- Output to FSM  
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity IYKEOSUJI_NZP is
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
end IYKEOSUJI_NZP;


architecture NZP_BEH of IYKEOSUJI_NZP is

SIGNAL NZP_OUT  : std_logic_vector(2 downto 0) := (others => 'X');

begin

NZP_LOGREG: process(CLK)
    begin
        if (CLK = '1' and CLK'event) then
	    if (RSTn = '1') then
		NZP_OUT <= (others => '0');
	    elsif (EN = '1') then
		if (NZP_BUS_IN(15) = '1') then
		    NZP_OUT <= "100";

		elsif (NZP_BUS_IN(14 downto 0) = "000000000000000") then
		    NZP_OUT <= "010";

		else
		    NZP_OUT <= "001";  
		end if;
	    else
		NZP_OUT <= NZP_OUT;
	    end if;
	else
	    NZP_OUT <= NZP_OUT;
	end if;
end process NZP_LOGREG;
    
    OP_NZP <= NZP_OUT;

end NZP_BEH;



-----------------------------------------------------------
-----------------------------------------------------------
-- Generic N Register
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: Generic Register Entitity for Register File
--------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity IYKEOSUJI_GEN_REG is
    generic(L: integer:= 16);
    port (
          CLK: in std_logic;
	  RST: in std_logic;
	  EN: in std_logic;
          OP_A: in std_logic_vector(L-1 downto 0);
	  OP_Q: out std_logic_vector(L-1 downto 0)
         );
end IYKEOSUJI_GEN_REG;


architecture REG_16BIT of IYKEOSUJI_GEN_REG is

SIGNAL sOP_A  : std_logic_vector(15 downto 0);
SIGNAL sOP_Q  : std_logic_vector(15 downto 0) := (others => 'X');

begin
    sOP_A <= OP_A;

SYNRES_REG: process(CLK)
    begin
        if (CLK'event and Clk = '1') then
	    if (RST = '1') then
		sOP_Q <= (others => '0');
	    elsif (EN = '1') then
		sOP_Q <= sOP_A;
	    else
		sOP_Q <= sOP_Q;
	    end if;
	else
	    sOP_Q <= sOP_Q;
	end if;
end process SYNRES_REG;
    
    OP_Q <= sOP_Q;

end REG_16BIT;



-----------------------------------------------------------
-----------------------------------------------------------
-- REG FILE
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: Array of 8 16-bit registers
-- Stores Data from the Bus when Enabled
-- Output SR1/SR2 to ALU/SR2MUX  
--------------------------------------------------------------


LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;



ENTITY IYKEOSUJI_REG_ARRAY is
    generic( P: integer:= 16;
	     W: integer:= 3;
	     E: natural:= 8
		);
    port (
          CLK: in std_logic;
	  RSTn: in std_logic;
	  LD_REG: in std_logic;
          ARR_BUS_IN: in std_logic_vector(P-1 downto 0);  
          DR: in std_logic_vector(W-1 downto 0);
          SR1: in std_logic_vector(W-1 downto 0);
          SR2: in std_logic_vector(W-1 downto 0);
	  SR1_OUT: out std_logic_vector(P-1 downto 0);
	  SR2_OUT: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_REG_ARRAY;


ARCHITECTURE BEH_REGARY of IYKEOSUJI_REG_ARRAY is

    TYPE regary is ARRAY(E-1 downto 0) of std_logic_vector(P-1 downto 0);
    SIGNAL sEN: std_logic_vector(E-1 downto 0);
    SIGNAL sFF: regary;


    COMPONENT IYKEOSUJI_GEN_REG
    generic(L: integer:= 16);
    port (
          CLK: in std_logic;
	  RST: in std_logic;
	  EN: in std_logic;
          OP_A: in std_logic_vector(L-1 downto 0);
	  OP_Q: out std_logic_vector(L-1 downto 0)
         );
    end COMPONENT;

    begin
	p0: PROCESS(DR, LD_REG)
	begin
	    sEN <= (sEN'range => '0');
	    sEN(to_integer(unsigned(DR))) <= LD_REG;
	end PROCESS;
	

	g0: for j in 0 to (E-1) GENERATE
	    regh0: IYKEOSUJI_GEN_REG
		port map(CLK, RSTn, sEN(j), ARR_BUS_IN, sFF(j));
	end GENERATE;	


	SR1_OUT <= sFF(to_integer(unsigned(SR1)));
	SR2_OUT <= sFF(to_integer(unsigned(SR2)));

end BEH_REGARY;




-----------------------------------------------------------
-----------------------------------------------------------
-- Gate MARMUX
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: Tristate gate for MARMUX Register
-- Controls OUTPUT to BUS. Output is 16 bits data
-- Output to Bus(EN= '1'). Bus isolated(EN='0')  
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity IYKEOSUJI_gate_MARMUX is
    generic(
		P: integer:= 16);
    port (
	  EN: in std_logic;
          gate_MARMUX_IN: in std_logic_vector(P-1 downto 0);
	  gate_MARMUX_OUT: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_gate_MARMUX;


architecture Tristate_BEH of IYKEOSUJI_gate_MARMUX is

    SIGNAL S_TRI_MARMUX : std_logic_vector(P-1 downto 0) := (others => 'Z');

    begin

    S_TRI_MARMUX <= gate_MARMUX_IN when (EN = '1') else
	        (others => 'Z');
    
    gate_MARMUX_OUT <= S_TRI_MARMUX;

end Tristate_BEH;



-----------------------------------------------------------
-----------------------------------------------------------
-- Gate ALU
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: Tristate gate for ALU Register
-- Controls OUTPUT to BUS. Output is 16 bits data
-- Output to Bus(EN= '1'). Bus isolated(EN='0')  
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity IYKEOSUJI_gate_ALU is
    generic(
		P: integer:= 16);
    port (
	  EN: in std_logic;
          gate_ALU_IN: in std_logic_vector(P-1 downto 0);
	  gate_ALU_OUT: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_gate_ALU;


architecture Tristate_BEH of IYKEOSUJI_gate_ALU is

    SIGNAL S_TRI_ALU : std_logic_vector(P-1 downto 0) := (others => 'Z');

    begin

    S_TRI_ALU <= gate_ALU_IN when (EN = '1') else
	        (others => 'Z');
    
    gate_ALU_OUT <= S_TRI_ALU;

end Tristate_BEH;


-----------------------------------------------------------
-----------------------------------------------------------
-- MARMUX
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: 2 to 1 Multiplex with 16-bit inputs
-- Output to BUS 
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity IYKEOSUJI_MARMUX is
    generic(
		P: integer:= 16);
    port (
          OP_A, OP_B: in std_logic_vector(P-1 downto 0);
	  Sel: in std_logic;
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_MARMUX;


architecture mult2_1 of IYKEOSUJI_MARMUX is
signal sADDR: std_logic_vector(15 downto 0) := (others => 'X');

begin
    sADDR <= OP_A when (Sel = '0') else
	    OP_B;
    OP_Q <= sADDR;
end mult2_1;


-----------------------------------------------------------
-----------------------------------------------------------
-- ADDR1MUX
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: 2 to 1 Multiplex with 16-bit inputs
-- Output to Combinational Adder 
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity IYKEOSUJI_ADDR1MUX is
    generic(
		P: integer:= 16);
    port (
          OP_A, OP_B: in std_logic_vector(P-1 downto 0);
	  Sel: in std_logic;
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_ADDR1MUX;


architecture mult2_1 of IYKEOSUJI_ADDR1MUX is
signal sADDR: std_logic_vector(15 downto 0) := (others => 'X');

begin
    sADDR <= OP_A when (Sel = '0') else
	    OP_B;
    OP_Q <= sADDR;
end mult2_1;


-----------------------------------------------------------
-----------------------------------------------------------
-- SR2MUX
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: 2 to 1 Multiplex with 16-bit inputs
-- Output to ALU
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity IYKEOSUJI_SR2MUX is
    generic(
		P: integer:= 16);
    port (
          OP_A, OP_B: in std_logic_vector(P-1 downto 0);
	  Sel: in std_logic;
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_SR2MUX;


architecture mult2_1 of IYKEOSUJI_SR2MUX is
signal sADDR: std_logic_vector(15 downto 0) := (others => 'X');

begin
    sADDR <= OP_A when (Sel = '0') else
	    OP_B;
    OP_Q <= sADDR;
end mult2_1;



-----------------------------------------------------------
-----------------------------------------------------------
-- PCMUX
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: 3 to 1 Multiplex with 16-bit inputs
-- Output to PC
--------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
entity IYKEOSUJI_PCMUX is
    generic(
		P: integer:= 16);
    port (
          OP_A, OP_B, OP_C: in std_logic_vector(P-1 downto 0);
	  Sel: in std_logic_vector(1 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_PCMUX;


architecture mult3_1 of IYKEOSUJI_PCMUX is
signal s_PCADDR: std_logic_vector(15 downto 0) := (others => 'X');

begin
    s_PCADDR <= OP_A when (Sel = "00") else
	    OP_B when (Sel = "01") else
	    OP_C;

    OP_Q <= s_PCADDR;

end mult3_1;



-----------------------------------------------------------
-----------------------------------------------------------
-- ADDR2MUX
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: 4 to 1 Multiplex with 16-bit inputs
-- Output to Combinational Adder
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity IYKEOSUJI_ADDR2MUX is
    generic(
		P: integer:= 16);
    port (
          OP_A, OP_B, OP_C: in std_logic_vector(P-1 downto 0);
	  Sel: in std_logic_vector(1 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_ADDR2MUX;


architecture mult4_1 of IYKEOSUJI_ADDR2MUX is
signal s_ADDR: std_logic_vector(15 downto 0) := (others => 'X');

begin
    s_ADDR <= OP_A            when (Sel = "01") else
	    OP_B            when (Sel = "10") else
	    OP_C            when (Sel = "11") else
	   (others => '0');
    OP_Q <= s_ADDR;

end mult4_1;


-----------------------------------------------------------
-----------------------------------------------------------
-- ALU
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: ALU with 16-bit inputs
-- Output to Bus
--------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;



entity IYKEOSUJI_ALU is
    generic(
		P: integer:= 16);
    port (
          OP_A: in std_logic_vector(P-1 downto 0);
          OP_B: in std_logic_vector(P-1 downto 0);
	  Sel: in std_logic_vector(1 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_ALU;


architecture ALU of IYKEOSUJI_ALU is

SIGNAL sOP_Q  : std_logic_vector(15 downto 0) := (others => 'X');

begin


    sOP_Q <= (OP_A + OP_B) when (Sel = "00") else
	     (OP_B AND OP_A) when (Sel = "01") else
	     (NOT OP_A) when (Sel = "10") else
	     (OP_A);
	
    OP_Q <= sOP_Q;
end ALU;


-----------------------------------------------------------
-----------------------------------------------------------
-- Combinational Adder
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: Comb-Adder with 16-bit inputs
-- Output to PCMUX/MARMUX
--------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity IYKEOSUJI_comb_adder is
    port (
          OP_A: in std_logic_vector(15 downto 0);
          OP_B: in std_logic_vector(15 downto 0);
	  OP_Q: out std_logic_vector(15 downto 0)
         );
end IYKEOSUJI_comb_adder;


architecture comb_adder of IYKEOSUJI_comb_adder is

SIGNAL sOP_Q  : std_logic_vector(15 downto 0) := (others => 'X');

begin


   sOP_Q <= (OP_A + OP_B);
	
    OP_Q <= sOP_Q;
end comb_adder;


-----------------------------------------------------------
-----------------------------------------------------------
-- SEXT [4:0]
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: Sign Extender with 5-bit input
-- Output 16 bits to SR2MUX
--------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
entity IYKEOSUJI_Sext_5_16 is
    generic(
		P: integer:= 16);

    port (
          OP_A: in std_logic_vector(4 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_Sext_5_16;


architecture Sext5_16 of IYKEOSUJI_Sext_5_16 is

SIGNAL sZEROS : std_logic_vector(10 downto 0) := (OTHERS => '0');
SIGNAL sONES  : std_logic_vector(10 downto 0) := (OTHERS => '1');
SIGNAL sOP_Q  : std_logic_vector(15 downto 0) := (others => 'X');

begin


    sOP_Q <= sZEROS(10 downto 0) & OP_A(4 downto 0) when  OP_A(4) = '0' else
	     sONES(10 downto 0) & OP_A(4 downto 0);
	
    OP_Q <= sOP_Q;
end Sext5_16;

-----------------------------------------------------------
-----------------------------------------------------------
-- SEXT [5:0]
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: Sign Extender with 6-bit input
-- Output 16 bits to ADDR2MUX
--------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
entity IYKEOSUJI_Sext_6_16 is
    generic(
		P: integer:= 16);

    port (
          OP_A: in std_logic_vector(5 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_Sext_6_16;


architecture Sext6_16 of IYKEOSUJI_Sext_6_16 is

SIGNAL sZEROS : std_logic_vector(9 downto 0) := (OTHERS => '0');
SIGNAL sONES  : std_logic_vector(9 downto 0) := (OTHERS => '1');
SIGNAL sOP_Q  : std_logic_vector(15 downto 0) := (others => 'X');

begin


    sOP_Q <= sZEROS(9 downto 0) & OP_A(5 downto 0) when  OP_A(5) = '0' else
	     sONES(9 downto 0) & OP_A(5 downto 0);
	
    OP_Q <= sOP_Q;
end Sext6_16;


-----------------------------------------------------------
-----------------------------------------------------------
-- SEXT [8:0]
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: Sign Extender with 9-bit input
-- Output 16 bits to SR2MUX
--------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
entity IYKEOSUJI_Sext_9_16 is
    generic(
		P: integer:= 16);

    port (
          OP_A: in std_logic_vector(8 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_Sext_9_16;


architecture Sext9_16 of IYKEOSUJI_Sext_9_16 is

SIGNAL sZEROS : std_logic_vector(6 downto 0) := (OTHERS => '0');
SIGNAL sONES  : std_logic_vector(6 downto 0) := (OTHERS => '1');
SIGNAL sOP_Q  : std_logic_vector(15 downto 0) := (others => 'X');

begin


    sOP_Q <= sZEROS(6 downto 0) & OP_A(8 downto 0) when  OP_A(8) = '0' else
	     sONES(6 downto 0) & OP_A(8 downto 0);
	
    OP_Q <= sOP_Q;
end Sext9_16;


-----------------------------------------------------------
-----------------------------------------------------------
-- SEXT [10:0]
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: Sign Extender with 11-bit input
-- Output 16 bits to SR2MUX
--------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
entity IYKEOSUJI_Sext_11_16 is
    generic(
		P: integer:= 16);

    port (
          OP_A: in std_logic_vector(10 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_Sext_11_16;


architecture Sext11_16 of IYKEOSUJI_Sext_11_16 is

SIGNAL sZEROS : std_logic_vector(4 downto 0) := (OTHERS => '0');
SIGNAL sONES  : std_logic_vector(4 downto 0) := (OTHERS => '1');
SIGNAL sOP_Q  : std_logic_vector(15 downto 0) := (others => 'X');

begin


    sOP_Q <= sZEROS(4 downto 0) & OP_A(10 downto 0) when  OP_A(10) = '0' else
	     sONES(4 downto 0) & OP_A(10 downto 0);
	
    OP_Q <= sOP_Q;
end Sext11_16;


-----------------------------------------------------------
-----------------------------------------------------------
-- ZEXT [7:0]
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: Zero Extender with 8-bit input
-- Output 16 bits to MARMUX
--------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
entity IYKEOSUJI_Zext_8_16 is
    generic(
		P: integer:= 16);

    port (
          OP_A: in std_logic_vector(7 downto 0);
	  OP_Q: out std_logic_vector(P-1 downto 0)
         );
end IYKEOSUJI_Zext_8_16;


architecture Zext8_16 of IYKEOSUJI_Zext_8_16 is

SIGNAL sZEROS : std_logic_vector(7 downto 0) := (OTHERS => '0');
SIGNAL sOP_Q  : std_logic_vector(15 downto 0) := (others => 'X');

begin


    sOP_Q <= sZEROS(7 downto 0) & OP_A(7 downto 0);
	
    OP_Q <= sOP_Q;
end Zext8_16;


-----------------------------------------------------------
-----------------------------------------------------------
-- Final State Machine
-----------------------------------------------------------
-----------------------------------------------------------
-- Description: The LC3 Finite State Machine Control Circuit
-- Output all control signals to all components
--------------------------------------------------------------
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;


entity IYKEOSUJI_LC3_FSM is
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
end IYKEOSUJI_LC3_FSM;

architecture STRUCTURAL of IYKEOSUJI_LC3_FSM is

type LC3_STATE_TYPE is (S0, F, F_A, F_B, F_C, F_D, F_E, F_F, DEC, DEC_A, DEC_B, LOAD, LOADA, LOADB, LOADC,
			LOADD, ILOAD, ILOADA, ILOADB, ILOADC, ILOADD, ILOADE, ILOADF, ILOADG, 
			STORE, STORE_A, STORE_B, STORE_C, ISTR, ISTRA, ISTRB, ISTRC, ISTRD, ISTRE, ISTRF);

signal CPU_STATE: LC3_STATE_TYPE;
signal NEXT_STATE: LC3_STATE_TYPE;

constant ADD: std_logic_vector(3 downto 0) := "0001";
constant ANDL: std_logic_vector(3 downto 0) := "0101";
constant NOTL: std_logic_vector(3 downto 0) := "1001";
constant BR: std_logic_vector(3 downto 0) := "0000";
constant JMP: std_logic_vector(3 downto 0) := "1100";
constant JSR: std_logic_vector(3 downto 0) := "0100";
constant LD: std_logic_vector(3 downto 0) := "0010";
constant LDI: std_logic_vector(3 downto 0) := "1010";
constant LDR: std_logic_vector(3 downto 0) := "0110";
constant LEA: std_logic_vector(3 downto 0) := "1110";
constant ST: std_logic_vector(3 downto 0) := "0011";
constant STI: std_logic_vector(3 downto 0) := "1011";
constant STR: std_logic_vector(3 downto 0) := "0111";
constant TRAP: std_logic_vector(3 downto 0) := "1111";
constant RTI: std_logic_vector(3 downto 0) := "1000";

begin
    FSM: process(FROM_IR, FROM_NZP, CPU_STATE, NEXT_STATE)
        variable TRAPVECTOR: std_logic_vector(7 downto 0);
        variable DR_IN: std_logic_vector(2 downto 0);
        variable SR1_IN: std_logic_vector(2 downto 0);
        variable SR2_IN: std_logic_vector(2 downto 0);
        variable PC_OFFSET: std_logic_vector(10 downto 0);
        variable OPCODE: std_logic_vector(3 downto 0);
        variable BASEREG: std_logic_vector(2 downto 0);
        variable IR_5: std_logic;
        variable IMM5: std_logic_vector(4 downto 0);

    begin

        case CPU_STATE is
----------------------------------------------------------------
-- Initialize
----------------------------------------------------------------
	    when S0 =>
                MAR_EN <=  '0';
                MDR_EN <=  '0';
                MEM_EN <=  '0';
                READ_WRITE_ENABLE <=  '0';
                GATE_MDR <=  '0';
                GATE_PC <=  '0';
                GATE_MARMUX <=  '0';
                GATE_ALU <=  '0';
	        LD_IR <=  '0';
	        LD_PC <=  '0';
	        LD_CC <=  '0';
	        LD_REG <=  '0';
	        MM_SEL <=  '0';
	        ADDR1MUX_SEL <=  '0';
	        SR2MUX_SEL <=  '0';
	        PCMUX_SEL <=  (others => '0');
	        ADDR2MUX_SEL <=  (others => '0');
	        ALU_SEL <=  (others => '0');
	        DR_SEL <= (others => '0');
	        SR1_SEL <= (others => '0');
	        SR2_SEL <= (others => '0');
	        NEXT_STATE <= F;

----------------------------------------------------------------
-- Fetch (get instruction)
----------------------------------------------------------------
	    when F =>
		ADDR2MUX_SEL <= (others => '0');
		ADDR1MUX_SEL <= '0';
		PCMUX_SEL <= (others => '0');
		GATE_MARMUX <= '0';
		GATE_ALU <= '0';
		GATE_MDR <= '0';
		LD_PC <= '0';
		GATE_PC <= '0';
		MAR_EN <= '0';
		PCMUX_SEL <= (others => '0');
		MEM_EN <= '0';
		MDR_EN <= '0';
		NEXT_STATE <= F_A;

	    when F_A =>
		GATE_PC <= '1';
		MAR_EN <= '0';
		MEM_EN <= '0';
		NEXT_STATE <= F_B;

	    when F_B =>
		MAR_EN <= '1';
		GATE_PC <= '1';
		MEM_EN <= '0';
		NEXT_STATE <= F_C;

	    when F_C =>
		GATE_PC <= '0';
		MAR_EN <= '0';
		MEM_EN <= '1';
		NEXT_STATE <= F_D;

	    when F_D =>
		MEM_EN <= '0';
		MDR_EN <= '0';
		GATE_MDR <= '0';
		NEXT_STATE <= F_E;

	    when F_E =>

		GATE_MDR <= '1';
		LD_IR <= '1';
		NEXT_STATE <= F_F;

	    when F_F =>

		GATE_MDR <= '0';
		LD_IR <= '0';
		NEXT_STATE <= DEC;

----------------------------------------------------------------
-- DECODE INSTRUCTIONS
----------------------------------------------------------------
	    when DEC =>
		OPCODE := FROM_IR(15 downto 12);
		DR_IN := FROM_IR(11 downto 9);
		SR1_IN := FROM_IR(8 downto 6);
		SR2_IN := FROM_IR(2 downto 0);
		BASEREG := FROM_IR(8 downto 6);
		IR_5 := FROM_IR(5);
		IMM5 := FROM_IR(4 downto 0);
		PC_OFFSET := FROM_IR(10 downto 0);
		TRAPVECTOR := FROM_IR(7 downto 0);
----------------------------------------------------------------
------------BR--------------------------------------------------
----------------------------------------------------------------		
		if (OPCODE = BR) then
			if (((FROM_IR(11) AND FROM_NZP(2)) OR 
			     (FROM_IR(10) AND FROM_NZP(1)) OR 
			     (FROM_IR(9) AND FROM_NZP(0)))='1') then 
			    LD_IR <= '0';
			    GATE_MDR <= '0';

			    ADDR2MUX_SEL <= "10";
			    ADDR1MUX_SEL <= '0';
			    PCMUX_SEL <= "01";
			    LD_PC <= '1';		
			    NEXT_STATE <= F;

			else 
			    LD_IR <= '0';
			    GATE_MDR <= '0';

			    PCMUX_SEL <= (others => '0');
			    LD_PC <= '1';	
			    NEXT_STATE <= F;
			end if;
----------------------------------------------------------------
-- ADD INSTRUCTION
----------------------------------------------------------------
		elsif (OPCODE=ADD) then
			if (IR_5='0') then 
			    LD_IR <= '0';
			    GATE_MDR <= '0';
---------------------------- EVALUATE ADDRESS/FETCH OPERANDS----			
			    SR1_SEL <= SR1_IN;
			    SR2_SEL <= SR2_IN;
			    SR2MUX_SEL <= '0';
---------------------------- EXECUTE ---------------------------
			    ALU_SEL <= (others => '0');
---------------------------- STORE RESULTS ---------------------
			    GATE_ALU <= '1';
			    LD_REG <= '1';
			    LD_CC <= '1';
			    DR_SEL <= DR_IN;
			 
			    NEXT_STATE <= DEC_A;

			elsif (IR_5='1') then 
			    LD_IR <= '0';
			    GATE_MDR <= '0';
---------------------------- EVALUATE ADDRESS/FETCH OPERANDS----			    
			    SR1_SEL <= SR1_IN;
			    SR2MUX_SEL <= '1';
---------------------------- EXECUTE ---------------------------
			    ALU_SEL <= (others => '0');
---------------------------- STORE RESULTS ---------------------
			    GATE_ALU <= '1';
			    LD_REG <= '1';
			    LD_CC <= '1';
			    DR_SEL <= DR_IN;
			 
			    NEXT_STATE <= DEC_A;
			end if;

----------------------------------------------------------------
-- AND INSTRUCTION
----------------------------------------------------------------
		elsif (OPCODE=ANDL) then
			if (IR_5='0') then 
			    LD_IR <= '0';
			    GATE_MDR <= '0';
---------------------------- EVALUATE ADDRESS/FETCH OPERANDS----			
			    SR1_SEL <= SR1_IN;
			    SR2_SEL <= SR2_IN;
			    SR2MUX_SEL <= '0';
---------------------------- EXECUTE ---------------------------
			    ALU_SEL <= "01";
---------------------------- STORE RESULTS ---------------------
			    GATE_ALU <= '1';
			    LD_REG <= '1';
			    LD_CC <= '1';
			    DR_SEL <= DR_IN;
			 
			    NEXT_STATE <= DEC_A;

			elsif (IR_5='1') then 
			    LD_IR <= '0';
			    GATE_MDR <= '0';
---------------------------- EVALUATE ADDRESS/FETCH OPERANDS----			    
			    SR1_SEL <= SR1_IN;
			    SR2MUX_SEL <= '1';
---------------------------- EXECUTE ---------------------------
			    ALU_SEL <= "01";
---------------------------- STORE RESULTS ---------------------
			    GATE_ALU <= '1';
			    LD_REG <= '1';
			    LD_CC <= '1';
			    DR_SEL <= DR_IN;
			 
			    NEXT_STATE <= DEC_A;
			end if;
----------------------------------------------------------------
-- NOT INSTRUCTION
----------------------------------------------------------------
		elsif (OPCODE=NOTL) then
			LD_IR <= '0';
			GATE_MDR <= '0';
---------------------------- EVALUATE ADDRESS/FETCH OPERANDS----			
			SR1_SEL <= SR1_IN;
---------------------------- EXECUTE ---------------------------
			ALU_SEL <= "10";
---------------------------- STORE RESULTS ---------------------
			GATE_ALU <= '1';
			LD_REG <= '1';
			LD_CC <= '1';
			DR_SEL <= DR_IN;
			 
			NEXT_STATE <= DEC_A;

----------------------------------------------------------------
-- LOAD INSTRUCTION
----------------------------------------------------------------
		elsif (OPCODE=LD) then
			LD_IR <= '0';
	        	LD_CC <=  '0';
			GATE_MDR <= '0';
                	GATE_ALU <=  '0';
---------------------------- EVALUATE ADDRESS---------------------
	        	ADDR2MUX_SEL <=  "10";
	        	ADDR1MUX_SEL <=  '0';
                	GATE_MARMUX <=  '1';
	        	MM_SEL <=  '0';

                	MAR_EN <=  '1';
                	MDR_EN <=  '0';
                	MEM_EN <=  '0';
                	READ_WRITE_ENABLE <=  '0';

			NEXT_STATE <= LOAD;

----------------------------------------------------------------
-- LOAD INDIRECT INSTRUCTION
----------------------------------------------------------------
		elsif (OPCODE=LDI) then
			LD_IR <= '0';
	        	LD_CC <=  '0';
			GATE_MDR <= '0';
                	GATE_ALU <=  '0';
---------------------------- EVALUATE ADDRESS------------------
	        	ADDR2MUX_SEL <=  "10";
	        	ADDR1MUX_SEL <=  '0';
                	GATE_MARMUX <=  '1';
	        	MM_SEL <=  '0';

                	MAR_EN <=  '1';
                	MDR_EN <=  '0';
                	MEM_EN <=  '0';
                	READ_WRITE_ENABLE <=  '0';

			NEXT_STATE <= ILOAD;

----------------------------------------------------------------
-- STORE INSTRUCTION
----------------------------------------------------------------
		elsif (OPCODE=ST) then
			LD_IR <= '0';
	        	LD_CC <=  '0';
			GATE_MDR <= '0';
                	GATE_ALU <=  '0';
---------------------------- EVALUATE ADDRESS-------------------
	        	ADDR2MUX_SEL <=  "10";
	        	ADDR1MUX_SEL <=  '0';
                	GATE_MARMUX <=  '1';
	        	MM_SEL <=  '0';

                	MAR_EN <=  '1';
                	MDR_EN <=  '0';
                	MEM_EN <=  '0';
                	READ_WRITE_ENABLE <=  '0';

			NEXT_STATE <= STORE;

----------------------------------------------------------------
-- STORE INDIRECT INSTRUCTION
----------------------------------------------------------------
		elsif (OPCODE=STI) then
			LD_IR <= '0';
	        	LD_CC <=  '0';
			GATE_MDR <= '0';
                	GATE_ALU <=  '0';
---------------------------- EVALUATE ADDRESS-------------------
	        	ADDR2MUX_SEL <=  "10";
	        	ADDR1MUX_SEL <=  '0';
                	GATE_MARMUX <=  '1';
	        	MM_SEL <=  '0';

                	MAR_EN <=  '1';
                	MDR_EN <=  '0';
                	MEM_EN <=  '0';
                	READ_WRITE_ENABLE <=  '0';

			NEXT_STATE <= ISTR;

		else
			NEXT_STATE <= S0;
		end if;

	    when DEC_A =>

		LD_IR <= '0';
		GATE_MDR <= '0';
		SR1_SEL <= (others => '0');
		SR2_SEL <= (others => '0');
		SR2MUX_SEL <= '0';
		ALU_SEL <= (others => '0');
		GATE_ALU <= '0';
		LD_REG <= '0';
		LD_CC <= '0';
		DR_SEL <= (others => '0');
			 
		NEXT_STATE <= DEC_B;

	    when DEC_B =>

		LD_PC <= '1';

		NEXT_STATE <= F;

----------------------------------------------------------------
-- FETCH OPERANDS (LOAD)
----------------------------------------------------------------
	    when LOAD =>

	        ADDR2MUX_SEL <=  (others => '0');
	        ADDR1MUX_SEL <=  '0';
                GATE_MARMUX <=  '0';
	        MM_SEL <=  '0';

                MAR_EN <=  '0';
                MDR_EN <=  '0';
                MEM_EN <=  '1';
                READ_WRITE_ENABLE <=  '0';
		GATE_MDR <= '0';
		LD_REG <= '0';

		NEXT_STATE <= LOADA;

	    when LOADA =>

                MAR_EN <=  '0';
                MDR_EN <=  '0';
                MEM_EN <=  '0';
                READ_WRITE_ENABLE <=  '0';
		GATE_MDR <= '0';
		LD_REG <= '0';

		NEXT_STATE <= LOADB;

----------------------------------------------------------------
-- EXECUTE AND STORE RESULTS (LOAD)
----------------------------------------------------------------
	    when LOADB =>

                MAR_EN <=  '0';
                MDR_EN <=  '0';
                MEM_EN <=  '0';
                READ_WRITE_ENABLE <=  '0';
		GATE_MDR <= '1';
		LD_REG <= '1';
		LD_CC <= '1';
		DR_SEL <= DR_IN;


		NEXT_STATE <= LOADC;

	    when LOADC =>

                MAR_EN <=  '0';
                MDR_EN <=  '0';
                MEM_EN <=  '0';
                READ_WRITE_ENABLE <=  '0';
		GATE_MDR <= '0';
		LD_REG <= '0';
		LD_CC <= '0';
		DR_SEL <= (others => '0');

		NEXT_STATE <= LOADD;

	    when LOADD =>

		LD_PC <= '1';


		NEXT_STATE <= F;

----------------------------------------------------------------
-- FETCH OPERANDS (LOAD INDIRECT)
----------------------------------------------------------------
	    when ILOAD =>

	        ADDR2MUX_SEL <=  (others => '0');
	        ADDR1MUX_SEL <=  '0';
                GATE_MARMUX <=  '0';
	        MM_SEL <=  '0';

                MAR_EN <=  '0';
                MDR_EN <=  '0';
                MEM_EN <=  '1';
                READ_WRITE_ENABLE <=  '0';
		GATE_MDR <= '0';
		LD_REG <= '0';

		NEXT_STATE <= ILOADA;

	    when ILOADA =>

	        ADDR2MUX_SEL <=  (others => '0');
	        ADDR1MUX_SEL <=  '0';
                GATE_MARMUX <=  '0';
	        MM_SEL <=  '0';

                MAR_EN <=  '0';
                MDR_EN <=  '0';
                MEM_EN <=  '0';
                READ_WRITE_ENABLE <=  '0';
		GATE_MDR <= '0';
		LD_REG <= '0';

		NEXT_STATE <= ILOADB;

	    when ILOADB =>

	        ADDR2MUX_SEL <=  (others => '0');
	        ADDR1MUX_SEL <=  '0';
                GATE_MARMUX <=  '0';
	        MM_SEL <=  '0';

                MAR_EN <=  '1';
                MDR_EN <=  '0';
                MEM_EN <=  '0';
                READ_WRITE_ENABLE <=  '0';
		GATE_MDR <= '1';
		LD_REG <= '0';

		NEXT_STATE <= ILOADC;

	    when ILOADC =>

	        ADDR2MUX_SEL <=  (others => '0');
	        ADDR1MUX_SEL <=  '0';
                GATE_MARMUX <=  '0';
	        MM_SEL <=  '0';

                MAR_EN <=  '0';
                MDR_EN <=  '0';
                MEM_EN <=  '1';
                READ_WRITE_ENABLE <=  '0';
		GATE_MDR <= '0';
		LD_REG <= '0';

		NEXT_STATE <= ILOADD;

	    when ILOADD =>

	        ADDR2MUX_SEL <=  (others => '0');
	        ADDR1MUX_SEL <=  '0';
                GATE_MARMUX <=  '0';
	        MM_SEL <=  '0';

                MAR_EN <=  '0';
                MDR_EN <=  '0';
                MEM_EN <=  '0';
                READ_WRITE_ENABLE <=  '0';
		GATE_MDR <= '0';
		LD_REG <= '0';

		NEXT_STATE <= ILOADE;

----------------------------------------------------------------
-- EXECUTE AND STORE RESULTS (LOAD INDIRECT)
----------------------------------------------------------------
	    when ILOADE =>

	        ADDR2MUX_SEL <=  (others => '0');
	        ADDR1MUX_SEL <=  '0';
                GATE_MARMUX <=  '0';
	        MM_SEL <=  '0';

                MAR_EN <=  '0';
                MDR_EN <=  '0';
                MEM_EN <=  '0';
                READ_WRITE_ENABLE <=  '0';
		GATE_MDR <= '1';
		LD_CC <= '1';

		LD_REG <= '1';
		DR_SEL <= DR_IN;

		NEXT_STATE <= ILOADF;

	    when ILOADF =>

		GATE_MDR <= '0';
		LD_REG <= '0';
		LD_CC <= '0';
		DR_SEL <= (others => '0');

		NEXT_STATE <= ILOADG;

	    when ILOADG =>
		LD_PC <= '1';

		NEXT_STATE <= F;

----------------------------------------------------------------
-- FETCH OPERANDS (STORE)
----------------------------------------------------------------
	    when STORE =>

	        ADDR2MUX_SEL <=  (others => '0');
	        ADDR1MUX_SEL <=  '0';
                GATE_MARMUX <=  '0';
	        MM_SEL <=  '0';

                MAR_EN <=  '0';
                MDR_EN <=  '1';
                MEM_EN <=  '0';
		GATE_ALU <= '1';
		SR1_SEL <= DR_IN;
		ALU_SEL <= "11";
                READ_WRITE_ENABLE <=  '0';
		GATE_MDR <= '0';

		NEXT_STATE <= STORE_A;

----------------------------------------------------------------
-- EXECUTE AND STORE RESULTS (STORE)
----------------------------------------------------------------

	    when STORE_A =>

                MAR_EN <=  '0';
                MDR_EN <=  '0';
                MEM_EN <=  '1';
		GATE_ALU <= '0';
		SR1_SEL <= (others => '0');
		ALU_SEL <= (others => '0');
                READ_WRITE_ENABLE <=  '1';
		GATE_MDR <= '0';

		NEXT_STATE <= STORE_B;


	    when STORE_B =>

                MEM_EN <=  '0';
                READ_WRITE_ENABLE <=  '0';


		NEXT_STATE <= STORE_C;

	    when STORE_C =>

                LD_PC <= '1';

		NEXT_STATE <= F;

----------------------------------------------------------------
-- FETCH OPERANDS (STORE INDIRECT)
----------------------------------------------------------------
	    when ISTR =>

	        ADDR2MUX_SEL <=  (others => '0');
	        ADDR1MUX_SEL <=  '0';
                GATE_MARMUX <=  '0';
	        MM_SEL <=  '0';

                MAR_EN <=  '0';
                MDR_EN <=  '0';
                MEM_EN <=  '1';
		GATE_ALU <= '0';

		NEXT_STATE <= ISTRA;

	    when ISTRA =>

                MAR_EN <=  '0';
                MDR_EN <=  '0';
                MEM_EN <=  '0';
		GATE_MDR <= '0';

		NEXT_STATE <= ISTRB;

	    when ISTRB =>

                MAR_EN <=  '1';
                MDR_EN <=  '0';
                MEM_EN <=  '0';
		GATE_MDR <= '1';

		NEXT_STATE <= ISTRC;

	    when ISTRC =>


                MAR_EN <=  '0';
                MDR_EN <=  '1';
                MEM_EN <=  '0';
		GATE_ALU <= '1';
		SR1_SEL <= DR_IN;
		ALU_SEL <= "11";
                READ_WRITE_ENABLE <=  '0';
		GATE_MDR <= '0';

		NEXT_STATE <= ISTRD;

----------------------------------------------------------------
-- EXECUTE AND STORE RESULTS (STORE INDIRECT)
----------------------------------------------------------------

	    when ISTRD =>

                MDR_EN <=  '0';
                MEM_EN <=  '1';
		GATE_ALU <= '0';
		SR1_SEL <= (others => '0');
		ALU_SEL <= (others => '0');
                READ_WRITE_ENABLE <=  '1';
		GATE_MDR <= '0';

		NEXT_STATE <= ISTRE;


	    when ISTRE =>

                MEM_EN <=  '0';
                READ_WRITE_ENABLE <=  '0';


		NEXT_STATE <= ISTRF;

	    when ISTRF =>

                LD_PC <= '1';

		NEXT_STATE <= F;

----------------------------------------------------------------
-- BACK TO INITIALIZE when others
----------------------------------------------------------------
	    when others =>
		NEXT_STATE <= S0;
        end case;    


    end process;

    nextstatelogic: process(CLK)
    begin
	if (CLK'event and CLK = '1') then
	    if (RSTn='1') then 
		CPU_STATE <= S0;
	    else
		CPU_STATE <= NEXT_STATE;
	    end if;
	end if;
    end process;

	
end STRUCTURAL;
