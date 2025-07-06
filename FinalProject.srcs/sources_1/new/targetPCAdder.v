`timescale 1ns / 1ps

module targetPCAdder
(
    input [31:00] nextPC,
    input [31:00] shiftSext,
    output reg [31:00] targetPC
    );
    
    always @(*) begin
        targetPC = nextPC + shiftSext;
    end
endmodule
