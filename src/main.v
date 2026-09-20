module main (
    input wire clk,
    output wire led
);

    reg [3:0] reset_counter = 4'd0;

    wire reset;
    wire [15:0] pc;
    wire [15:0] instruction;

    always @(posedge clk) begin
        if (reset_counter < 4'd5)
            reset_counter <= reset_counter + 1'b1;
    end

    assign reset = (reset_counter < 4'd5);

    cpu cpu_unit (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instruction(instruction)
    );

    assign led = (instruction == 16'hFFFF);

endmodule