`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:07:19 03/07/2015
// Design Name:   SingleCycle
// Module Name:   C:/Users/John Tramel/Desktop/SingleCycle/SingleCycle/
// PipelinedMIPS_tb.v
// Project Name:  PipelinedMIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PipelinedMIPS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipelined_MIPS_tb;

   // Inputs
   reg clk;
   reg rstb;
   
   //Local variables
   //integer i;

   // Instantiate the Unit Under Test (UUT)
   PipelinedMIPS uut (
      .clk(clk), 
      .rstb(rstb)
   );
   
   //initial begin
   //   for(i=0; i<1024; i=i+1)
   //      uut.DataMem[i] <= 32'b0;
   //end 
   
   always #10 clk = ~clk;
   
   initial begin
      $readmemh("InstrMem",uut.InstrMem); 
      $readmemh("DataMem", uut.DataMem);
   end
   integer file;
   initial begin
      //open the file that you are going to be writing messages to
      file = $fopen("outputFileMessages");
      
      // Initialize Inputs
      clk = 0;
      rstb = 0;

      // Wait 100 ns for global reset to finish
      #100;
      @(posedge clk)rstb = 1;

   end
   
   always@(negedge clk) begin
      $fwrite(file,"PC = %h  ", uut.PC);
      if(uut.MEMWB_RegWrite)
         $fdisplay(file,"Reg = %h Value = %h",uut.MEMWB_Register_Rd, 
          uut.MEMWB_wr_data_muxed);
      else
      $fdisplay(file, " ");

      if(uut.EXMEM_MemWrite)begin
         $fdisplay(file, "Wr_addr being changed = %h Wr_data being changed= %h", 
          (uut.EXMEM_ALU_out>>2), uut.DataMem[uut.EXMEM_ALU_out>>2]);
      end
      
      if(uut.PC == 32'h000000D0) begin
         $display(" 32 Largest Values sum: %h", uut.DataMem[10'h100]);
         $fdisplay(file, " 32 Largest Values sum: %h", uut.DataMem[10'h100]);
         $display("32 Smallest Values sum: %h", uut.DataMem[10'h101]);
         $fdisplay(file, "32 Smallest Values sum: %h", uut.DataMem[10'h101]);
         $display("    AND Every Location: %h", uut.DataMem[10'h102]);
         $fdisplay(file, "    AND Every Location:%h", uut.DataMem[10'h102]);
         $display("     OR Every Location: %h", uut.DataMem[10'h103]);
         $fdisplay(file, "     OR Every Location: %h", uut.DataMem[10'h103]);
         $display("              Checksum: %h", uut.DataMem[10'h104]);
         $fdisplay(file, "              Checksum: %h", uut.DataMem[10'h104]);
         $stop;
      end
   
   end
      
endmodule
