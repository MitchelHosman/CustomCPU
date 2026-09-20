`timescale 1ns/1ps

module cpu_tb;

    reg clk;
    reg reset;

    wire [15:0] pc;
    wire [15:0] instruction;

    cpu uut (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instruction(instruction)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, cpu_tb);

        clk = 0;
        reset = 1;

        #10;
        reset = 0;

        #50;
        $finish;
    end

    initial begin
        $monitor("Time=%0t PC=%h Instruction=%h",
                 $time, pc, instruction);
    end

endmodule