`timescale 1ns / 1ps

module controlUnit
(
    input z,
    input [5:0] op,
    input [5:0] func,
    output reg m2reg, //if m2 is a 1, data read from mem is selected; used later
    output reg [1:00] pcsrc,
    output reg wmem,
    output reg [3:0] aluc,
    output reg shift,
    output reg aluimm,
    output reg sext,
    output reg jal,
    output reg regrt,
    output reg wreg
    );
    
    
    always @(*) begin
        case(op)
        //for R-Type instructions + jr
            6'b000000: begin
                case(func)
                    //add
                    6'b100000 : begin
                        wreg = 1;
                        shift = 0;
                        aluc = 4'b0000;
                        pcsrc = 2'b0;
                        regrt = 0;
                        jal = 0;
                        m2reg = 0;
                        aluimm = 0;
                        wmem = 0;
                    end
                    //sub
                    6'b100010 : begin
                        wreg = 1;
                        shift = 0;
                        aluc = 4'b0100;
                        pcsrc = 2'b0;
                        regrt = 0;
                        jal = 0;
                        m2reg = 0;
                        aluimm = 0;
                        wmem = 0;
                    end 
                    //and
                    6'b100100 : begin
                        wreg = 1;
                        shift = 0;
                        aluc = 4'b0001;
                        pcsrc = 2'b0;
                        regrt = 0;
                        jal = 0;
                        m2reg = 0;
                        aluimm = 0;
                        wmem = 0;
                    end
                    //or   
                    6'b100101 : begin
                        wreg = 1;
                        shift = 0;
                        aluc = 4'b0101;
                        pcsrc = 2'b0;
                        regrt = 0;
                        jal = 0;
                        m2reg = 0;
                        aluimm = 0;
                        wmem = 0;
                    end  
                    //xor   
                    6'b100110 : begin
                        wreg = 1;
                        shift = 0;
                        aluc = 4'b0010;
                        pcsrc = 2'b0;
                        regrt = 0;
                        jal = 0;
                        m2reg = 0;
                        aluimm = 0;
                        wmem = 0;
                    end
                    //sll  
                    6'b000000 : begin
                        wreg = 1;
                        shift = 1;
                        aluc = 4'b0011;
                        pcsrc = 2'b00;
                        regrt = 0;
                        jal = 0;
                        m2reg = 0;
                        aluimm = 0;
                        wmem = 0;
                    end
                    //srl  
                    6'b000010 : begin
                        wreg = 1;
                        shift = 1;
                        aluc = 4'b0111;
                        pcsrc = 2'b00;
                        regrt = 0;
                        jal = 0;
                        m2reg = 0;
                        aluimm = 0;
                        wmem = 0;
                    end  
                    //sra  
                    6'b000011 : begin
                        wreg = 1;
                        shift = 1;
                        aluc = 4'b1111;
                        pcsrc = 2'b0;
                        regrt = 0;
                        jal = 0;
                        m2reg = 0;
                        aluimm = 0;
                        wmem = 0;
                    end
                    //jr
                    6'b001000 : begin
                        wreg = 0;
                        wmem = 0;
                        pcsrc = 2'b10;
                    end 
                endcase
            end
    //for I-Type instructions
            //addi
            6'b001000 : begin
                wreg = 1;
                regrt = 1;
                jal = 0;
                m2reg = 0;
                shift = 0;
                aluimm = 1;
                sext = 1;
                aluc = 4'b0000;
                wmem = 0;
                pcsrc = 2'b0;
            end
            //andi
            6'b001100 : begin
                wreg = 1;
                regrt = 1;
                jal = 0;
                m2reg = 0;
                shift = 0;
                aluimm = 1;
                sext = 1;
                aluc = 4'b0001;
                wmem = 0;
                pcsrc = 2'b0;
            end
            //ori   
            6'b001101 : begin
                wreg = 1;
                regrt = 1;
                jal = 0;
                m2reg = 0;
                shift = 0;
                aluimm = 1;
                sext = 0;
                aluc = 4'b0101;
                wmem = 0;
                pcsrc = 2'b0;
            end   
            //xori   
            6'b001110 : begin
                wreg = 1;
                regrt = 1;
                jal = 0;
                m2reg = 0;
                shift = 0;
                aluimm = 1;
                sext = 1;
                aluc = 4'b0010;
                wmem = 0;
                pcsrc = 0;
            end   
            //lui   
            6'b001111 : begin
                wreg = 1;
                regrt = 1;
                jal = 0;
                m2reg = 0;
                shift = 0;
                aluimm = 1;
                sext = 0;
                aluc = 4'b0110;
                wmem = 0;
                pcsrc = 0;
            end
            //lw   
            6'b100011 : begin
                wreg = 1;
                regrt = 1;
                jal = 0;
                m2reg = 1;
                shift = 0;
                aluimm = 1;
                sext = 1;
                aluc = 4'b0000;
                wmem = 0;
                pcsrc = 0;
            end
            //sw   
            6'b101011 : begin
                wreg = 0;
                regrt = 1;
                jal = 0;
                m2reg = 1;
                shift = 0;
                aluimm = 1;
                sext = 1;
                aluc = 4'b0000;
                wmem = 1;
                pcsrc = 2'b0;
            end 
            //beq  
            6'b000100 : begin              
                if (z == 1) begin
                    wreg = 0;
                    shift = 0;
                    aluimm = 0;
                    sext = 1;
                    aluc = 4'b0010;
                    wmem = 1;
                    pcsrc = 2'b01;
                end
                else begin
                    wreg = 0;
                    shift = 0;
                    aluimm = 0;
                    sext = 1;
                    aluc = 4'b0010;
                    wmem = 1;
                    pcsrc = 2'b00;
                end
            end 
            //bne 
            6'b000101 : begin
                if (z == 1) begin
                    wreg = 0;
                    shift = 0;
                    aluimm = 0;
                    sext = 1;
                    aluc = 4'b0010;
                    wmem = 1;
                    pcsrc = 2'b00;
                end
                else begin
                    wreg = 0;
                    shift = 0;
                    aluimm = 0;
                    sext = 1;
                    aluc = 4'b0010;
                    wmem = 1;
                    pcsrc = 2'b01;
                end
                

            end
        //for J-Type instructions
            //j   
            6'b000010 : begin
                wreg = 0;
                pcsrc = 2'b11;
                wmem = 0;
            end      
            //jal
            6'b000011 : begin
                wreg = 1;
                wmem = 0;
                jal = 1;
                pcsrc = 2'b11;
            end                           
        endcase
    end  
endmodule

