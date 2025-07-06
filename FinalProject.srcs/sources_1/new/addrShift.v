`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2023 10:12:39 PM
// Design Name: 
// Module Name: addrShift
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


module addrShift
( 
    input [25:00] addr,
    output reg [27:00] shift_addr
    );
    
    always @(*)begin
        shift_addr = addr << 2;
    end
endmodule
