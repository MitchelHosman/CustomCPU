`timescale 1ns/1ps

module control_unit_tb;

    reg [3:0] opcode;
    
    wire write_enable;
    wire movi_enable;
    wire [2:0] alu_op;

    control_unit uut (

        .opcode(opcode),
        .write_enable(write_enable),
        .movi_enable(movi_enable),
        .alu_op(alu_op)
    );

    initial begin 
        $dumpfile("control_unit.vcd");
        $dumpvars(0, control_unit_tb);
    end

    initial begin
        $monitor("Time=%0t opcode=%b write_enable=%b movi_enable=%b alu_op=%b",
                $time, opcode, write_enable, movi_enable, alu_op);
    end

    initial begin

    opcode = 4'b0000;

    #10;

    opcode = 4'b0101;
    
    #10;

    opcode = 4'b1000;

    #10;

    opcode = 4'b1111;

    #10;

    $finish;

    end
endmodule
