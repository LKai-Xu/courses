module top_tb();

    reg split;
    reg [47:0] inputs;
    reg [7:0] a;
    reg [7:0] b;
    wire [47:0] outputs;

    initial begin
        split <= 1'b1;
        inputs <= 48'b0;
        a <= 8'b1;
        b <= 8'b1;
        # 10;
        a <= 8'hff;
        b <= 8'hff;
        inputs <= 48'h12346789;
        # 10;
        a <= 8'h37;
        b <= 8'ha4;
//        # 10;
//        a <= 8'hff;
//        b <= 8'h24;
//        # 10;
//        a <= 8'hff;
//        b <= 8'h78;
        # 10;
        split <= 1'b0;
        a <= 8'h56;
        b <= 8'h79;
        # 10;
        a <= 8'h56;
        b <= 8'h89;
        # 10;
        a <= 8'h88;
        b <= 8'h89;
        inputs <= 48'h6789abcd;
        

    end


    fused_signed_mac_32p8t8_2x24p8t4 i_mac_unit(.split(split), .in(inputs), .a(a), .b(b), .out(outputs));


endmodule