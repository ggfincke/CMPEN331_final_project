`timescale 1ns / 1ps

module testbench();
    reg clk_tb = 0;
    wire [31:00] pc_tb;
    wire [31:00] do_tb;
    wire [31:00] r_tb;
    wire [31:00] dm_tb;
    
    main main_tb(clk_tb, 
    pc_tb,
    do_tb,
    r_tb,
    dm_tb
    );

     always begin
        #10;
        clk_tb = ~clk_tb;
    end
endmodule
