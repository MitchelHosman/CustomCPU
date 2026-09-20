`timescale 1ns/1ps

module instruction_memory (
    input wire [15:0] address,
    output wire [15:0] instruction
);

    reg [15:0] memory [0:255];

    initial begin
        memory[0] = 16'h810A;
        memory[1] = 16'h8214;
        memory[2] = 16'h0312;
        memory[3] = 16'hFFFF;
    end

    assign instruction = memory[address >> 1];
endmodule