module control_unit (
    input wire [3:0] opcode,
    
    output wire write_enable,
    output wire movi_enable,
    output wire [2:0] alu_op,
    output wire halt
);

    assign alu_op = opcode[2:0];
    assign movi_enable = (opcode == 4'b1000);

    assign write_enable = (opcode > 4'b1000) ? 1'b0 : 1'b1;

    assign halt = (opcode == 4'b1111);

endmodule