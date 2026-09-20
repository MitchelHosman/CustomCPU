module alu (
    input wire [15:0] A,
    input wire [15:0] B,
    input wire [2:0] op,
    output reg [15: 0] result,
    output wire zero
);

    localparam OP_ADD = 3'b000;
    localparam OP_SUB = 3'b001;
    localparam OP_AND = 3'b010;
    localparam OP_OR = 3'b011;
    localparam OP_XOR = 3'b100;
    localparam OP_NOT = 3'b101;
    localparam OP_SLL = 3'b110;
    localparam OP_SRL = 3'b111;

    always @(*) begin
        case (op)
            OP_ADD: result = A + B;
            OP_SUB: result = A - B;
            OP_AND: result = A & B;
            OP_OR: result = A | B;
            OP_XOR: result = A ^ B;
            OP_NOT: result = ~A;
            OP_SLL: result = A << B[3:0];
            OP_SRL: result = A >> B[3:0];
            default: result = 16'b0;
        endcase
    end

    assign zero = (result == 16'b0);
endmodule
