`timescale 1ns/1ps

module instruction_memory_tb;

    reg [15:0] address;
    wire [15:0] instruction;

    instruction_memory uut (
        .address(address),
        .instruction(instruction)
    );

    initial begin
        $dumpfile("instruction_memory.vcd");
        $dumpvars(0, instruction_memory_tb);
    end

    initial begin
        $monitor("Time=%0t ADDRESS=%h INSTRUCTION=%h",
                 $time, address, instruction);
    end

    initial begin

        address = 16'h0000;

        #10;
        address = 16'h0002;

        #10;
        address = 16'h0004;

        #10;
        address = 16'h0006;

        #10;
        address = 16'h0008;

        #10;
        $finish;

    end

endmodule