`timescale 1ns/1ps

module alu_tb;

    reg [15:0] A;
    reg [15:0] B;
    reg [2:0] op;

    wire [15:0] result;
    wire zero;

    alu uut (
        .A(A),
        .B(B),
        .op(op),
        .result(result),
        .zero(zero)
    );

    initial begin 
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);
    end

    initial begin
        $monitor("Time=%0t A=%h B=%h OP=%b RESULT=%h ZERO=%b",
                $time, A, B, op, result, zero);
    end

    initial begin

        A = 16'd10;
        B = 16'd3;
        op = 3'b000;

        #10;

        A = 16'd10;
        B = 16'd3;
        op = 3'b001;

        #10;

        A = 16'hFF00;
        B = 16'h0F0F;
        op = 3'b010;

        #10;

        A = 16'hFF00;
        B = 16'h0F0F;
        op = 3'b011;

        #10;

        A = 16'hFF00;
        B = 16'h0F0F;
        op = 3'b100;

        #10;

        A = 16'hAAAA;
        B = 16'h0000;
        op = 3'b101;

        #10;

        A = 16'h0001;
        B = 16'd4;
        op = 3'b110;

        #10;

        A = 16'h0010;
        B = 16'd2;
        op = 3'b111;

        #10;

        A = 16'b0010;
        B = 16'b0010;
        op = 3'b001;

        #10;

        A = 16'b0;
        B = 16'b0;
        op = 3'b010;

        $finish;
    end
endmodule
