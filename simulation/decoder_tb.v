`timescale 1ns/1ps

module decoder_tb;

    reg [15:0] instruction;

    wire [3:0] opcode;
    wire [3:0] rd;
    wire [3:0] rs1;
    wire [3:0] rs2;

    decoder uut (
        .instruction(instruction),
        .opcode(opcode),
        .rd(rd),
        .rs1(rs1),
        .rs2(rs2)
    );

    initial begin
        $dumpfile("decoder.vcd");
        $dumpvars(0, decoder_tb);
    end

    initial begin
        $monitor("Time=%0t INSTRUCTION=%h OPCODE=%b RD=%b RS1=%b RS2=%b",
                 $time, instruction, opcode, rd, rs1, rs2);
    end

    initial begin

        // ADD R3, R1, R2
        instruction = 16'h0312;

        #10;

        // SUB R5, R4, R2
        instruction = 16'h1542;

        #10;

        // AND R7, R6, R1
        instruction = 16'h2761;

        #10;

        // NOT R2, R8
        instruction = 16'h5280;

        #10;

        $finish;

    end

endmodule