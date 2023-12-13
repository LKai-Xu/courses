module top_tb();

    reg clk;
    reg rst_n;
    reg start;
    reg [15:0] angle;
    wire [15:0] cos;
    wire [15:0] sin;

    // clk
    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        rst_n = 1'b0;
        #5 rst_n = 1'b1;
    end

    initial begin
        start = 1'b0;
        #16 start = 1'b1;
        #10 start = 1'b0;
    end

    initial begin
        angle = 16'b0110010010000111;
    end



    cordic i_cordic_unit (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .angle(angle),
        .cos(cos),
        .sin(sin)
    );


endmodule