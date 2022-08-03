onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider <NULL>
add wave -noupdate -divider {DATA PATH}
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/BUS_DATA
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INPUTS
add wave -noupdate /iykeosuji_datapath_all_tb/CLKtb
add wave -noupdate /iykeosuji_datapath_all_tb/RSTntb
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INSTANTIATIONS
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/RSTn
add wave -noupdate -divider {CONTROL SIGNALS (ENABLES/SELECTORS)}
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_MAR_EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_MDR_EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_MEM_EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_READ_WRITE_ENABLE
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_LD_IR
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_LD_PC
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_LD_CC
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_LD_REG
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_GATE_MDR
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_GATE_PC
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_GATE_MARMUX
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_GATE_ALU
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_MM_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_ADDR1MUX_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_SR2MUX_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_ALU_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_PCMUX_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_ADDR2MUX_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_DR_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_SR1_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_SR2_SEL
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST6_PC
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_LD_PC
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst6_PC/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst6_PC/RSTn
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst6_PC/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst6_PC/A1_PC
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst6_PC/CNTRL_BUS
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst6_PC/CNTRL_INC
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST7_GATE_PC
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_GATE_PC
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst7_Gate_PC/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst7_Gate_PC/gate_PC_IN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst7_Gate_PC/gate_PC_OUT
add wave -noupdate -divider <NULL>
add wave -noupdate -divider MEMORY
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST1_MAR
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_MAR_EN
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst1_MAR/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst1_MAR/RSTn
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst1_MAR/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst1_MAR/BUS_IN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst1_MAR/MAR_OUT
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST2_RAM
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_MEM_EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_READ_WRITE_ENABLE
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst2_RAM/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst2_RAM/MEM_EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst2_RAM/read_write_en
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst2_RAM/mem_wr_rd_add
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst2_RAM/DATA_IN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst2_RAM/DATA_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst2_RAM/DATA
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST3_MDR
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_MDR_EN
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst3_MDR/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst3_MDR/RSTn
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst3_MDR/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst3_MDR/BUS_IN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst3_MDR/MEM_IN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst3_MDR/MDR_BUS
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST4_GATE_MDR
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_GATE_MDR
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst4_Gate_MDR/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst4_Gate_MDR/gate_mdr_IN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst4_Gate_MDR/gate_mdr_OUT
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST8_NZP
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_LD_CC
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst8_NZP/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst8_NZP/RSTn
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst8_NZP/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst8_NZP/NZP_BUS_IN
add wave -noupdate -radix binary /iykeosuji_datapath_all_tb/datap/Inst8_NZP/OP_NZP
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST5_IR
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_LD_IR
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst5_IR/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst5_IR/RSTn
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst5_IR/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst5_IR/IR_BUS_IN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst5_IR/IR_OUT
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST12_5SEXT16
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst12_5Sext16/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst12_5Sext16/OP_Q
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST13_6SEXT16
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst13_6Sext16/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst13_6Sext16/OP_Q
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST14_9SEXT16
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst14_9Sext16/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst14_9Sext16/OP_Q
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST15_11SEXT16
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst15_11Sext16/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst15_11Sext16/OP_Q
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST16_8ZEXT16
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst16_8Zext16/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst16_8Zext16/OP_Q
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST17_ADDR2MUX
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_ADDR2MUX_SEL
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst17_ADDR2MUX/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst17_ADDR2MUX/OP_B
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst17_ADDR2MUX/OP_C
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst17_ADDR2MUX/Sel
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst17_ADDR2MUX/OP_Q
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST18_ADDR1MUX
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_ADDR1MUX_SEL
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst18_ADDR1MUX/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst18_ADDR1MUX/OP_B
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst18_ADDR1MUX/Sel
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst18_ADDR1MUX/OP_Q
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST21_ADDER
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst21_Adder/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst21_Adder/OP_B
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst21_Adder/OP_Q
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST22_MARMUX
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_MM_SEL
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst22_MARMUX/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst22_MARMUX/OP_B
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst22_MARMUX/Sel
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst22_MARMUX/OP_Q
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST10_GATE_MM
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_GATE_MARMUX
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst10_Gate_MARMUX/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst10_Gate_MARMUX/gate_MARMUX_IN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst10_Gate_MARMUX/gate_MARMUX_OUT
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST23_PCMUX
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_PCMUX_SEL
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst23_PCMUX/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst23_PCMUX/OP_B
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst23_PCMUX/OP_C
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst23_PCMUX/Sel
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst23_PCMUX/OP_Q
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider PROCESSOR
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST9_REGFILE
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_LD_REG
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_DR_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_SR1_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_SR2_SEL
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/RSTn
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/LD_REG
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/ARR_BUS_IN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/DR
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/SR1
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/SR2
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/SR1_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/SR2_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/sEN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/sFF
add wave -noupdate -divider Register(0)
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(0)/regh0/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(0)/regh0/RST
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(0)/regh0/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(0)/regh0/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(0)/regh0/OP_Q
add wave -noupdate -divider Register(1)
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(1)/regh0/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(1)/regh0/RST
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(1)/regh0/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(1)/regh0/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(1)/regh0/OP_Q
add wave -noupdate -divider Register(2)
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(2)/regh0/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(2)/regh0/RST
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(2)/regh0/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(2)/regh0/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(2)/regh0/OP_Q
add wave -noupdate -divider Register(3)
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(3)/regh0/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(3)/regh0/RST
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(3)/regh0/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(3)/regh0/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(3)/regh0/OP_Q
add wave -noupdate -divider Register(4)
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(4)/regh0/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(4)/regh0/RST
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(4)/regh0/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(4)/regh0/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(4)/regh0/OP_Q
add wave -noupdate -divider Register(5)
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(5)/regh0/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(5)/regh0/RST
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(5)/regh0/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(5)/regh0/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(5)/regh0/OP_Q
add wave -noupdate -divider Register(6)
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(6)/regh0/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(6)/regh0/RST
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(6)/regh0/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(6)/regh0/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(6)/regh0/OP_Q
add wave -noupdate -divider Register(7)
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(7)/regh0/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(7)/regh0/RST
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(7)/regh0/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(7)/regh0/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst9_REGFILE/g0(7)/regh0/OP_Q
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST19_SR2MUX
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_SR2MUX_SEL
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst19_SR2MUX/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst19_SR2MUX/OP_B
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst19_SR2MUX/Sel
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst19_SR2MUX/OP_Q
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST20_ALU
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_ALU_SEL
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst20_ALU/OP_A
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst20_ALU/OP_B
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst20_ALU/Sel
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst20_ALU/OP_Q
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST11_GATE_ALU
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_GATE_ALU
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst11_Gate_ALU/EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst11_Gate_ALU/gate_ALU_IN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/Inst11_Gate_ALU/gate_ALU_OUT
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -divider INST_DATAPATH
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/CLK
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/RSTn
add wave -noupdate -divider <NULL>
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/FROM_IR
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/FROM_NZP
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/MAR_EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/MDR_EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/MEM_EN
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/READ_WRITE_ENABLE
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/LD_IR
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/LD_PC
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/LD_CC
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/LD_REG
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/GATE_MDR
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/GATE_PC
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/GATE_MARMUX
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/GATE_ALU
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/MM_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/ADDR1MUX_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/SR2MUX_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/ALU_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/PCMUX_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/ADDR2MUX_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/DR_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/SR1_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/SR2_SEL
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/CPU_STATE
add wave -noupdate /iykeosuji_datapath_all_tb/datap/inst_DATAPATH/NEXT_STATE
add wave -noupdate -divider {INTERMEDIATE SIGNALS}
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_MAR_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_MDR_BUS
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_MEM_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_PC_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_PC_INC
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_SR1_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_SR2_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_SEXT5_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_SEXT6_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_SEXT9_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_SEXT11_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_ZEXT8_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_SR2MUX_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_ALU_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_ADDR2MUX_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_ADDR1MUX_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_ADDER_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_PCMUX_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_MARMUX_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_IR_OUT
add wave -noupdate /iykeosuji_datapath_all_tb/datap/S_NZP_OUT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 318
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {177 ps}
