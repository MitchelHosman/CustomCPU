`timescale 1ns/1ps

module register_file_tb;
    reg clk;

    reg [3:0] read_addr_a;
    reg [3:0] read_addr_b;
    wire [15:0] read_data_a;
    wire [15:0] read_data_b;

    reg [3:0] write_addr;
    reg [15:0] write_data;
    reg write_enable;

    register_file uut (
        .read_addr_a(read_addr_a),
        .read_addr_b(read_addr_b),
        .read_data_a(read_data_a),
        .read_data_b(read_data_b),

        .write_addr(write_addr),
        .write_data(write_data),
        .write_enable(write_enable),
        .clk(clk)
    );

    always #5 clk = ~clk;

    initial begin  
        clk = 0;
        read_addr_a = 0;
        read_addr_b = 0;
        write_addr = 0;
        write_data = 0;
        write_enable = 0;
    end

    initial begin 
        $dumpfile("register_file.vcd");
        $dumpvars(0, register_file_tb);
    end

    initial begin
        $monitor("Time=%0t CLK=%b WE=%b WADDR=%b WDATA=%h RADDR_A=%b RDATA_A=%h RADDR_B=%b RDATA_B=%h",
         $time, clk, write_enable, write_addr, write_data,
         read_addr_a, read_data_a, read_addr_b, read_data_b);
    end

    initial begin

        write_addr = 4'b0101;
        write_data = 16'h1234;
        write_enable = 1;

        #10;

        write_addr = 4'b1001;
        write_data = 16'hFF0F;
        write_enable = 1;

        #10;

        read_addr_a = 4'b0101;
        read_addr_b = 4'b1001;

        #10;

        write_addr = 4'b0000;
        write_data = 16'h9999;
        write_enable = 1;

        #10;

        read_addr_a = 4'b0000;

        #10;

        write_addr = 4'b0001;
        write_data = 16'h000a;
        write_enable = 1;

        #10;
    
        write_addr = 4'b0010;
        write_data = 16'h0003;
        write_enable = 1;

        #10;

        read_addr_a = 4'b0001;
        read_addr_b = 4'b0010;

        #10;
        
        $finish;
    end
endmodule
    