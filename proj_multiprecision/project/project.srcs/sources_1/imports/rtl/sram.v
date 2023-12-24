
module sram #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 8
) (
    input clk,
    input [ADDR_WIDTH-1:0] addr,
    input [DATA_WIDTH-1:0] din, 
    input we,
    output [DATA_WIDTH-1:0] dout
);

    reg [DATA_WIDTH-1:0] mem_r [0:2**ADDR_WIDTH-1];
    reg [ADDR_WIDTH-1:0] addr_r;

    wire re = !we;

    always @(posedge clk) begin
        if(re) begin
            addr_r <= addr;
        end
    end

    assign dout = mem_r[addr_r];

    always @(posedge clk) begin
        if (we) begin
            mem_r[addr] <= din;
        end
    end

endmodule
