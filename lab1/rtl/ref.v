
module fused_signed_mac_32p8t8_2x24p8t4_ref (
    input split,
    input [47:0] in,
    input [7:0] a,
    input [7:0] b,
    output [47:0] out
);

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

