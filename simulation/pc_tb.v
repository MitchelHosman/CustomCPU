`timescale 1ns/1ps

module pc_tb;

    reg clk;
    reg reset;

    wire [15:0] pc;

    program_counter uut (
        .clk(clk),
        .reset(reset),
        .pc(pc)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        $dumpfile("pc.vcd");
        $dumpvars(0, pc_tb);

        $monitor("Time=%0t CLK=%b RESET=%b PC=%h",
                 $time, clk, reset, pc);

        #10;

        reset = 0;

        #50;

        reset = 1;

        #10;

        reset = 0;

        #30;

        $finish;
    end

endmodule