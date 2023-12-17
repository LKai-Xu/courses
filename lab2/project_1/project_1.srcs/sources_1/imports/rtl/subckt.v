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



module add_or_sub_unit(
    input neg,
    input [15:0] ei_radian,
    input [15:0] inner_angle,
    output [15:0] new_inner_angle
);

    wire [15:0] signed_ei_radian;
    assign signed_ei_radian = neg ? {{~{ei_radian}+1}} : ei_radian;

    adder_16bit i_adder_16b_0 (.a(signed_ei_radian), .b(inner_angle), .out(new_inner_angle));

endmodule