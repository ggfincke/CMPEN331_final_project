`timescale 1ns / 1ps

module main(clk, pc, do,r,dataMemOut);
    input clk;
    //pc
    output wire [31:00] pc;  
    output wire [31:00] do; 
    //regfile  
    wire [31:00] qa;
    wire [31:00] qb; 
    wire [31:00] ra;
    
    wire[31:00] d;
    //adder
    wire [31:00] pc_added;
    wire [31:00] pc_next;
    //CU
    wire shift;
    wire wreg;
    wire m2reg;
    wire wmem;
    wire regrt;
    wire sext;
    wire [1:0] pcsrc;
    wire [3:0] aluc;
    wire aluimm;
    wire jal;
    //ALU
    wire [31:00] a;
    wire [31:00] b;
    output wire [31:00] r;
    wire z;
    //rdrtMux
    wire [4:00] wn;   
    //immeMux
    wire [31:00] imme32; 
    //immeShift
    wire [31:00] shifted;
    //branch adder
    wire [31:00] branch_pc;
    //addrShift
    wire [27:00] shiftedAddr;
    //pc MUX
    wire [31:00] j_pc = {pc[31:28], shiftedAddr};
    //dataMem
    output wire [31:00] dataMemOut;
    //jalMux
    wire [31:00] dOut;
    wire [4:00] wnOut;
    
    //PC
    programCounter PC (clk, pc_next, pc);
    //adder
    pcAdder ADDER (pc, pc_added);
    //im
    instructionMemory IM (pc, do);
    //CU
    controlUnit CU (z, do[31:26], do[5:0], m2reg, pcsrc, wmem, aluc, shift, aluimm, sext, jal, regrt, wreg);
    //rdrt MUX
    rdrtMux RDRTMUX (regrt, do[15:11], do[20:16], wn);
    //immediateMux
    immeMux EXTEND (do[15:0], sext, imme32);
    //jalMux
    jalMUX JAL (jal, d, wn, pc_added, dOut, wnOut);
    //reg
    regfile REG (do[25:21], do[20:16],wreg, dOut, wnOut, clk, qa, qb, ra);
    //shift (aMUX for ALU)
    shift AMUX (shift, qa, do[10:6], a);   
    //bMux for ALU
    bMux BMUX (qb, imme32, aluimm, b);
    //alu
    ALU alu(aluc, a, b, r, z);
    //addrShift
    addrShift ADDRSHIFT (do[25:00], shiftedAddr);
    //immeShift
    immeShift IMSHIFT(imme32, shifted);
    //dataMemory
    dataMemory DM(clk, wmem, r, qb, dataMemOut);
    //dataMemMux
    dataMemMux DMM(m2reg, dataMemOut, r, d);
    //target
    targetPCAdder TARGETPC(pc_added, shifted, branch_pc);
    //PCMUX
    programCounterMux PCMUX (pc_added, branch_pc, qa, j_pc, pcsrc, pc_next);   

endmodule

