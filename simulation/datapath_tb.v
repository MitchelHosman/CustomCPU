`timescale 1ns/1ps

module datapath_tb;
    reg clk;

    reg [3:0] read_addr_a;
    reg [3:0] read_addr_b;
    reg [7:0] immediate;

    reg [3:0] write_addr;
    reg write_enable;
    reg movi_enable;
    
    reg [2:0] alu_op;

    wire [15:0] alu_result;
    wire [15:0] result;
    wire zero;

    datapath uut (
    .clk(clk),

    .read_addr_a(read_addr_a),
    .read_addr_b(read_addr_b),
    .immediate(immediate),

    .write_addr(write_addr),
    .write_enable(write_enable),
    .movi_enable(movi_enable),
    
    .alu_op(alu_op),

    .result(result),
    .alu_result(alu_result),
    .zero(zero)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        read_addr_a = 0;
        read_addr_b = 0;
        immediate = 0;
        write_addr = 0;
        alu_op = 0;
        write_enable = 0;
        movi_enable = 0;
    end

    initial begin 
        $dumpfile("datapath.vcd");
        $dumpvars(0, datapath_tb);
    end

    initial begin
        $monitor("Time=%0t CLK=%b WE=%b ME=%b WADDR=%b RADDR_A=%b RADDR_B=%b ALUOP=%b IMM=%b ALU_RESULT=%b RESULT=%b ZERO=%b",
         $time, clk, write_enable, movi_enable, write_addr,
         read_addr_a, read_addr_b, alu_op, immediate, alu_result, result, zero);
    end

    initial begin

    write_addr = 4'b0001;
    write_enable = 1;
    movi_enable = 1;
    immediate = 8'd10;

    #10;

    write_addr = 4'b0010;
    immediate = 8'd20;

    #10;

    write_addr = 4'b0011;
    movi_enable = 0;
    read_addr_a = 4'b0001;
    read_addr_b = 4'b0010;
    alu_op = 3'b000;

    #10;

    read_addr_a = 4'b0001;
    read_addr_b = 4'b0011;

    #10;

    $finish;

    end
endmodule