// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


//Pseudo code
//i=0,n=8192
//LOOP:
//if KBD > 0 goto LOOPB
//        i=i+1
//        adrr[16384+n]=-1
//        if i-n=0 goto LOOP
// if KBD = 0 goto LOOPW
//     adrr[16384+n]=0
//     i=i+1
//     if i-n=0 goto LOOP




(LOOP)
   //addr = 16384 (screen's base address)
    @SCREEN 
    D=A 
    @addr
    M=D

    //n = 8192
    @8192
    D=A
    @n
    M=D

    //i = 0
    @i
    M=0

    @KBD 
    D=M  //KBD's address is 24576

    // if KBD > 0 goto LOOP2
    @KBD
    D=M
    @LOOPB
    D;JGT  


        //LOOPW for KBD = 0
        (LOOPW)
        @i
        D=M
        @n
        D=D-M
        @LOOP
        D;JEQ

        //RAM[16384]=0000000000000000
        @addr
        A=M
        M=0

        //addr=addr+1
        @i 
        M=M+1
        @1
        D=A 
        @addr
        M=D+M
        @LOOPW
        0;JMP



        //LOOPB for KBD > 0
        (LOOPB)
        @i
        D=M   //D=i
        @n
        D=D-M  //n=i-n
        @LOOP
        D;JEQ

        //RAM[16384]=1111111111111111
        @addr
        A=M
        M=-1

        //addr=addr+1
        @i 
        M=M+1
        @1
        D=A
        @addr
        M=D+M
        @LOOPB
        0;JMP

    @LOOP
    0;JMP
