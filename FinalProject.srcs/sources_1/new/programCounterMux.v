`timescale 1ns / 1ps

module programCounterMux
(
    input [31:00] pc,
    input [31:00] branch_pc,
    input [31:00] jr_pc,
    input [31:00] j_pc,
    input [1:00] pcsrc,
    output reg [31:00] pc_next
    );
    
    always @(*) begin
        if (pcsrc == 2'b00) begin
            pc_next = pc;
        end
        if (pcsrc == 2'b01) begin
            pc_next = branch_pc; 
        end
        if (pcsrc == 2'b10) begin
            pc_next = jr_pc; 
        end
        if (pcsrc == 2'b11) begin
            pc_next = j_pc; 
        end
    end
endmodule

