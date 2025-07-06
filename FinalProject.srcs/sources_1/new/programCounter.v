`timescale 1ns / 1ps
module programCounter
(
    input clk,
    input [31:00] pc_next,
    output reg [31:00] pc_use
    );
    
    initial begin
        pc_use = 0;
    end
    
    always @(posedge clk) begin
        pc_use = pc_next;
    end     
endmodule
