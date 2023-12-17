module fa(
    input a,
    input b,
    input cin,
    output s,
    output cout
);

    assign s = a ^ b  ^ cin;
    assign cout = (a & b) ^ (cin & (a ^ b));

endmodule


module ha(
    input a,
    input b,
    output s,
    output cout
);

    assign s = a ^ b;
    assign cout = a & b;

endmodule


module basic_unit_ha_and(
    input in_x,
    input in_a,
    input in_b,
    output s,
    output cout
);

    wire in_y;
    assign in_y = in_a & in_b;

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
    assign in_y = ~(in_a & in_b);

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
    assign in_y = in_a & in_b;

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
    assign in_y = ~(in_a & in_b);

    assign s = in_x ^ in_y ^ cin;
    assign cout = (in_x & in_y) ^ (cin & (in_x ^ in_y));

endmodule



module basic_unit_first_line(
    input [7:0] in_x,
    input [7:0] in_a,
    input in_b,
    output [7:0] s,
    output [7:0] cout
);

    basic_unit_ha_and i_buha_0 (.in_x(in_x[0]), .in_a(in_a[0]), .in_b(in_b), .s(s[0]), .cout(cout[0]));
    basic_unit_ha_and i_buha_1 (.in_x(in_x[1]), .in_a(in_a[1]), .in_b(in_b), .s(s[1]), .cout(cout[1]));
    basic_unit_ha_and i_buha_2 (.in_x(in_x[2]), .in_a(in_a[2]), .in_b(in_b), .s(s[2]), .cout(cout[2]));
    basic_unit_ha_and i_buha_3 (.in_x(in_x[3]), .in_a(in_a[3]), .in_b(in_b), .s(s[3]), .cout(cout[3]));
    basic_unit_ha_and i_buha_4 (.in_x(in_x[4]), .in_a(in_a[4]), .in_b(in_b), .s(s[4]), .cout(cout[4]));
    basic_unit_ha_and i_buha_5 (.in_x(in_x[5]), .in_a(in_a[5]), .in_b(in_b), .s(s[5]), .cout(cout[5]));
    basic_unit_ha_and i_buha_6 (.in_x(in_x[6]), .in_a(in_a[6]), .in_b(in_b), .s(s[6]), .cout(cout[6]));
    basic_unit_ha_nand i_buhna_7 (.in_x(in_x[7]), .in_a(in_a[7]), .in_b(in_b), .s(s[7]), .cout(cout[7]));


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


module adder_9bit_unit(
    input   [8:0] a,
    input   [8:1] b,
    output  [8:0] out
);

    wire [8:0] s;
    wire [8:0] cout;

    ha i_ha_0 (.a(a[0]), .b(1'b0), .s(s[0]), .cout(cout[0]));
    generate 
        genvar i_adder;
        for(i_adder=1; i_adder<9; i_adder=i_adder+1) begin: adder_for_bits
            fa i_fa (.a(a[i_adder]), .b(b[i_adder]), .cin(cout[i_adder-1]), .s(s[i_adder]), .cout(cout[i_adder]));
        end
    endgenerate

    assign out[8:0] = s[8:0];


endmodule


module adder_24bit(
    input   [23:0] a,
    input   [23:0] b,
    output  [23:0] out
);

    wire [23:0] s;
    wire [23:0] cout;

    ha i_ha_0 (.a(a[0]), .b(b[0]), .s(s[0]), .cout(cout[0]));
    generate 
        genvar i_adder;
        for(i_adder=1; i_adder<24; i_adder=i_adder+1) begin: adder_for_bits
            fa i_fa (.a(a[i_adder]), .b(b[i_adder]), .cin(cout[i_adder-1]), .s(s[i_adder]), .cout(cout[i_adder]));
        end
    endgenerate

    assign out[23:0] = s[23:0];


endmodule


module adder_32bit(
    input   [31:0] a,
    input   [31:0] b,
    output  [31:0] out
);

    wire [31:0] s;
    wire [31:0] cout;

    ha i_ha_0 (.a(a[0]), .b(b[0]), .s(s[0]), .cout(cout[0]));
    generate 
        genvar i_adder;
        for(i_adder=1; i_adder<32; i_adder=i_adder+1) begin: adder_for_bits
            fa i_fa (.a(a[i_adder]), .b(b[i_adder]), .cin(cout[i_adder-1]), .s(s[i_adder]), .cout(cout[i_adder]));
        end
    endgenerate

    assign out[31:0] = s[31:0];


endmodule


module lut(
    input [3:0] index,
    output [15:0] ei_radian,
    output [15:0] tanei
);

    reg [15:0] tanei_const [15:0];
    reg [15:0] ei_radian_const [15:0];

    initial begin
        // tanei_const[0] = 16'h8000;
        // tanei_const[1] = 16'h4000;
        // tanei_const[2] = 16'h2000;
        // tanei_const[3] = 16'h1000;
        // tanei_const[4] = 16'h0800;
        // tanei_const[5] = 16'h0400;
        // tanei_const[6] = 16'h0200;
        // tanei_const[7] = 16'h0100;
        // tanei_const[8] = 16'h0080;
        // tanei_const[9] = 16'h0040;
        // tanei_const[10] = 16'h0020;
        // tanei_const[11] = 16'h0010;
        // tanei_const[12] = 16'h0008;
        // tanei_const[13] = 16'h0004;
        // tanei_const[14] = 16'h0002;
        // tanei_const[15] = 16'h0001;

        // ei_radian_const[0] = 16'b0110010010000111;
        // ei_radian_const[1] = 16'b0011101101011000;
        // ei_radian_const[2] = 16'b0001111101011011;
        // ei_radian_const[3] = 16'b0000111111101010;
        // ei_radian_const[4] = 16'b0000011111111101;
        // ei_radian_const[5] = 16'b0000001111111111;
        // ei_radian_const[6] = 16'b0000000111111111;
        // ei_radian_const[7] = 16'b0000000011111111;
        // ei_radian_const[8] = 16'b0000000001111111;
        // ei_radian_const[9] = 16'b0000000000111111;
        // ei_radian_const[10] = 16'b0000000000011111;
        // ei_radian_const[11] = 16'b0000000000001111;
        // ei_radian_const[12] = 16'b0000000000000111;
        // ei_radian_const[13] = 16'b0000000000000011;
        // ei_radian_const[14] = 16'b0000000000000001;
        // ei_radian_const[15] = 16'b0000000000000000;

        
        tanei_const[0] = 16'h0000;
        tanei_const[1] = 16'h8000;
        tanei_const[2] = 16'h4000;
        tanei_const[3] = 16'h2000;
        tanei_const[4] = 16'h1000;
        tanei_const[5] = 16'h0800;
        tanei_const[6] = 16'h0400;
        tanei_const[7] = 16'h0200;
        tanei_const[8] = 16'h0100;
        tanei_const[9] = 16'h0080;
        tanei_const[10] = 16'h0040;
        tanei_const[11] = 16'h0020;
        tanei_const[12] = 16'h0010;
        tanei_const[13] = 16'h0008;
        tanei_const[14] = 16'h0004;
        tanei_const[15] = 16'h0002;

        ei_radian_const[0] = 16'b0000000000000000;
        ei_radian_const[1] = 16'b0110010010000111;
        ei_radian_const[2] = 16'b0011101101011000;
        ei_radian_const[3] = 16'b0001111101011011;
        ei_radian_const[4] = 16'b0000111111101010;
        ei_radian_const[5] = 16'b0000011111111101;
        ei_radian_const[6] = 16'b0000001111111111;
        ei_radian_const[7] = 16'b0000000111111111;
        ei_radian_const[8] = 16'b0000000011111111;
        ei_radian_const[9] = 16'b0000000001111111;
        ei_radian_const[10] = 16'b0000000000111111;
        ei_radian_const[11] = 16'b0000000000011111;
        ei_radian_const[12] = 16'b0000000000001111;
        ei_radian_const[13] = 16'b0000000000000111;
        ei_radian_const[14] = 16'b0000000000000011;
        ei_radian_const[15] = 16'b0000000000000001;
    end

    assign ei_radian = ei_radian_const[index];
    assign tanei = tanei_const[index];

endmodule