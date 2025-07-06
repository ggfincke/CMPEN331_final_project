`timescale 1ns / 1ps



module bMux
(
    input [31:00] qb,
    input [31:00] ex,
    input aluimm,
    output reg [31:00] out
    );
    
    always @(*) begin
        if (aluimm == 1) begin
            out = ex;
        end
        if (aluimm == 0) begin
            out = qb;
        end    
    end   
endmodule
