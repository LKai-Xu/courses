module accelerator(
    input clk,
    input rst_n,
    input layer,
    input start,

    // weight buffer read
    output  weight_we,
    output  [6:0]   weight_addr,
    input   [79:0]  weight_data,

    // input buffer read
    output  input_we,
    output  [6:0]   input_addr,
    input   [15:0]  input_data,

    // output buffer read/write
    output  result_we,
    output  [3:0]   result_addr,
    input   [79:0]  result_data

    output  [3:0]   inference_result
);

    reg working;

    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            working <= 1'b0;
        end
        else begin
            if(start) begin
                working <= 1'b1;
            end
            else begin
                working <= working;
            end
        end
    end

    pe_line_parallel plp (.clk());

endmodule