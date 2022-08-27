// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

//Pseudo code
//a=RO
//b=R1
//i=1
//sum=0
//LOOP:
//     if i > a goto STOP
//     sum=sum+b
//     i=i+1
//     goto LOOP

//STOP:
//R2=sum
       

// Put your code here.
@R0
D=M
@a   
M=D // a = RAM[0]

@R1
D=M
@b
M=D  // b = RAM[1]

@R2
M=0

@i
M=1  //i = 1

@sum
M=0

(LOOP) 
    @i   
    D=M
    @a 
    D=D-M   //D=i-a
    @STOP
    D;JGT // if i - a >0 goto STOP

    @sum
    D=M   
    @b
    D=D+M  //D=sum+b
    @sum
    M=D    //sum=sum+b
    @i
    M=M+1
    @LOOP// use LOOP to sum up the product
    0;JMP

(STOP)
    @sum
    D=M
    @R2
    M=D  // RAM[2]=sum

(END)
    @END
    0;JMP

