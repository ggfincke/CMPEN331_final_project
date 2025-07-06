`timescale 1ns / 1ps

module testbench();
    reg clk_tb = 0;
    wire [31:00] pc_tb;
    wire [31:00] do_tb;
    wire [31:00] r_tb;
    wire [31:00] dm_tb;
    
    wire [31:00] a;
    wire [31:00] b;
    wire [31:00] d;
    wire [4:00] wn;
    wire [31:00] qa;
    wire [31:00] qb;
    wire [31:00] imme32;
    main main_tb(clk_tb, 
    pc_tb,
    do_tb, qa, qb, a, b, 
    r_tb,
    imme32,
    dm_tb,
    d,
    wn
    );

     always begin
        #10;
        clk_tb = ~clk_tb;
    end
endmodule
