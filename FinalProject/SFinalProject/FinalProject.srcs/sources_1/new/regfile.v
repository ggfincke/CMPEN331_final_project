`timescale 1ns / 1ps

module regfile (rs, rt, wreg, d, wn, clk, qa, qb, ra); // 32x32 regfile
    input[4:0] rs;
    input[4:0] rt;
    input wreg;
    input [31:00]d;
    input[4:00] wn;
    input clk;
    output [31:0] qa;
    output [31:0] qb;
    output reg [31:0] ra;
    
    //make a 32x32 register array
    reg[31:0] register[0:31];
    
    //initialize all registers to 0
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            register[i] = 0;
        end
        //register[0] = 32'h00000000;
        //register[1] = 32'ha00000aa;
        //register[2] = 32'h10000011;
        //register[3] = 32'h20000022;
        //register[4] = 32'h30000033;
        //register[5] = 32'h40000044;
        //register[6] = 32'h50000055;
        //register[7] = 32'h60000066;
        //register[8] = 32'h70000077;
        //register[9] = 32'h80000088;
        //register[10] = 32'h90000099;
    end
    
    assign qa = (rs == 0)? 0 : register[rs]; 
    assign qb = (rt == 0)? 0 : register[rt]; 

    always @(*) begin
       // qa = register[rs];
        //qb = register[rt];
        ra = register[31];
    end
    
    always @(posedge clk) begin            
        if(wn!=0 && wreg == 1) begin
           register[wn] <= d;
        end    
    end
endmodule
