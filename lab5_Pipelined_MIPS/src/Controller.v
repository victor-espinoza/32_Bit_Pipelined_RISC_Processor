// SingleCycle Controller
// CECS 440 California State University Long Beach
// John Tramel
// 3/7/2015

// Controller for Single Cycle MIPs Processor

`timescale 1ns/1ns

module Controller (InstHi, InstLo, RegDst, BranchE, BranchNE, MemRead, MemtoReg,
	           MemWrite, ALUSrc, RegWrite, ALUCtl);

input  [ 5:0] InstHi;    // Instruction[31:26]
input  [ 5:0] InstLo;    // Instruction[ 5:0]
output        RegDst;    // Register Write Adress Select
output        BranchE;   // Branch Control for  =Zero
output        BranchNE;  // Branch Control for !=Zero
output        MemRead;   // Read Enable for Data Memory
output        MemtoReg;  // Write Data Select for Register File
output        MemWrite;  // Write Enable for Data Memory
output        ALUSrc;    // ALU B Mux Select
output        RegWrite;  // Write Enable for Register File
output [ 4:0] ALUCtl;    // Control to ALU

//////////// Declare Data Types ///////////////

reg    [ 4:0] ALUCtl;    // Control to ALU
reg    [ 7:0] Ctl;       // Control Bits

///////////////// Complete Set of Implemeted Instructions ///////////

assign {RegDst,BranchE,BranchNE,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite} = Ctl;

always @(*)
   begin
   {ALUCtl,Ctl} = {5'h00,8'h00};
   casez({InstHi,InstLo})
      ({6'h00,6'h00}): {ALUCtl,Ctl} = {5'h00,8'h00};   // NOP
      ({6'h00,6'h20}): {ALUCtl,Ctl} = {5'h01,8'h81};   // ADD
      ({6'h00,6'h21}): {ALUCtl,Ctl} = {5'h02,8'h81};   // ADDU
      ({6'h00,6'h22}): {ALUCtl,Ctl} = {5'h03,8'h81};   // SUB
      ({6'h00,6'h23}): {ALUCtl,Ctl} = {5'h04,8'h81};   // SUBU
      ({6'h00,6'h24}): {ALUCtl,Ctl} = {5'h05,8'h81};   // AND
      ({6'h00,6'h25}): {ALUCtl,Ctl} = {5'h06,8'h81};   // OR
      ({6'h00,6'h26}): {ALUCtl,Ctl} = {5'h07,8'h81};   // XOR
      ({6'h00,6'h27}): {ALUCtl,Ctl} = {5'h08,8'h81};   // NOR
      ({6'h00,6'h2A}): {ALUCtl,Ctl} = {5'h09,8'h81};   // SLT
      ({6'h00,6'h2B}): {ALUCtl,Ctl} = {5'h0A,8'h81};   // SLTU
      ({6'h08,6'h??}): {ALUCtl,Ctl} = {5'h0B,8'h03};   // ADDI
      ({6'h09,6'h??}): {ALUCtl,Ctl} = {5'h0C,8'h03};   // ADDIU
      ({6'h0A,6'h??}): {ALUCtl,Ctl} = {5'h0D,8'h03};   // SLTI
      ({6'h0B,6'h??}): {ALUCtl,Ctl} = {5'h0E,8'h82};   // SLTIU
      ({6'h0C,6'h??}): {ALUCtl,Ctl} = {5'h0F,8'h03};   // ANDI
      ({6'h0D,6'h??}): {ALUCtl,Ctl} = {5'h10,8'h03};   // ORI
      ({6'h0E,6'h??}): {ALUCtl,Ctl} = {5'h11,8'h03};   // XORI
      ({6'h0F,6'h??}): {ALUCtl,Ctl} = {5'h12,8'h03};   // LUI
      ({6'h04,6'h??}): {ALUCtl,Ctl} = {5'h03,8'h40};   // BEQ
      ({6'h05,6'h??}): {ALUCtl,Ctl} = {5'h03,8'h20};   // BNE
      ({6'h23,6'h??}): {ALUCtl,Ctl} = {5'h01,8'h1B};   // LW
      ({6'h2B,6'h??}): {ALUCtl,Ctl} = {5'h01,8'h86};   // SW
              default: {ALUCtl,Ctl} = {5'h00,8'h00};   // NOP
      endcase
      end
      
endmodule

