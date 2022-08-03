------------------------------------------------------------
--File Name:		IYKEOSUJI_TB_LC3.vhd
--VHDL Source File:	A very simple test bench
--Components: 		LC3 DATAPATH
--Comments: 		behavioral testbench description
-- Name:   Iyke-Osuji Victor
-- ID: @02988642
-- For Final Project 	
-- Date:   04/2022
--
-- Advanced Digital Design Lab (412/406)
-----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity IYKEOSUJI_DATAPATH_ALL_TB is
end IYKEOSUJI_DATAPATH_ALL_TB;


architecture TB1 of IYKEOSUJI_DATAPATH_ALL_TB is


component IYKEOSUJI_PATH_ALL is
port (
	CLK: in std_logic;  
	RSTn: in std_logic
     );
end component IYKEOSUJI_PATH_ALL;

signal	CLKtb		: std_logic; 				
signal	RSTntb	: std_logic;				

begin

CLK_GEN: process 
    begin 
    while now <= 300 ns loop 
	CLKtb <='1'; wait for 5 ps; CLKtb <='0'; wait for 5 ps; 
    end loop; 
    wait; 
end process; 

Reset: process
    begin
	RSTntb  <='1','0' after 2 ps;
    wait;
end process;


--------------------------------------do not change-----------------------------------------------
datap: IYKEOSUJI_PATH_ALL port map ( CLK=>CLKtb, RSTn=>RSTntb);

end TB1;
--------------------------------------change the names to match your TB/Component-----
configuration CFG_IYKEOSUJI_DATAPATH_ALL_TB of IYKEOSUJI_DATAPATH_ALL_TB is
	for TB1
		FOR datap: IYKEOSUJI_PATH_ALL
			use entity work.IYKEOSUJI_PATH_ALL(STRUCTURAL);
		END FOR;
	end for;
end CFG_IYKEOSUJI_DATAPATH_ALL_TB;