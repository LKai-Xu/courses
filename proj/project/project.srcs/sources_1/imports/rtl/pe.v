// module pe_systolic(
//     input clk,
//     input rst_n,
//     input [7:0] a,
//     input [7:0] b,
//     input split,
//     output reg [7:0] buffered_in,
//     output reg [47:0] result
// );

//     reg [7:0] weight;
//     wire [47:0] mac_out;

//     // input data b
//     always@(posedge clk or negedge rst_n) begin
//         if(!rst_n == 1'b1) begin
//             buffered_in <= 8'b0;
//         end
//         else begin
//             buffered_in <= b;
//         end
//     end

//     // weight data a
//     always@(posedge clk or negedge rst_n) begin
//         if(!rst_n == 1'b1) begin
//             weight <= 8'b0;
//         end
//         else begin
//             weight <= a;
//         end
//     end

//     fused_signed_mac_32p8t8_2x24p8t4 i_mac_unit (.split(split), .in(result), .a(weight), .b(buffered_in), .out(mac_out));

//     // partail sum result
//     always@(posedge clk or negedge rst_n) begin
//         if(!rst_n == 1'b1) begin
//             result <= 48'b0;
//         end
//         else begin
//             result <= mac_out;
//         end        
//     end

// endmodule



module pe_parallel(
    input clk,
    input rst_n,
    input [7:0] a,
    input [7:0] b,
    input split,
    output reg [47:0] result
);

    reg [7:0] buffered_in;
    reg [7:0] weight;
    wire [47:0] mac_out;

    // input data b
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n == 1'b1) begin
            buffered_in <= 8'b0;
        end
        else begin
            buffered_in <= b;
        end
    end

    // weight data a
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n == 1'b1) begin
            weight <= 8'b0;
        end
        else begin
            weight <= a;
        end
    end

    fused_signed_mac_32p8t8_2x24p8t4 i_mac_unit (.split(split), .in(result), .a(weight), .b(buffered_in), .out(mac_out));

    // partail sum result
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n == 1'b1) begin
            result <= 48'b0;
        end
        else begin
            result <= mac_out;
        end        
    end

endmodule



// module pe_line_systolic(
//     input clk,
//     input rst_n,
//     input split,
//     input [7:0] in_x,
//     input [79:0] in_w,
//     output [479:0] out
// );

//     wire [7:0] buffered_in [8:0];

//     pe_systolic  i_pe_unit_0 (.clk(clk), .rst_n(rst_n),  .a(in_x),           .b(in_w[7:0]),      .split(split),  .buffered_in(buffered_in[0]),   .result(out[47:0]));
//     pe_systolic  i_pe_unit_1 (.clk(clk), .rst_n(rst_n),  .a(buffered_in[0]), .b(in_w[15:8]),     .split(split),  .buffered_in(buffered_in[1]),   .result(out[95:48]));
//     pe_systolic  i_pe_unit_2 (.clk(clk), .rst_n(rst_n),  .a(buffered_in[1]), .b(in_w[23:16]),    .split(split),  .buffered_in(buffered_in[2]),   .result(out[143:96]));
//     pe_systolic  i_pe_unit_3 (.clk(clk), .rst_n(rst_n),  .a(buffered_in[2]), .b(in_w[31:24]),    .split(split),  .buffered_in(buffered_in[3]),   .result(out[191:144]));
//     pe_systolic  i_pe_unit_4 (.clk(clk), .rst_n(rst_n),  .a(buffered_in[3]), .b(in_w[39:32]),    .split(split),  .buffered_in(buffered_in[4]),   .result(out[239:192]));
//     pe_systolic  i_pe_unit_5 (.clk(clk), .rst_n(rst_n),  .a(buffered_in[4]), .b(in_w[47:40]),    .split(split),  .buffered_in(buffered_in[5]),   .result(out[287:240]));
//     pe_systolic  i_pe_unit_6 (.clk(clk), .rst_n(rst_n),  .a(buffered_in[5]), .b(in_w[55:48]),    .split(split),  .buffered_in(buffered_in[6]),   .result(out[335:288]));
//     pe_systolic  i_pe_unit_7 (.clk(clk), .rst_n(rst_n),  .a(buffered_in[6]), .b(in_w[63:56]),    .split(split),  .buffered_in(buffered_in[7]),   .result(out[383:336]));
//     pe_systolic  i_pe_unit_8 (.clk(clk), .rst_n(rst_n),  .a(buffered_in[7]), .b(in_w[71:64]),    .split(split),  .buffered_in(buffered_in[8]),   .result(out[431:384]));
//     pe_systolic  i_pe_unit_9 (.clk(clk), .rst_n(rst_n),  .a(buffered_in[8]), .b(in_w[79:72]),    .split(split),  .buffered_in(buffered_in[1]),   .result(out[479:432]));

// endmodule



module pe_line_parallel(
    input clk,
    input rst_n,
    input split,
    input [7:0] in_x,
    input [79:0] in_w,
    output [479:0] out
);

    pe_parallel i_pe_unit_0 (.clk(clk), .rst_n(rst_n),  .a(in_x),   .b(in_w[7:0]),      .split(split),  .result(out[47:0]));
    pe_parallel i_pe_unit_1 (.clk(clk), .rst_n(rst_n),  .a(in_x),   .b(in_w[15:8]),     .split(split),  .result(out[95:48]));
    pe_parallel i_pe_unit_2 (.clk(clk), .rst_n(rst_n),  .a(in_x),   .b(in_w[23:16]),    .split(split),  .result(out[143:96]));
    pe_parallel i_pe_unit_3 (.clk(clk), .rst_n(rst_n),  .a(in_x),   .b(in_w[31:24]),    .split(split),  .result(out[191:144]));
    pe_parallel i_pe_unit_4 (.clk(clk), .rst_n(rst_n),  .a(in_x),   .b(in_w[39:32]),    .split(split),  .result(out[239:192]));
    pe_parallel i_pe_unit_5 (.clk(clk), .rst_n(rst_n),  .a(in_x),   .b(in_w[47:40]),    .split(split),  .result(out[287:240]));
    pe_parallel i_pe_unit_6 (.clk(clk), .rst_n(rst_n),  .a(in_x),   .b(in_w[55:48]),    .split(split),  .result(out[335:288]));
    pe_parallel i_pe_unit_7 (.clk(clk), .rst_n(rst_n),  .a(in_x),   .b(in_w[63:56]),    .split(split),  .result(out[383:336]));
    pe_parallel i_pe_unit_8 (.clk(clk), .rst_n(rst_n),  .a(in_x),   .b(in_w[71:64]),    .split(split),  .result(out[431:384]));
    pe_parallel i_pe_unit_9 (.clk(clk), .rst_n(rst_n),  .a(in_x),   .b(in_w[79:72]),    .split(split),  .result(out[479:432]));

endmodule