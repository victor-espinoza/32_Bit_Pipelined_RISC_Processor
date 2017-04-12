# Lab_5-_Pipelined_MIPS
Project Overview:   
32-Bit Pipelined MIPS processor in Verilog along with sorting code written in Assembly.   
  
This pipelined processor combines our previous labs of the register file and the ALU and implements them into a pipelined MIPS processor. The pipeline for this processor consists of three different phases: fetch, decode, and execute. Each instruction progresses through the different phases until it finishes in the execute phase.    
   
Each phase only has one instruction being processed at a time. Using a pipelined approach enables multiple instructions (3 at a time) to simultaneously pass through the different phases, which allows the processor to finish executing the instructions faster than in the Single Cycle processor. This is due to the fact that with a Single Cycle processor we fully execute 1 instruction at a time before moving on to the next instruction, which is not the case for a pipelined processor.    
   
Because we are progressing through different stages within the processor each clock cycle, I needed to add various reg and wire variables to keep track of all of the data being passed through the 3 phases of the pipeline. Each phase is updated with the appropriate instruction at the start of the clock cycle. Then, depending on the phase, the appropriate actions are taken.    
    
The fetch phase of the pipeline fetches the instruction from memory. The decode phase determines what instruction was received and what the instruction is asking the processor to do. Finally, the execute phase performs the function that the instruction was intended to do.    
    
In this program, the Program Counter receives the appropriate memory address and then it fetches the instruction corresponding to that particular address. Each address in the Program Counter is byte addressable (word-aligned), meaning that it goes up in increments of 4 (0x00, 0x04, 0x08, 0x0C, 0x10, etc...). In order to align and interface the Program Counter address with the physical addresses of the Instruction and Data Memory, I needed to shift the address right by 2. This allows us to get the physical address of the word-addressable memories.    
    
Depending on the type of instruction being executed, the processor then takes the different paths associated with each type of instruction. There are three different types of instructions being implemented by my processor: register type instructions, Load/Store type instructions, and Branch type instructions. Each instruction takes a slightly different path through the processor.  
  
The verilog source code files contain an in-depth discussion of each module and its purpose within the project.

Project Machine Code:   
00: addi $r1, $r0, 0x0001    
04: addi $r10, $r0, 0x01FF    
08: addi $r11, $r0, 0x01FF    
0C: addi $r2, $r0, 0x0000    
10: addi $r3, $r0, 0x0000    
14: addi $r4, $r0, 0x0800    
18: lw $r5, $r4, 0x0000    
1C: lw $r6, $r4, 0x0004    
20: slt $r7, $r5, $r6    
24: bne $r7, $r1, 0x0008    
28: sw $r5, $r4, 0x0004    
2C: sw $r6, $r4, 0x0000    
30: addi $r4, $r4, 0x004    
34: addi $r3, $r3, 0x0001    
38: bne $r3, $r11, 0xFFDC    
3C: addi $r2, $r2, 0x0001    
40: sub $r11, $r11, $r1    
44: bne $r2, $r10, 0xFFC8    
48: addi $r8, $r0, 0x0800    
4C: addi $r9, $r0, 0x0FFC    
50: addi $r10, $r0, 0x0020    
54: addi $r15, $r0, 0x0000    
58: addi $r11, $r0, 0x0000    
5C: addi $r12, $r0, 0x0000    
60: lw $r13, $r8(0x0000)    
64: lw $r14, $r9(0x0000)    
68: add $r11, $r11, $r13    
6C: add $r12, $r12, $r14    
70: addi $r8, $r8, 0x0004    
74: addi $r9, $r9, 0xFFFC    
78: addi $r15, $r15, 0x0001    
7C: bne $r10, $r15, 0xFFE0    
80: addi $r16, $r0, 0x0000    
84: addi $r17, $r0, 0x0800    
88: addi $r18, $r0, 0x0200    
8C: lui $r19, 0xFFFF    
90: ori $r19, $r19, 0xFFFF    
94: addi $r20, $r0, 0x0000    
98: addi $r21, $r0, 0x0000    
9C: lw $r22, $r17(0x0000)    
A0: and $r19, $r19, $r22    
A4: or $r20, $r20, $r22    
A8: addu $r21, $r21, $r22    
AC: addi $r17, $r17, 0x0004    
B0: addi $r16, $r16, 0x0001    
B4: bne $r16, $r18, 0xFFE4    
B8: addi $r30, $r0, 0x0400    
BC: sw $r11, $r30(0x0000)    
C0: sw $r12, $r30(0x0004)    
C4: sw $r19, $r30(0x0008)    
C8: sw $r20, $r30(0x000C)    
CC: sw $r21, $r30(0x0010)    
D0: beq $r0, $r0, 0xFFFC    
    
Here is the block-diagram for this project:    
![ScreenShot](https://cloud.githubusercontent.com/assets/14812721/24943664/7abcc59e-1f0c-11e7-9bb3-aeb34c0d7bf7.jpg)

    
Dependencies:   
This project was created using the Xilinx ISE Project Navigator Version: 14.7.  

Project Verification:   
This project was verified in the exact same format as the Single_Cycle MIPS processor (LAB_4).  
  
In order to verify the correctness of my project, I used a combination of looking at the waveforms, writing data to a file, and looking at the physical addresses of the data memory to make sure that everything was sorted correctly.  
  
Looking at the waveforms was effective, but there were so many iterations and it turned out to be really inefficient looking at each instruction being executed every clock cycle. In order to remedy this, I was able to write helpful messages to a file every time a RegWrite or a MemWrite occurred (thanks to the help of the video that the professor posted!) so that I knew the address of the Program Counter and the register and contents that were being written to it.  
  
I also displayed the output of the final result to the console/wrote those values into the file when the program was done executing. I also made use of the memory column of the ISim program so that I could physically see the contents within the data memory. This made it alot easier for me to verify the correctness of my program and make sure that my sorting algorithm was working properly.  
  
Using all of these methods together, I was able to verify that my machine code was in fact correct.  

