`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:        Victor Espinoza
// Email:         victor.alfonso94@gmail.com
// Project #:     Project 5 - Pipelined MIPS Processor
// Course:        CECS 440
// Create Date:   11:02:28 03/10/2015
//
// Module Name:   PipelinedMIPS
// File Name:     PipelinedMIPS.v 
// Description:   This top level module combines our previous labs of the register
//                file and the ALU and implements them into a pipelined MIPS
//                processor. The pipeline for this processor consists of three 
//                different phases: fetch, decode, and execute. Each instruction
//                progresses through the different phases until it finishes in
//                the execute phase. Each phase only has one instruction being 
//                processed at a time. Using a pipelined approach enables multiple
//                instructions (3 at a time) to simultaneously pass through the 
//                different phases, which allows the processor to finish executing
//                the instructions faster than in the Single Cycle processor.
//                This is due to the fact that with a Single Cycle processor we
//                fully execute 1 instruction at a time before moving on to the 
//                next instruction, which is not the case for a pipelined 
//                processor. Because we are progressing through different 
//                stages within the processor each clock cycle, I needed to add
//                various reg and wire variables to keep track of all of the 
//                data being passed through the 3 phases of the pipeline. Each
//                phase is updated with the appropriate instruction at the 
//                start of the clock cycle. Then, depending on the phase, the 
//                appropriate actions are taken. The fetch phase of the pipeline
//                fetches the instruction from memory. The decode phase 
//                determines what instruction was received and what the 
//                instruction is asking the processor to do. Finally, the 
//                execute phase performs the function that the instruction
//                was intended to do. In this program, the Program Counter 
//                receives the appropriate memory address and then it fetches 
//                the instruction corresponding to that particular address. 
//                Each address in the Program Counter is byte addressable 
//                (word-aligned), meaning that it goes up in increments of 4 
//                (0x00, 0x04, 0x08, 0x0C, 0x10, etc...). In order to align and 
//                interface the Program Counter address with the physical 
//                addresses of the Instruction and Data Memory, I needed to 
//                shift the address right by 2. This allows us to get the 
//                physical address of the word-addressable memories. Depending
//                on the type of instruction being executed, the processor then
//                takes the different paths associated with each type of 
//                instruction. There are three different types of instructions
//                being implemented by my processor: register type instructions,
//                Load/Store type instructions, and Branch type instructions. 
//                Each instruction takes a slightly different path through the 
//                processor.
//
// Dependencies:
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PipelinedMIPS(clk, rstb);

//Establish Inputs
input clk, rstb;

//Instruction Fetch Stage Variables
wire         hold;
wire         flush;
wire [1:0]   Pre_IFID_Data_Control;
wire         PCWrite;
wire         LW_Stall;
wire         LW_Stall2;         
wire [31:0]  PC_plus_4; 
wire [31:0]  next_PC;
wire [63:0]  Instr_Flush_Data;
wire [63:0]  Pre_IFID_Data;
wire [63:0]  Pre_IFID_Data_Muxed;
reg  [31:0]  PC;
reg  [31:0]  Instr;


//Instruction Decode Stage Variables
wire         IFID_hold;
wire         IFID_flush;
wire         IFID_RegWrite;
wire         IFID_MemtoReg;
wire         IFID_BranchNE;
wire         IFID_BranchE;
wire         IFID_MemRead;
wire         IFID_MemWrite;
wire         IFID_RegDst;
wire         IFID_ALUSrc;
wire [4:0]   IFID_ALUCtl;
wire [4:0]   IFID_Register_Rs;
wire [4:0]   IFID_Register_Rt;
wire [4:0]   IFID_Register_Rd;
wire [12:0]  IFID_Control_Signals;
wire [12:0]  IFID_Control_Signals_Muxed;
wire [12:0]  IFID_Flush_Signals;
wire [31:0]  IFID_Instr;
wire [31:0]  IFID_PC_plus_4;
wire [31:0]  IFID_rd_data1;
wire [31:0]  IFID_rd_data2;
wire [31:0]  IFID_Immed_Value_Extended;
//IFID_Control_Signals_Muxed (13) + IFID_PC_plus_4 (32) + IFID_rd_data1 (32) +
//IFID_rd_data2 (32) + IFID_Immed_Value_Extended(32) + IFID_Register_Rs (5) +
//IFID_Register_Rt (5) + IFID_Register_Rd (5) = 156 bits
wire [155:0] Pre_IDEX_Data;
wire [155:0] Pre_IDEX_Data_Muxed;
wire [155:0] IFID_Flush_Data;
reg  [63:0]  IFID_Data; //[63:32] are PC_plus_4, [31:0] are Instr
 

//Instruction Execute Stage Variables
wire         IDEX_flush;
wire         IDEX_ZF;
wire         IDEX_RegWrite;
wire         IDEX_MemtoReg;
wire         IDEX_BranchNE;
wire         IDEX_BranchE;
wire         IDEX_MemRead;
wire         IDEX_MemWrite;
wire         IDEX_RegDst;
wire         IDEX_ALUSrc;
wire [1:0]   IDEX_ForwardA;
wire [1:0]   IDEX_ForwardB;
wire [4:0]   IDEX_ALUCtl;
wire [4:0]   IDEX_wr_addr_muxed;
wire [4:0]   IDEX_Register_Rs;
wire [4:0]   IDEX_Register_Rt;
wire [4:0]   IDEX_Register_Rd;
wire [12:0]  IDEX_Control_Signals_Muxed;
wire [12:0]  IDEX_Control_Signals;
wire [31:0]  IDEX_PC_plus_4;
wire [31:0]  IDEX_Immed_Value_Extended;
wire [31:0]  IDEX_add_PC_addr;
wire [31:0]  IDEX_rd_data1;
wire [31:0]  IDEX_rd_data2;
wire [31:0]  IDEX_data1;
wire [31:0]  IDEX_data2;
wire [31:0]  IDEX_data2_muxed;
wire [31:0]  IDEX_ALU_out;
//IDEX_Control_Signals_Muxed[12:7] (6) + IDEX_add_PC_addr (32) +  IDEX_ZF (1) +
//IDEX_ALU_out (32) + IDEX_data2 (32) + IDEX_Register_Rd (5) = 108 bits
wire [107:0] Pre_EXMEM_Data;
wire [107:0] IDEX_Flush_Data;
wire [107:0] Pre_EXMEM_Data_Muxed;
reg  [155:0] IDEX_Data; //[155:143] IFID_Control_Signals_Muxed,
//[142:111] IFID_PC_plus_4, [110:79] IFID_rd_data1, [78:47] IFID_rd_data2,
//[46:15]IFID_Immed_Value_Extended, [14:10]IFID_Register_Rs, 
//[9:5] IFID_Register_Rt, [4:0] IFID_Register_Rd


////Memory Stage Variables
wire         EXMEM_branch_mux_sel;
wire         EXMEM_ZF;
wire         EXMEM_RegWrite;
wire         EXMEM_MemtoReg;
wire         EXMEM_BranchNE;
wire         EXMEM_BranchE;
wire         EXMEM_MemRead;
wire         EXMEM_MemWrite;
wire [1:0]   EXMEM_Control_Signals;
wire [4:0]   EXMEM_Register_Rd;
wire [31:0]  EXMEM_ALU_out;
wire [31:0]  EXMEM_add_PC_addr;
wire [31:0]  EXMEM_data2;
//EXMEM_Control_Signals (2) +  EXMEM_data_mem_out (32) +  
// + EXMEM_ALU_out(32) + EXMEM_Register_Rd (5) = 71 bits
wire [70:0]  Pre_MEMWB_Data;
reg  [31:0]  EXMEM_data_mem_out;
reg  [107:0] EXMEM_Data;//[107:102] IDEX_Control_Signals_Muxed[12:7], 
//[101:70] IDEX_add_PC_addr, [69] IDEX_ZF, [68:37] IDEX_ALU_out, [36:5] IDEX_data2, 
//[4:0] IDEX_Register_Rd


//Write Back Stage Variables
wire         MEMWB_RegWrite;
wire         MEMWB_MemtoReg;
wire [4:0]   MEMWB_Register_Rd;
wire [31:0]  MEMWB_data_mem_out;
wire [31:0]  MEMWB_ALU_out;
wire [31:0]  MEMWB_wr_data_muxed;
reg  [70:0]  MEMWB_Data;//[70:69] EXMEM_Control_Signals, 
//[68:37] EXMEM_data_mem_out, [36:5] EXMEM_ALU_out, [4:0] EXMEM_Register_Rd


//Instruction and Data Memories
reg  [31:0]  InstrMem [0:1023];
reg  [31:0]  DataMem  [0:1023];


//////////////////////////////////////////////////////////////////////////////////
//Instruction Fetch Stage of Pipeline

//next PC select mux                  ?          1     :       0 
assign next_PC = (!(EXMEM_branch_mux_sel === 1'bx) && EXMEM_branch_mux_sel) ? 
 EXMEM_add_PC_addr : PC_plus_4;

//Start Program Counter Section of Processor
always @(posedge clk, negedge rstb)
   if (!rstb)begin
      PC <= 32'b0;
   end
   else begin
      if(PCWrite)
         PC <= next_PC;
   end
//Finished with Program Counter Section of Processor                        

//assign PC+4 wire
assign PC_plus_4 = PC + 4;

//Start Instruction Memory Section of Processor
always@(*)
   Instr = InstrMem[PC>>2];
//Finished Instruction Memory Section of Processor   


assign Pre_IFID_Data = {PC_plus_4, Instr};

assign Instr_Flush_Data = 64'b0;

//Hazard Detection Unit 

//assign PCWrite
assign PCWrite = (!(IDEX_MemRead === 1'bx) && (IDEX_MemRead && ((IDEX_Register_Rt 
 == IFID_Register_Rs) || (IDEX_Register_Rt == IFID_Register_Rt)))) ? 1'b0 : 1'b1;
//assign LW_Stall
assign LW_Stall = (!(IDEX_MemRead === 1'bx) && (IDEX_MemRead && ((IDEX_Register_Rt
 == IFID_Register_Rs) || (IDEX_Register_Rt == IFID_Register_Rt)))) ? 1'b1 : 1'b0;
//assign hold wire
assign hold = LW_Stall;
assign flush =  (!(EXMEM_branch_mux_sel === 1'bx) && EXMEM_branch_mux_sel) ? 
 1'b1 : 1'b0;//flush control signal
assign Pre_IFID_Data_Control = {flush, hold};
// 00 - Data, 01 - Hold, 10 - Flush, 11 - Flush 
assign Pre_IFID_Data_Muxed = (Pre_IFID_Data_Control == 2'b00) ? Pre_IFID_Data : 
 ((Pre_IFID_Data_Control == 2'b01) ? IFID_Data : ((Pre_IFID_Data_Control == 2'b10)) 
 ? Instr_Flush_Data : Instr_Flush_Data);

//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
//IF/ID Pipeline Register
always@(posedge clk) begin
// 00 - Data, 01 - Hold, 10 - Flush, 11 - Flush
   IFID_Data = Pre_IFID_Data_Muxed;
end
//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
//Instruction Decode Stage of Pipeline

//Start Controller Section of Processor
//Controller Module Instantiation
//module Controller (InstHi, InstLo, RegDst, BranchE, BranchNE, MemRead, MemtoReg,
// MemWrite, ALUSrc, RegWrite, ALUCtl);
Controller Control(
   .InstHi(IFID_Instr[31:26]), 
   .InstLo(IFID_Instr[5:0]), 
   .RegDst(IFID_RegDst), 
   .BranchE(IFID_BranchE), 
   .BranchNE(IFID_BranchNE), 
   .MemRead(IFID_MemRead), 
   .MemtoReg(IFID_MemtoReg),
   .MemWrite(IFID_MemWrite), 
   .ALUSrc(IFID_ALUSrc), 
   .RegWrite(IFID_RegWrite), 
   .ALUCtl(IFID_ALUCtl)
);
//Finished with Controller Section of Processor   
   

//WB Control Signals - RegWrite, MemtoReg
//M  Control Signals - BranchNE, BranchE, MemRead, MemWrite
//Ex Control Signals - RegDst, ALUSrc, ALUCtl
assign  IFID_Control_Signals = {IFID_RegWrite, IFID_MemtoReg, IFID_BranchNE, 
 IFID_BranchE, IFID_MemRead, IFID_MemWrite, IFID_RegDst, IFID_ALUSrc, IFID_ALUCtl};

//Control Signal Mux                                1   :          0
assign  IFID_Control_Signals_Muxed = (!(LW_Stall === 1'bx) && LW_Stall) ? 13'b0 : 
 IFID_Control_Signals;
assign  IFID_PC_plus_4 = IFID_Data[63:32];
assign  IFID_Instr = IFID_Data[31:0];
assign  IFID_Flush_Signals = {IFID_PC_plus_4, {6'b0, IFID_Instr[25:6], 6'b0}};


//Start Register File Section of Processor                
//Register File Module Instantiation
//module register_file(clk, rstb, wr_e, wr_addr, wr_data, rd_addr1, rd_addr2, 
// rd_data1,rd_data2);
register_file Registers(
   .clk(clk), 
   .rstb(rstb), 
   .wr_e(MEMWB_RegWrite), 
   .wr_addr(MEMWB_Register_Rd), 
   .wr_data(MEMWB_wr_data_muxed), 
   .rd_addr1(IFID_Instr[25:21]), 
   .rd_addr2(IFID_Instr[20:16]), 
   .rd_data1(IFID_rd_data1),
   .rd_data2(IFID_rd_data2)
);
//Finished with Register File Section of Processor   


//Sign Extend Immediate Value
assign  IFID_Immed_Value_Extended = {{16{IFID_Instr[15]}}, IFID_Instr[15:0]}; 

//Rs, Rt, and Rd registers of IFID Stage of Pipeline
assign  IFID_Register_Rs = IFID_Instr[25:21]; //Rs Register
assign  IFID_Register_Rt = IFID_Instr[20:16]; //Rt Register
assign  IFID_Register_Rd = IFID_Instr[15:11]; //Rd Register

assign  IFID_flush = (!(EXMEM_branch_mux_sel === 1'bx) && EXMEM_branch_mux_sel) ? 
 1'b1 : 1'b0;//flush control signal
assign  IFID_hold = (!(IDEX_MemRead === 1'bx) && (IDEX_MemRead && ((IDEX_Register_Rt 
 == IFID_Register_Rs) || (IDEX_Register_Rt == IFID_Register_Rt)))) ? 1'b1 : 1'b0;

                                                              
//control signals (12) + PC_Plus_4 (32) + rd_data1 (32) + rd_data2 (32)  
// + Immed_Value_Extended (32) + Rs (5) + Rt (5) + Rd (5) = 155
assign Pre_IDEX_Data = {IFID_Control_Signals_Muxed, IFID_PC_plus_4, IFID_rd_data1,
 IFID_rd_data2, IFID_Immed_Value_Extended, IFID_Register_Rs, IFID_Register_Rt,
 IFID_Register_Rd};

assign IFID_Flush_Data = 156'b0;//{12'b0, IFID_PC_plus_4, IFID_rd_data1, IFID_rd_data2,
// IFID_Immed_Value_Extended, IFID_Register_Rs, IFID_Register_Rt, IFID_Register_Rd };

// 00 - Data, 01 - Hold, 10 - Flush, 11 - Flush
//assign Pre_IDEX_Data_Muxed = (IFID_flush && !IFID_hold) ? Pre_IDEX_Data : 
// ((!IFID_flush && IFID_hold) ? IDEX_Data : ((IFID_flush && !IFID_hold) ?  
// IFID_Flush_Data : IFID_Flush_Data));
assign Pre_IDEX_Data_Muxed = (IFID_flush) ? IFID_Flush_Data : Pre_IDEX_Data;

//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
//ID/EX Pipeline Register
always@(posedge clk) begin
   IDEX_Data <= Pre_IDEX_Data_Muxed;
end
//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
//Instruction Execute Stage of Pipeline
//[155:143] IFID_Control_Signals_Muxed,
//[142:111] IFID_PC_plus_4, [110:79] IFID_rd_data1, [78:47] IFID_rd_data2,
//[46:15]IFID_Immed_Value_Extended, [14:10]IFID_Register_Rs, 
//[9:5] IFID_Register_Rt, [4:0] IFID_Register_Rd

//WB Control Signals - RegWrite, MemtoReg
//M  Control Signals - BranchNE, BranchE, MemRead, MemWrite
//Ex Control Signals - RegDst, ALUSrc, ALUCtl
assign IDEX_Control_Signals = IDEX_Data[155:143];
assign IDEX_flush = (!(EXMEM_branch_mux_sel === 1'bx) && EXMEM_branch_mux_sel) ? 
 1'b1 : 1'b0;//flush control signal

//Control Signal Mux                                           1   :          0
//assign IDEX_Control_Signals_Muxed = (IDEX_flush) ? 13'b0 : 
// IDEX_Control_Signals;

assign IDEX_RegWrite = IDEX_Control_Signals[12];
assign IDEX_MemtoReg = IDEX_Control_Signals[11];
assign IDEX_BranchNE = IDEX_Control_Signals[10];
assign IDEX_BranchE  = IDEX_Control_Signals[9];
assign IDEX_MemRead  = IDEX_Control_Signals[8];
assign IDEX_MemWrite = IDEX_Control_Signals[7];
assign IDEX_RegDst   = IDEX_Control_Signals[6];
assign IDEX_ALUSrc   = IDEX_Control_Signals[5];
assign IDEX_ALUCtl   = IDEX_Control_Signals[4:0];

assign IDEX_PC_plus_4 = IDEX_Data[142:111];
assign IDEX_Immed_Value_Extended = IDEX_Data[46:15];
//assign IDEX_add_PC_addr wire
assign IDEX_add_PC_addr = IDEX_PC_plus_4 + (IDEX_Immed_Value_Extended<<2);

assign IDEX_rd_data1    = IDEX_Data[110:79];
assign IDEX_rd_data2    = IDEX_Data[78:47];
assign IDEX_Register_Rs = IDEX_Data[14:10];
assign IDEX_Register_Rt = IDEX_Data[9:5];
assign IDEX_Register_Rd = IDEX_Data[4:0];

//Start ALU Section of Processor

//Data Forwarding rdData1
assign IDEX_data1 = (IDEX_ForwardA == 2'b00) ?  IDEX_rd_data1 : 
 ((IDEX_ForwardA == 2'b01) ? MEMWB_wr_data_muxed : ((IDEX_ForwardA == 2'b10) ? 
 EXMEM_ALU_out : 32'b0));
//Data Forwarding rdData2
assign IDEX_data2 = (IDEX_ForwardB == 2'b00) ?  IDEX_rd_data2 : 
 ((IDEX_ForwardB == 2'b01) ? MEMWB_wr_data_muxed : ((IDEX_ForwardB == 2'b10) ? 
 EXMEM_ALU_out : 32'b0));
//ALU data2 select mux                                     1           :     0
assign IDEX_data2_muxed = (IDEX_ALUSrc) ? IDEX_Immed_Value_Extended : IDEX_data2;

//ALU Module Instantiation
//module ALU(sel, A, B, ZF, Y);
ALU ALU_UNIT(
   .sel(IDEX_ALUCtl), 
   .A(IDEX_data1), 
   .B(IDEX_data2_muxed),
   .ZF(IDEX_ZF), 
   .Y(IDEX_ALU_out)
);
//Finished with ALU Section of Processor 

//write register address mux                   1        :          0
assign IDEX_wr_addr_muxed = (IDEX_RegDst) ? IDEX_Register_Rd : IDEX_Register_Rt;

//Data Forwarding Unit (DFU)
//EX Hazard and MEM Hazard for ALU A Input
assign IDEX_ForwardA = (!(EXMEM_RegWrite === 1'bx) && EXMEM_RegWrite && 
 (EXMEM_Register_Rd != 0) && (EXMEM_Register_Rd == IDEX_Register_Rs)) ? 2'b10 : 
 ((!(MEMWB_RegWrite === 1'bx) && MEMWB_RegWrite && (MEMWB_Register_Rd != 0) && 
 !(EXMEM_RegWrite && (EXMEM_Register_Rd != 0) && (EXMEM_Register_Rd == 
 IDEX_Register_Rs)) && (MEMWB_Register_Rd == IDEX_Register_Rs)) ? 2'b01 : 2'b00);
//EX Hazard and MEM Hazard for ALU B Input
assign IDEX_ForwardB = (!(EXMEM_RegWrite === 1'bx) && EXMEM_RegWrite && 
 (EXMEM_Register_Rd != 0) && (EXMEM_Register_Rd == IDEX_Register_Rt)) ? 2'b10 : 
 ((!(MEMWB_RegWrite === 1'bx) && MEMWB_RegWrite && (MEMWB_Register_Rd != 0) && 
 !(EXMEM_RegWrite && (EXMEM_Register_Rd != 0) && (EXMEM_Register_Rd == 
 IDEX_Register_Rt)) && (MEMWB_Register_Rd == IDEX_Register_Rt)) ? 2'b01 : 2'b00);
//end DFU code
   
//IDEX_Control_Signals_Muxed[12:7] (6) + IDEX_add_PC_addr (32) +  IDEX_ZF (1) +
//IDEX_ALU_out (32) + IDEX_data2 (32) + IDEX_wr_addr_muxed(5) = 108 bits
assign Pre_EXMEM_Data = {IDEX_Control_Signals[12:7], IDEX_add_PC_addr,
 IDEX_ZF, IDEX_ALU_out, IDEX_data2, IDEX_wr_addr_muxed};//IDEX_wr_addr_muxed
assign IDEX_Flush_Data = 108'b0;
assign Pre_EXMEM_Data_Muxed = (IDEX_flush) ? IDEX_Flush_Data : Pre_EXMEM_Data;


//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
//EX/MEM Pipeline Register
always@(posedge clk) begin
   EXMEM_Data <= Pre_EXMEM_Data_Muxed; 
end
//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
//Memory Access Stage of Pipeline
//EXMEM_Data//[107:102] IDEX_Control_Signals_Muxed[12:7], 
//[101:70] IDEX_add_PC_addr, [69] IDEX_ZF, [68:37] IDEX_ALU_out, [36:5] IDEX_data2, 
//[4:0] IDEX_Register_Rd

//WB Control Signals - RegWrite, MemtoReg
//M  Control Signals - BranchNE, BranchE, MemRead, MemWrite
assign EXMEM_RegWrite        = EXMEM_Data[107];
assign EXMEM_MemtoReg        = EXMEM_Data[106];
assign EXMEM_BranchNE        = EXMEM_Data[105];
assign EXMEM_BranchE         = EXMEM_Data[104];
assign EXMEM_Control_Signals = EXMEM_Data[107:106];
assign EXMEM_MemRead         = EXMEM_Data[103];
assign EXMEM_MemWrite        = EXMEM_Data[102];
assign EXMEM_add_PC_addr     = EXMEM_Data[101:70];
assign EXMEM_ZF              = EXMEM_Data[69]; 
assign EXMEM_ALU_out         = EXMEM_Data[68:37];
assign EXMEM_data2           = EXMEM_Data[36:5];
assign EXMEM_Register_Rd     = EXMEM_Data[4:0];

//assign the EXMEM_branch_mux_sel wire 
assign EXMEM_branch_mux_sel = ((EXMEM_BranchE  & EXMEM_ZF) | 
 (EXMEM_BranchNE & ~EXMEM_ZF)) ? 1'b1: 1'b0;


//Start Data Memory Section of Processor
//read data from data memory if MemRead is asserted
always @(*)
   EXMEM_data_mem_out = (EXMEM_MemRead) ? DataMem[EXMEM_ALU_out>>2]:32'b0;

//write to data memory if MemWrite is asserted
always @(posedge clk)
      if (EXMEM_MemWrite)
         DataMem[EXMEM_ALU_out>>2] <= EXMEM_data2;
//finish Data Memory Section of Processor

//EXMEM_Control_Signals (2) +  EXMEM_data_mem_out (32) +  
// + EXMEM_ALU_out(32) + EXMEM_Register_Rd (5) = 71 bits
assign Pre_MEMWB_Data = {EXMEM_Control_Signals, EXMEM_data_mem_out, EXMEM_ALU_out,
 EXMEM_Register_Rd};

//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
//MEM/WB Pipeline Register
always@(posedge clk) begin
   MEMWB_Data <= Pre_MEMWB_Data;
end
//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
//Memory Write-Back Stage of Pipeline

//MEMWB_Data//[70:69] EXMEM_Control_Signals, 
//[68:37] EXMEM_data_mem_out, [36:5] EXMEM_ALU_out, [4:0] EXMEM_Register_Rd
//WB Control Signals - RegWrite, MemtoReg
assign MEMWB_RegWrite     = MEMWB_Data[70];
assign MEMWB_MemtoReg     = MEMWB_Data[69];
assign MEMWB_data_mem_out = MEMWB_Data[68:37];
assign MEMWB_ALU_out      = MEMWB_Data[36:5];
assign MEMWB_Register_Rd  = MEMWB_Data[4:0];
//Data Memory write data select mux                      1                 0
assign MEMWB_wr_data_muxed = (MEMWB_MemtoReg) ? MEMWB_data_mem_out : MEMWB_ALU_out; 
//////////////////////////////////////////////////////////////////////////////////

endmodule

