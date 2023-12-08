module top_tb();

    wire split;
    wire [47:0] inputs;
    wire [7:0] a;
    wire [7:0] b;
    wire [47:0] outputs;

    initial begin
        split <= 1'b1;
        inputs <= 48'b0;
        a <= 8'b1;
        b <= 8'b1;
        # 10;
        a <= 8'hff;
        b <= 8'hff;

    end


    fused_signed_mac_32p8t8_2x24p8t4 i_mac_unit(.split(split), .in(inputs), .a(a), .b(b), .out(outputs));


endmodule