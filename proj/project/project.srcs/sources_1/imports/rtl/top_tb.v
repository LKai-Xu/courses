module top_tb();

    reg clk;
    reg rst_n;
    reg start;
    reg split;

    wire [3:0] inference_result;

    // clk
    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    //rst_n
    initial begin
        rst_n = 1'b0;
        #5 rst_n = 1'b1;
    end

    // start
    initial begin
        start = 1'b0;
        #16 start = 1'b1;
        #10 start = 1'b0;
    end

    // split
    initial begin
        split = 1'b0;
    end

    accelerator i_acc (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .split(split),

        // weight buffer read
        .weight_we(weight_we),
        .weight_addr(weight_addr),
        .weight_data(weight_data),

        // input buffer read
        .input_we(input_we),
        .input_addr(input_addr),
        .input_data(input_data),

        // output buffer read/write
        .result_we(result_we),
        .result_addr(result_addr),
        .result_data(result_data),

        .inference_result(inference_result)
    );

    sram #(
        .ADDR_WIDTH(7),
        .DATA_WIDTH(80)
    ) sram_weight (
        .clk(clk),
        .addr(weight_addr),
        .din({80'b0}),
        .we(weight_we),
        .dout(weight_data)
    );

    sram #(
        .ADDR_WIDTH(7),
        .DATA_WIDTH(16)
    ) sram_input (
        .clk(clk),
        .addr(input_addr),
        .din({16'b0}),
        .we(input_we),
        .dout(input_data)
    );

    // weight loading initially
    initial begin
        $readmemb("./w1.bin", sram_weight.mem_r, 0,99);
        $readmemb("./w2.bin", sram_weight.mem_r, 100);
    end

    // input loading initially
    initial begin
        $readmemb("./im.bin", sram_input.mem_r);
    end

endmodule