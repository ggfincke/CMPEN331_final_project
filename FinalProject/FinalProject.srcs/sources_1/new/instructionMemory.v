`timescale 1ns / 1ps

module instructionMemory
(
    input [31:00] pc,
    output reg [31:00] do
    );
    
   reg [31:00] memory [0:127];
   initial begin
        memory[8'h00] = 32'h3c010000; // (00) main: lui $1, 0
        memory[8'h04] = 32'h34240050; // (04) ori $4, $1, 80
        memory[8'h08] = 32'h20050004; // (08) addi $5, $0, 4
        memory[8'h0c] = 32'h0c000018; // (0c) call: jal sum
        memory[8'h10] = 32'hac820000; // (10) sw $2, 0($4)
        memory[8'h14] = 32'h8c890000; // (14) lw $9, 0($4)
        memory[8'h18] = 32'h01244022; // (18) sub $8, $9, $4
        memory[8'h1c] = 32'h20050003; // (1c) addi $5, $0, 3
        memory[8'h20] = 32'h20a5ffff; // (20) loop2: addi $5, $5, -1
        memory[8'h24] = 32'h34a8ffff; // (24) ori $8, $5, 0xffff
        memory[8'h28] = 32'h39085555; // (24) xori $8, $8, 0x5555
        memory[8'h2c] = 32'h2009ffff; // (2c) addi $9, $0, -1
        memory[8'h30] = 32'h312affff; // (30) andi $10,$9, 0xffff
        memory[8'h34] = 32'h01493025; // (34) or $6, $10, $9
        memory[8'h38] = 32'h01494026; // (38) xor $8, $10, $9
        memory[8'h3c] = 32'h01463824; // (3c) and $7, $10, $6
        memory[8'h40] = 32'h10a00001; // (40) beq $5, $0, shift
        memory[8'h44] = 32'h08000008; // (44) j loop2
        memory[8'h48] = 32'h2005ffff; // (48) shift: addi $5, $0, -1
        memory[8'h4c] = 32'h000543c0; // (4c) sll $8, $5, 15
        memory[8'h50] = 32'h00084400; // (50) sll $8, $8, 16
        memory[8'h54] = 32'h00084403; // (54) sra $8, $8, 16
        memory[8'h58] = 32'h000843c2; // (58) srl $8, $8, 15
        memory[8'h5c] = 32'h08000017; // (5c) finish: j finish
        memory[8'h60] = 32'h00004020; // (60) sum: add $8, $0, $0
        memory[8'h64] = 32'h8c890000; // (64) loop: lw $9, 0($4)
        memory[8'h68] = 32'h20840004; // (68) addi $4, $4, 4
        memory[8'h6c] = 32'h01094020; // (6c) add $8, $8, $9
        memory[8'h70] = 32'h20a5ffff; // (70) addi $5, $5, -1
        memory[8'h74] = 32'h14a0fffb; // (74) bne $5, $0, loop
        memory[8'h78] = 32'h00081000; // (78) sll $2, $8, 0
        memory[8'h7c] = 32'h03e00008; // (7c) jr $31
    end
    
    always @(*) begin
        do = memory[pc];
    end
endmodule
