`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2023 02:29:21 PM
// Design Name: 
// Module Name: rdrtMux
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


module rdrtMux(
    input regrt,
    input [4:00] rd,
    input [4:00] rt,
    output reg [4:00] dest
    );
    
    always @(*) begin
        if (regrt == 1) begin
           dest = rt;
        end
        if (regrt == 0) begin
            dest = rd;
        end
    end
endmodule
