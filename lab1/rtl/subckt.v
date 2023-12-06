


module basic_unit_ha_and(
    input in_x,
    input in_a,
    input in_b,
    output s,
    output cout
);

    wire in_y;
    assign in_y = a & b;

    assign s = in_x ^ in_y;
    assign cout = in_x & in_y;

endmodule


module basic_unit_ha_nand(
    input in_x,
    input in_a,
    input in_b,
    output s,
    output cout
);

    wire in_y;
    assign in_y = ~(a & b);

    assign s = in_x ^ in_y;
    assign cout = in_x & in_y;

endmodule


module basic_unit_fa_and(
    input in_x,
    input in_a,
    input in_b,
    input cin,
    output s,
    output cout
);

    wire in_y;
    assign in_y = a & b;

    assign s = in_x ^ in_y ^ cin;
    assign cout = (in_x & in_y) ^ (cin & (in_x ^ in_y));

endmodule


module basic_unit_fa_nand(
    input in_x,
    input in_a,
    input in_b,
    input cin,
    output s,
    output cout
);

    wire in_y;
    assign in_y = ~(a & b);

    assign s = in_x ^ in_y ^ cin;
    assign cout = (in_x & in_y) ^ (cin & (in_x ^ in_y));

endmodule



module basic_unit_first_line(
    input [7:0] in_x,
    input [7:0] in_a,
    input in_b,
    input [7:0] cin,
    output [7:0] s,
    output [7:0] cout
);

    basic_unit_ha_and i_buha_0 (.in_x(in_x[0]), .in_a(in_a[0]), .in_b(in_b), .cin(cin[0]), .s(s[0]), .cout(cout[0]));
    basic_unit_ha_and i_buha_1 (.in_x(in_x[1]), .in_a(in_a[1]), .in_b(in_b), .cin(cin[1]), .s(s[1]), .cout(cout[1]));
    basic_unit_ha_and i_buha_2 (.in_x(in_x[2]), .in_a(in_a[2]), .in_b(in_b), .cin(cin[2]), .s(s[2]), .cout(cout[2]));
    basic_unit_ha_and i_buha_3 (.in_x(in_x[3]), .in_a(in_a[3]), .in_b(in_b), .cin(cin[3]), .s(s[3]), .cout(cout[3]));
    basic_unit_ha_and i_buha_4 (.in_x(in_x[4]), .in_a(in_a[4]), .in_b(in_b), .cin(cin[4]), .s(s[4]), .cout(cout[4]));
    basic_unit_ha_and i_buha_5 (.in_x(in_x[5]), .in_a(in_a[5]), .in_b(in_b), .cin(cin[5]), .s(s[5]), .cout(cout[5]));
    basic_unit_ha_and i_buha_6 (.in_x(in_x[6]), .in_a(in_a[6]), .in_b(in_b), .cin(cin[6]), .s(s[6]), .cout(cout[6]));
    basic_unit_ha_nand i_buhna_7 (.in_x(in_x[7]), .in_a(in_a[7]), .in_b(in_b), .cin(cin[7]), .s(s[7]), .cout(cout[7]));


endmodule




module basic_unit_line(
    input [7:0] in_x,
    input [7:0] in_a,
    input in_b,
    input [7:0] cin,
    output [7:0] s,
    output [7:0] cout
);

    basic_unit_fa_and i_bufa_0 (.in_x(in_x[0]), .in_a(in_a[0]), .in_b(in_b), .cin(cin[0]), .s(s[0]), .cout(cout[0]));
    basic_unit_fa_and i_bufa_1 (.in_x(in_x[1]), .in_a(in_a[1]), .in_b(in_b), .cin(cin[1]), .s(s[1]), .cout(cout[1]));
    basic_unit_fa_and i_bufa_2 (.in_x(in_x[2]), .in_a(in_a[2]), .in_b(in_b), .cin(cin[2]), .s(s[2]), .cout(cout[2]));
    basic_unit_fa_and i_bufa_3 (.in_x(in_x[3]), .in_a(in_a[3]), .in_b(in_b), .cin(cin[3]), .s(s[3]), .cout(cout[3]));
    basic_unit_fa_and i_bufa_4 (.in_x(in_x[4]), .in_a(in_a[4]), .in_b(in_b), .cin(cin[4]), .s(s[4]), .cout(cout[4]));
    basic_unit_fa_and i_bufa_5 (.in_x(in_x[5]), .in_a(in_a[5]), .in_b(in_b), .cin(cin[5]), .s(s[5]), .cout(cout[5]));
    basic_unit_fa_and i_bufa_6 (.in_x(in_x[6]), .in_a(in_a[6]), .in_b(in_b), .cin(cin[6]), .s(s[6]), .cout(cout[6]));
    basic_unit_fa_nand i_bufna_7 (.in_x(in_x[7]), .in_a(in_a[7]), .in_b(in_b), .cin(cin[7]), .s(s[7]), .cout(cout[7]));


endmodule




module basic_unit_last_line(
    input [7:0] in_x,
    input [7:0] in_a,
    input in_b,
    input [7:0] cin,
    output [7:0] s,
    output [7:0] cout
);

    basic_unit_fa_nand i_bufna_0 (.in_x(in_x[0]), .in_a(in_a[0]), .in_b(in_b), .cin(cin[0]), .s(s[0]), .cout(cout[0]));
    basic_unit_fa_nand i_bufna_1 (.in_x(in_x[1]), .in_a(in_a[1]), .in_b(in_b), .cin(cin[1]), .s(s[1]), .cout(cout[1]));
    basic_unit_fa_nand i_bufna_2 (.in_x(in_x[2]), .in_a(in_a[2]), .in_b(in_b), .cin(cin[2]), .s(s[2]), .cout(cout[2]));
    basic_unit_fa_nand i_bufna_3 (.in_x(in_x[3]), .in_a(in_a[3]), .in_b(in_b), .cin(cin[3]), .s(s[3]), .cout(cout[3]));
    basic_unit_fa_nand i_bufna_4 (.in_x(in_x[4]), .in_a(in_a[4]), .in_b(in_b), .cin(cin[4]), .s(s[4]), .cout(cout[4]));
    basic_unit_fa_nand i_bufna_5 (.in_x(in_x[5]), .in_a(in_a[5]), .in_b(in_b), .cin(cin[5]), .s(s[5]), .cout(cout[5]));
    basic_unit_fa_nand i_bufna_6 (.in_x(in_x[6]), .in_a(in_a[6]), .in_b(in_b), .cin(cin[6]), .s(s[6]), .cout(cout[6]));
    basic_unit_fa_and i_bufa_7 (.in_x(in_x[7]), .in_a(in_a[7]), .in_b(in_b), .cin(cin[7]), .s(s[7]), .cout(cout[7]));


endmodule