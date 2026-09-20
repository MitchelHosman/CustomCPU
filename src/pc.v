`timescale 1ns/1ps

module program_counter (
    input wire clk,
    input wire reset,
    input wire halt,
    output reg [15:0] pc
);

    always @(posedge clk) begin
        if(reset)
            pc <= 16'h0000;
        else if (!halt)
            pc <= pc + 16'd2;
    end
endmodule