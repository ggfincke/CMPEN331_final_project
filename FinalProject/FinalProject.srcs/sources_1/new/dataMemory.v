`timescale 1ns / 1ps

module dataMemory
(
    input clk,
    input we, //write enable from CU
    input [31:00] r, //r from ALU
    input [31:00] qb, //qb from regfile
    output [31:00] do //guess, check if all these pins are right
    );
    
    //initiating datamem array
    reg[31:0] dataMemory [0:127];
    assign do = dataMemory[r[6:2]];
    always@(posedge clk) begin
        if(we) dataMemory[r[6:2]] = qb;
    end
    integer i;
    initial begin
        for (i = 0; i < 127; i = i + 1) begin
            dataMemory[i] = 0;
        end
;
        // dataMemory[word_addr] = data // (byte_addr)
        dataMemory[5'h14] = 32'h000000a3; // (50hex)
        dataMemory[5'h15] = 32'h00000027; // (54hex)
        dataMemory[5'h16] = 32'h00000079; // (58hex)
        dataMemory[5'h17] = 32'h00000115; // (5chex)
        // dataMemory[5'h18] should be 0x00000258, the sum stored by sw instruction
    end

endmodule
