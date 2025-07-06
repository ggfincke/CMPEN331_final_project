`timescale 1ns / 1ps

module jalMUX
(
    input jal,
    input [31:00] d,
    input [4:00] wn,
    input [31:00] pc_added,
    output reg [31:00] d_out,
    output reg [4:00] wn_out
    );
    
    always @(*) begin
        if (jal == 1) begin
            wn_out = 31;
            d_out = pc_added;
        end
        else begin
            wn_out = wn;
            d_out = d;
        end   
    end
endmodule
