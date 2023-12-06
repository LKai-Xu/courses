
module fused_signed_mac_32p8t8_2x24p8t4 (
    input split,
    input [47:0] in,
    input [7:0] a,
    input [7:0] b,
    output [47:0] out
);

    wire [7:0] s_line [7:0];
    wire [7:0] cout_line [7:0];
    wire [7:0] s_line3_out;
    wire [7:0] cout_line3_out;
    wire [7:0] s_line4_in;
    wire [7:0] cout_line4_in;

    assign s_line4_in = split ? 8'b0 : s_line[3];
    assign cout_line4_in = split ? 8'b0 : cout_line[3];

    // array split low
    basic_unit_first_line   i_bul_0     (.in_a(a), in_b(b[0]), .s(s_line[0]), .cout(cout_line[0]));
    basic_unit_line         i_bul_1     (.in_x({1'b1, s_line[0][7:1]}), .in_a(a), in_b(b[1]), .cin(cout_line[0]), .s(s_line[1]), .cout(cout_line[1]));
    basic_unit_line         i_bul_2     (.in_x({1'b0, s_line[1][7:1]}), .in_a(a), in_b(b[2]), .cin(cout_line[1]), .s(s_line[2]), .cout(cout_line[2]));
    basic_unit_line         i_bul_3     (.in_x({1'b0, s_line[2][7:1]}), .in_a(a), in_b(b[3]), .cin(cout_line[2]), .s(s_line[3]), .cout(cout_line[3]));
    basic_unit_last_line    i_bul_3l    (.in_x({1'b0, s_line[2][7:1]}), .in_a(a), in_b(b[3]), .cin(cout_line[2]), .s(s_line3_l), .cout(cout_line3_l));
    // array split high
    basic_unit_line         i_bul_4     (.in_x({1'b0, s_line4_in[7:1]}), .in_a(a), in_b(b[4]), .cin(cout_line4_in), .s(s_line[4]), .cout(cout_line[4]));
    basic_unit_line         i_bul_5     (.in_x({1'b0, s_line[4][7:1]}), .in_a(a), in_b(b[5]), .cin(cout_line[4]), .s(s_line[5]), .cout(cout_line[5]));
    basic_unit_line         i_bul_6     (.in_x({1'b0, s_line[5][7:1]}), .in_a(a), in_b(b[6]), .cin(cout_line[5]), .s(s_line[6]), .cout(cout_line[6]));
    basic_unit_last_line    i_bul_7     (.in_x({1'b0, s_line[6][7:1]}), .in_a(a), in_b(b[7]), .cin(cout_line[6]), .s(s_line[7]), .cout(cout_line[7]));


    // multiplication product
    wire [15:0] out_8t8;
    wire [11:0] out_8t4_low, out_8t4_high;
    // generate the 8t4 lower product
    assign out_8t4_low[3:0] = s_line[3:0];
    adder_9bit  i_adder_24p8t4_low      (.a({1'b1, s_line3_l}), .b(), .out());
    // 24b8t4 output 
    wire [31:0] out_32p8t8;
    wire [23:0] out_24p8t4_low, out_24p8t4_high;

    // generate the 8t4 higher product

    // generate the 24-bit lower output

    // generate the 24-bit higher output

    
    wire [15:0] out_8t8;
    wire [11:0] out_8t4_0, out_8t4_1;

    assign out_8t8 = $signed(a) * $signed(b);
    assign out_8t4_0 = $signed(a) * $signed(b[3:0]);
    assign out_8t4_1 = $signed(a) * $signed(b[7:4]);

    wire [31:0] out_32p8t8;
    wire [23:0] out_24p8t4_0, out_24p8t4_1;

    assign out_32p8t8 = $signed(in[31:0]) + $signed(out_8t8);
    assign out_24p8t4_0 = $signed(in[23:0]) + $signed(out_8t4_0);
    assign out_24p8t4_1 = $signed(in[47:24]) + $signed(out_8t4_1);

    assign out = split ? {out_24p8t4_1, out_24p8t4_0} : {{16{out_32p8t8[31]}}, out_32p8t8};

endmodule