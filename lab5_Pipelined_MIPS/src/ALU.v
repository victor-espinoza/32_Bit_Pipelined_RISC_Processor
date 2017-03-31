`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:        Victor Espinoza
// Email:         victor.alfonso94@gmail.com
// Project #:     Project 2 - Arithmetic Logic Unit (ALU)
// Course:        CECS 440
// Create Date:   11:05:58 2/19/2015
//
// Module Name:   ALU
// File Name:     ALU.v
//
// Description:   This module creates an ALU that performs various manipulations
//                on two inputs. The size of the A input was always 32-bits. The
//                value being passed into this input was either signed or 
//                unsigned. The size of the B input was either 32-bits wide or
//                16-bits wide (for immediate data). The values within this 
//                input were also either signed or unsigned depending on which
//                instruction was being called. Signed and unsigned are different
//                interpretations of the way values are perceived. In signed 
//                values, any value greater than 7FFF_FFFF (32-bit value for the
//                lab), is perceived to be negative. With unsigned values, however,
//                there is no such thing as a negative number. The value just keeps
//                on getting bigger and bigger. The initial values for both the A and
//                B inputs for our ALU module are both unsigned. In order to perform 
//                the signed instructions in the ALU using these initially unsigned
//                values, I had to convert the values from unsigned to signed. I
//                did this by creating local integer variables, which are by 
//                default signed entities. I then moved the A and B inputs into
//                these integer values and that converted the values into signed
//                numbers. For the immediate data, I needed to extend the 16-bit
//                value into a 32-bit value in order to be able to perform 
//                operations between my A and B inputs. If the instruction being
//                executed was a signed instruction, then I sign-extended the
//                most significant bit of the immediate data into the upper 16-bits
//                of my integer value and then I added the immediate data, B[15:0] 
//                to the lower 16 bits of my integer value. If the instruction being
//                executed was an unsigned instruction, then I simply set the upper
//                16-bits of a reg variable (unsigned entity) to zeros and set the
//                lower 16-bits to the immediate data, B[15:0]. After initializing
//                all of these variables, then I entered a case statement. 
//                This case statement decided which instruction to perform based
//                on the sel input that goes into my ALU. The sel input, being 5-bits
//                wide, is capable of selecting between 32 different instructions.
//                For the purpose of this lab, however, I only needed to implement
//                18 instructions. The instructions within the ALU consisted of nop, 
//                add, addu, sub, subu, and, or, xor, nor, slt, sltu, addi, addiu,
//                slti, sltu, andi, ori, and xori. These instructions either came in
//                the form of unsigned, signed, bitwise, unsigned immediate, signed
//                immediate, or bitwise immediate operations. Once I finished 
//                executing the desired instruction, my last step was to update the 
//                Zero Flag (ZF) by performing a reduction OR with the Y output and 
//                negating the result. This told me whether the output contained a 
//                value of zero or not. That is the gist of how my ALU module works.
//
// Dependencies:
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(sel, A, B, ZF, Y);
   //Define Inputs
   input [31:0] A, B;
   input [4:0]  sel;
   
   //Define Outputs
   output [31:0] Y;
   reg [31:0]    Y;
   output        ZF;
   wire          ZF;
   
   //Local Variables
   reg [31:0] B_Immed_Unsigned;
   
   integer Aint, Bint, Yint;

   always @(*) begin
                        Aint = A; //Signed A value
                        Bint = B; //Signed B Value
            B_Immed_Unsigned = {{16'b0}, B[15:0]}; //Unsigned Immediate value
      
      case(sel)
         5'b00000: ;//no op
         
         5'b00001: begin //ADD Signed
                        Yint =    Aint + Bint; // this will produce a signed result
                           Y =    Yint; // the 32 bit signed results is in Y
                   end
                   
         5'b00010:         Y = A + B; //ADD Unsigned
         
         5'b00011: begin //Subtract Signed
                        Yint = Aint - Bint; // this will produce a signed result
                           Y = Yint; // the 32 bit signed results is in Y
                   end
                  
         5'b00100:         Y = A - B; //Subtract Unsigned
         
         5'b00101:         Y = A & B; //Bitwise AND
         
         5'b00110:         Y = A | B; //Bitwise OR
         
         5'b00111:         Y = A ^ B; //Bitwise XOR
         
         5'b01000:         Y = ~(A | B); //Bitwise NOR
         
         5'b01001: begin      //Set to 1 if less than Signed
                     if (Aint < Bint)
                        Yint = 32'b01;
                     else
                        Yint = 32'b00;
                     Y = Yint;
                   end
                   
         5'b01010: begin      //Set to 1 if less than Unsigned
                     if(A < B)
                           Y = 32'b01;
                     else
                           Y = 32'b00;
                   end
                   
         5'b01011: begin      //Add Immediate 
                        Yint = Aint + Bint;
                           Y = Yint; // the 32 bit signed results is in Y         
                   end
      
         5'b01100:         Y = A + B_Immed_Unsigned; //Add Unsigned Immediate 
                     
         5'b01101: begin      //Set to 1 if less than Immediate
                     if (Aint < Bint)
                        Yint = 32'b01;
                     else
                        Yint = 32'b00;
                     Y = Yint;
                   end
         
         5'b01110: begin      //Set to 1 if less than Unsigned Immediate
                     if(A < B_Immed_Unsigned)
                           Y = 32'b01;
                     else
                           Y = 32'b00;
                   end
                   
         5'b01111:         Y = A & B_Immed_Unsigned;     //Bitwise AND Immediate
         
         5'b10000:         Y = A | B_Immed_Unsigned;     //Bitwise OR Immediate
                  
         5'b10001:         Y = A ^ B_Immed_Unsigned;     //Bitwise XOR Immediate
         
         5'b10010:         Y = {B[15:0],16'b0};         //Load Upper Immediate
                     
         default:          Y = 32'bx; 
      
      endcase
   
   end//end always block
   
   assign ZF = ~(|Y);   //Assign the appropriate value to the zero flag.

endmodule
