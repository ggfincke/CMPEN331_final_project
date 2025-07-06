`timescale 1ns / 1ps

module ALU
(
    input [3:00]aluc,
    input [31:00]a,
    input [31:00]b,
    
    output reg[31:00]r,
    output reg z
);
    always @(*)begin
        case(aluc)
            //add
            4'b0000:
                begin
                    r = a + b;
                    z=0;
                end
            //sub
            4'b0100:
                begin
                    r = a - b;
                    z=0;
                end
            
            //and
            4'b0001:
                begin
                    r = b & a;
                    z=0;
                end
            //or
            4'b0101:
                begin
                    r = b | a;
                    z=0;
                end
            
            //xor
            4'b0010:
                begin
                    r = a ^ b;           
                    //beq/bne
                    if (a == b) begin
                        z = 1;
                    end
                    else begin
                        z = 0;
                    end
                end
            
            //sll
            4'b0011:
                begin
                    r = b << a;
                    z=0;
                end
            
            //srl
            4'b0111:
                begin
                    r = b >> a;
                    z=0;
                end
            
            //sra
            4'b1111:
                begin
                    //r = b >>> a;
                    r <= $signed(b)>>>a;
                    z=0;
                end        
            //lui
            4'b0110:
                begin
                    r <= {b[31:00], 16'b0};
                    z=0;
                end
        endcase
    end
endmodule

