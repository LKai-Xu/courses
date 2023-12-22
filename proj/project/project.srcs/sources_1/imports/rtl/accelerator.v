module accelerator(
    input clk,
    input rst_n,
    input start,
    input split,

    // weight buffer read
    output  reg weight_we,
    output  reg [6:0]   weight_addr,
    input   [79:0]  weight_data,

    // input buffer read
    output  reg input_we,
    output  reg [6:0]   input_addr,
    input   [15:0]  input_data,

    output  reg [3:0]   inference_result
);

    reg working;
    reg parallel;
    reg [3:0] state;
    reg [6:0] counter;

    reg [7:0] mid_result [9:0];

    wire [479:0] pe_line_out;
    reg [479:0] partial_result;

    // working
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

    // parallel
    // parallel = 1 for two images processing parallelly
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            parallel <= 1'b0;
        end
        else begin
            if(start) begin
                parallel <= split;
            end
            else begin
                parallel <= parallel;
            end
        end
    end

    // state
    // 4'b0000, idle
    // 4'b0001, FC LAYER 1
    // 4'b0010, scale and round
    // 4'b0100, FC LAYER 2
    // 4'b0101, scale
    // 4'b0110, argmax
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            state <= 4'b0;
        end
        else begin
            if(start) begin
                state <= 4'b0001;
            end
            else begin
                case(state)
                    4'b0001:    begin
                                    if(counter == 7'b1100011) begin
                                        state <= 4'b0010;
                                    end
                                    else begin
                                        state <= state;
                                    end
                                end
                    4'b0010:    begin
                                    state <= 4'b0100;
                                end
                    4'b0100:    begin
                                    if(counter == 7'b0001001) begin
                                        state <= 4'b0101;
                                    end
                                    else begin
                                        state <= state;
                                    end
                                end
                    4'b0101:    begin
                                    state <= 4'b0110;
                                end
                    4'b0110:    begin
                                    state <= 4'b0000;
                                end
                    default:    begin
                                    state <= state;
                                end
                endcase
            end
        end
    end

    // counter
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            counter <= 7'b0;
        end
        else begin
            if(start) begin
                counter <= 7'b0;
            end
            else begin
                case(state)
                    4'b0001:    begin
                                    if(counter < 7'b1100011) begin
                                        counter <= counter + 1;
                                    end
                                    else begin
                                        counter <= 7'b0;
                                    end
                                end
                    4'b0100:    begin
                                    if(counter < 7'b0001001) begin
                                        counter <= counter + 1;
                                    end
                                    else begin
                                        counter <= 7'b0;
                                    end
                                end
                    default:    begin
                                    counter <= counter;
                                end
                endcase
            end
        end
    end

    // weight_we
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            weight_we <= 1'b0;
        end
        else begin
            weight_we <= weight_we;
        end
    end

    // weight_addr
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            weight_addr <= 7'b0;
        end
        else begin
            if(state==4'b0001 | state == 4'b0010 | state==4'b0100) begin
                weight_addr <= weight_addr + 1;
            end
            else begin
                weight_addr <= weight_addr;
            end
        end
    end

    // input_we
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            input_we <= 1'b0;
        end
        else begin
            input_we <= input_we;
        end
    end

    // input_addr
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            input_addr <= 7'b0;
        end
        else begin
            if(state==4'b0001) begin
                input_addr <= input_addr + 1;
            end
            else if(state==4'b0100) begin
                input_addr <= input_addr + 1;
            end
            else begin
                input_addr <= input_addr;
            end
        end
    end

    wire [15:0] in_x;
    wire [79:0] in_w;
    assign in_x = (state == 4'b0001) ? input_data : ((state == 4'b0100) ? {8'b0, mid_result[counter]} : {16'b0});
    assign in_w = (state == 4'b0001 | state == 4'b0100) ? weight_data : 80'b0;
    assign flush = (state == 4'b0010);

    pe_line_parallel plp (
        .clk(clk), 
        .rst_n(rst_n), 
        .partial_result(partial_result), 
        .working(working),
        .flush(flush),
        .in_x(in_x[7:0]), 
        .in_w(in_w), 
        .split(parallel), 
        .out(pe_line_out)
    );

    // partial result
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            partial_result <= 480'b0;
        end
        else begin
            if(start) begin
                partial_result <= 480'b0;
            end
            else begin
                if(state == 4'b0001) begin
                    partial_result <= pe_line_out;
                end
                else if(state == 4'b0010) begin
                    partial_result <= 480'b0;
                end
                else if(state == 4'b0100) begin
                    partial_result <= pe_line_out;
                end
                else if(state == 4'b0101) begin
                    partial_result <= pe_line_out;
                end
                else begin
                    partial_result <= 480'b0;
                end
            end
        end
    end

    // mid_result
    generate 
        genvar i_mid;
        for(i_mid=0;i_mid<10;i_mid=i_mid+1) begin: mid_result_gen
            always@(posedge clk or negedge rst_n) begin
                if(!rst_n) begin
                    mid_result[i_mid] <= 8'b0;
                end
                else begin
                    if(state==4'b0001 & counter == 7'b1100011) begin
                        // scale 
                        mid_result[i_mid] <= partial_result[i_mid*48+9:i_mid*48+2];
                    end
                    else if(state==4'b0010) begin
                        //relu
                        if (mid_result[i_mid][7] == 1) begin
                            mid_result[i_mid] <= 8'b0;
                        end
                        else begin
                            mid_result[i_mid] <= mid_result[i_mid];
                        end
                    end
                    else if(state==4'b0110) begin
                        // scale
                        mid_result[i_mid] <= partial_result[i_mid*48+11:i_mid*48+4];
                    end
                    else begin
                        mid_result[i_mid] <= mid_result[i_mid];
                    end
                end
            end
        end
    endgenerate

    wire [3:0] mid_index [4:0];
    wire [7:0] mid_max_value [4:0];
    assign mid_index[0] = (mid_result[1] > mid_result[0]) ? 4'b0001 : 4'b0000;
    assign mid_max_value[0] = (mid_result[1] > mid_result[0]) ? mid_result[1] : mid_result[0];
    assign mid_index[1] = (mid_result[3] > mid_result[2]) ? 4'b0011 : 4'b0010;
    assign mid_max_value[1] = (mid_result[3] > mid_result[2]) ? mid_result[3] : mid_result[2];
    assign mid_index[2] = (mid_result[5] > mid_result[4]) ? 4'b0101 : 4'b0100;
    assign mid_max_value[2] = (mid_result[5] > mid_result[4]) ? mid_result[5] : mid_result[4];
    assign mid_index[3] = (mid_result[7] > mid_result[6]) ? 4'b0111 : 4'b0110;
    assign mid_max_value[3] = (mid_result[7] > mid_result[6]) ? mid_result[7] : mid_result[6];
    assign mid_index[4] = (mid_result[9] > mid_result[8]) ? 4'b1001 : 4'b1000;
    assign mid_max_value[4] = (mid_result[9] > mid_result[8]) ? mid_result[9] : mid_result[8];

    wire [3:0] mid_index_2 [1:0];
    wire [7:0] mid_max_value_2 [1:0];
    assign mid_index_2[0] = (mid_max_value[1] > mid_max_value[0]) ? mid_index[1] : mid_index[0];
    assign mid_max_value_2[0] = (mid_max_value[1] > mid_max_value[0]) ? mid_max_value[1] : mid_max_value[0];
    assign mid_index_2[1] = (mid_max_value[3] > mid_max_value[2]) ? mid_index[3] : mid_index[2];
    assign mid_max_value_2[1] = (mid_max_value[3] > mid_max_value[2]) ? mid_max_value[3] : mid_max_value[2];

    wire [3:0] mid_index_3;
    wire [7:0] mid_max_value_3;
    assign mid_index_3 = (mid_max_value_2[1] > mid_max_value[4]) ? mid_index_2[1] : mid_index[4];
    assign mid_max_value_3 = (mid_max_value_2[1] > mid_max_value[4]) ? mid_max_value_2[1] : mid_max_value[4];

    wire [3:0] max_index;
    assign max_index = (mid_max_value_3 > mid_max_value_2[0]) ? mid_index_3 : mid_index_2[0];

    // inference result
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            inference_result <= 4'b0;
        end
        else begin
            if(start) begin
                inference_result <= 4'b0;
            end
            else begin
                if(state==4'b0101) begin
                    inference_result <= max_index;
                end
                else begin
                    inference_result <= inference_result;
                end
            end
        end
    end

endmodule