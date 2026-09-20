`timescale 1ns/1ps

module datapath (
    input wire clk,

    input wire [3:0] read_addr_a,
    input wire [3:0] read_addr_b,

    input wire [3:0] write_addr,
    input wire write_enable,
    
    input wire [2:0] alu_op,

    input wire movi_enable,
    input wire [7:0] immediate,

    output wire [15:0] alu_result,
    output wire [15:0] result,
    output wire zero
);
    wire [15:0] read_data_a;
    wire [15:0] read_data_b;

    wire [15:0] extended_immediate;

    assign extended_immediate = {{8{1'b0}}, immediate};

    assign result = movi_enable ? extended_immediate : alu_result;

    register_file registers (
        .read_addr_a(read_addr_a),
        .read_addr_b(read_addr_b),
        .read_data_a(read_data_a),
        .read_data_b(read_data_b),

        .write_addr(write_addr),
        .write_data(result),
        .write_enable(write_enable),
        .clk(clk)
    );

    alu arithmetic_logic_unit (
        .A(read_data_a),
        .B(read_data_b),
        .op(alu_op),
        .result(alu_result),
        .zero(zero)
    );
endmodule