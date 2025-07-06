`timescale 1ns / 1ps

module immeShift
(
    input [31:00] e,
    output reg [31:00] out
    );
    
//shift to left; sign extended immediate
    always @(*) begin
        out = e << 2;
    end
endmodule