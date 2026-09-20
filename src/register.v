module register_file(
    input wire clk,

    input wire [3:0] read_addr_a,
    input wire [3:0] read_addr_b,
    output wire [15:0] read_data_a,
    output wire [15:0] read_data_b,

    input wire [3:0] write_addr,
    input wire [15:0] write_data,
    input wire write_enable
);
    reg [15:0] registers [0:15];

    integer i;
    initial begin
        for (i = 0; i < 16; i = i +1)
            registers[i] = 16'h0000;
    end

    assign read_data_a = registers[read_addr_a];
    assign read_data_b = registers[read_addr_b];

    always @(posedge clk) begin
        if (write_enable && write_addr != 4'b0000) begin
            registers[write_addr] <= write_data;
        end
    end
endmodule