module adder_16bit(
    input   [15:0] a,
    input   [15:0] b,
    output  [15:0] out
);

    wire [15:0] s;
    wire [15:0] cout;

    ha i_ha_0 (.a(a[0]), .b(b[0]), .s(s[0]), .cout(cout[0]));
    generate 
        genvar i_adder;
        for(i_adder=1; i_adder<16; i_adder=i_adder+1) begin: adder_for_bits
            fa i_fa (.a(a[i_adder]), .b(b[i_adder]), .cin(cout[i_adder-1]), .s(s[i_adder]), .cout(cout[i_adder]));
        end
    endgenerate

    assign out[15:0] = s[15:0];

endmodule



module unsigned_unit_first_line(
    input [15:0] in_a,
    input  in_b,
    output [15:0] s
);

    generate
        genvar i_and;
        for(i_and=0;i_and<16;i_and=i_and+1) begin: unsigned_unit_second_line_generate
            assign s[i_and] = in_a[i_and] & in_b;
        end
    endgenerate

endmodule

module unsigned_unit_second_line(
    input [15:0] in_x,
    input [15:0] in_a,
    input  in_b,
    output [15:0] s,
    output [15:0] cout
);

    generate
        genvar i_buh;
        for(i_buh=0;i_buh<16;i_buh=i_buh+1) begin: unsigned_unit_second_line_generate
            basic_unit_ha_and   i_buha  (.in_x(in_x[i_buh]), .in_a(in_a[i_buh]), .in_b(in_b), .s(s[i_buh]), .cout(cout[i_buh]));
        end
    endgenerate

endmodule

module unsigned_unit_line(
    input [15:0] in_x,
    input [15:0] in_a,
    input  in_b,
    input [15:0] cin,
    output [15:0] s,
    output [15:0] cout
);

    generate
        genvar i_buf;
        for(i_buf=0;i_buf<16;i_buf=i_buf+1) begin: unsigned_unit_second_line_generate
            basic_unit_fa_and   i_bufa  (.in_x(in_x[i_buf]), .in_a(in_a[i_buf]), .in_b(in_b), .cin(cin[i_buf]), .s(s[i_buf]), .cout(cout[i_buf]));
        end
    endgenerate

    // basic_unit_ha_and i_buha_15 (.in_x(in_x[15]), .in_a(in_a[15]), .in_b(in_b), .s(s[15]), .cout(cout[15]));

endmodule


module multiply_and_add(
    input [15:0] in,
    input [15:0] a,
    input [15:0] b,
    input neg,
    output [15:0] out
);

    wire [15:0] s_line [15:0];
    wire [15:0] cout_line [15:1];

    unsigned_unit_first_line    i_bul_0 (.in_a(a), .in_b(b[0]), .s(s_line[0]));
    unsigned_unit_second_line   i_bul_1 (.in_x({1'b0, s_line[0][15:1]}), .in_a(a), .in_b(b[1]), .s(s_line[1]), .cout(cout_line[1]));
    unsigned_unit_line          i_bul_2 (.in_x({1'b0, s_line[1][15:1]}), .in_a(a), .in_b(b[2]), .cin(cout_line[1]), .s(s_line[2]), .cout(cout_line[2]));

    generate
        genvar i_bul;
        for(i_bul=2;i_bul<16;i_bul=i_bul+1) begin: unsigned_unit_line_generate
            unsigned_unit_line  i_bul (.in_x({1'b0, s_line[i_bul-1][15:1]}), .in_a(a), .in_b(b[i_bul]), .cin(cout_line[i_bul-1]), .s(s_line[i_bul]), .cout(cout_line[i_bul]));
        end
    endgenerate

    wire [31:0] product_32b;
    generate
        genvar i_s;
        for(i_s=0;i_s<16;i_s=i_s+1) begin: unsigned_output_low_generate
            assign product_32b[i_s] = s_line[i_s][0];
        end
    endgenerate

    adder_16bit i_adder_16b_0 (.a({1'b0, s_line[15]}), .b(cout_line[15]), .out(product_32b[31:16]));

    wire [15:0] pos_or_neg;
    assign pos_or_neg = neg ? {{~{product_32b[31:16]}+1}} : {product_32b[31:16]};

    // output
    adder_16bit i_adder_16b_1 (.a(in), .b(pos_or_neg), .out(out));

endmodule