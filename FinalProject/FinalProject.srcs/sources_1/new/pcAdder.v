`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2023 11:59:37 AM
// Design Name: 
// Module Name: pcAdder
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


module pcAdder
(
    input [31:0]pc,
    
    output reg[31:0]added
);  
    always @(*) begin
        added = pc + 4;
    end
endmodule
