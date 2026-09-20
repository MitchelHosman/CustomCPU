module cpu (

    input wire clk,
    input wire reset,

    output wire [15:0] pc,
    output wire [15:0] instruction
);

    wire [3:0] opcode;
    wire [3:0] rd;
    wire [3:0] rs1;
    wire [3:0] rs2;

    wire [2:0] alu_op;
    wire movi_enable;
    wire write_enable;
    wire halt;

    wire [15:0] result;
    wire [7:0] immediate;

    assign immediate = instruction[7:0];

    program_counter pc_unit (

        .clk(clk),
        .reset(reset),
        .halt(halt),
        .pc(pc)
    );

    instruction_memory instruction_unit (

        .address(pc),
        .instruction(instruction)
    );

    decoder decoder_unit (

        .instruction(instruction),
        .opcode(opcode),
        .rd(rd),
        .rs1(rs1),
        .rs2(rs2)
    );

    control_unit control (

        .opcode(opcode),
        .movi_enable(movi_enable),
        .write_enable(write_enable),
        .alu_op(alu_op),
        .halt(halt)
    );

    datapath datapath_unit (

        .clk(clk),
        .read_addr_a(rs1),
        .read_addr_b(rs2),
        .write_addr(rd),
        .write_enable(write_enable),
        .movi_enable(movi_enable),
        .alu_op(alu_op),
        .immediate(immediate),
        .result(result)
    );

endmodule