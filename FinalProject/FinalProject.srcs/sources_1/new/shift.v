`timescale 1ns / 1ps

module shift(
    input shift,
    input [31:00] rnb_qa,
    input [4:00] sa,
    output reg [31:00] shift_out 
    );
    always @(*) begin
        if (shift == 1) begin
           shift_out = sa;
        end
        else begin
            shift_out = rnb_qa;
        end
    end          
endmodule

