`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2023 03:38:33 PM
// Design Name: 
// Module Name: dataMemMux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dataMemMux(
    input m2reg,
    input [31:00] do, //out from DataMem
    input [31:00] r, //from ALU
    output reg [31:00] out
    );

        always @(*) begin
        if (m2reg == 1) begin
            out <= do;
        end
        if (m2reg == 0) begin
            out <= r;
        end    
    end   
endmodule



