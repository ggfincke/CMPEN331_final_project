`timescale 1ns / 1ps

module immeMux(
    input [15:00] imm,
    input sext,
    output reg [31:00] out
    );
    
    //this mux makes the immediate to be 32 bits instead of 16
    always @(*) begin
        if (sext == 1) begin 
            if (imm[15] == 1) begin
                out <= {16'hffff, imm};
            end
            else begin
                out <= {16'h0000, imm};
            end
        end
        else begin
            out <= {16'h0000, imm};
        end
    end
endmodule    

