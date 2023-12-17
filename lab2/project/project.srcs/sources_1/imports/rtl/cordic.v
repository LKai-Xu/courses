
module cordic (
    input clk,
    input rst_n,
    input start,
    input [15:0] angle,
    output reg [15:0] cos,
    output reg [15:0] sin
);

    reg [15:0] sampled_angle;
    reg [15:0] inner_angle;
    reg working;
    reg [3:0] state;
    wire [15:0] ei_radian;
    wire [15:0] tanei;
    wire [15:0] new_inner_angle;
    wire [15:0] new_sin;
    wire [15:0] new_cos;
    wire neg;

    // sample the input angle
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n == 1'b1) begin
            sampled_angle <= 16'b0;
        end
        else begin
            if (start == 1'b1) begin
                sampled_angle <= angle;
            end
            else begin
                sampled_angle <= sampled_angle;
            end
        end
    end

    
    // inner angle reg
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n == 1'b1) begin
            inner_angle <= 16'b0;
        end
        else begin
            if (start == 1'b1) begin
                inner_angle <= 16'b0;
            end
            else begin
                inner_angle <= new_inner_angle;
            end
        end
    end

    // working
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n == 1'b1) begin
            working <= 1'b0;
        end
        else begin
            if (start == 1'b1) begin
                working <= 1'b1;
            end
            else begin
                if (state == 4'b1111) begin
                    working <= 1'b0;
                end
                else begin
                    working <= working;
                end
            end
        end
    end

    // state
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n == 1'b1) begin
            state <= 4'b0;
        end
        else begin
            if (start == 1'b1) begin
                state <= 4'b0;
            end
            else begin
                if (working == 1'b0) begin
                    state <= 4'b0;
                end
                else begin
                    state <= state + 1;
                end
            end
        end
    end

    // sin y
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n == 1'b1) begin
            sin <= 16'b0;
        end
        else begin
            if (start == 1'b1) begin
                sin <= 16'b0;
            end
            else begin
                if (working == 1'b0) begin
                    sin <= sin;
                end
                else begin
                    sin <= new_sin;
                end
            end
        end
    end
    // cos x
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n == 1'b1) begin
            cos <= 16'b0;
        end
        else begin
            if (start == 1'b1) begin
                cos <= 16'b0100110110111010;
            end
            else begin
                if (working == 1'b0) begin
                    cos <= cos;
                end
                else begin
                    cos <= new_cos;
                end
            end
        end
    end


    // look up table unit
    lut i_lut_0 (.index(state), .ei_radian(ei_radian),  .tanei(tanei));

    // if <=, neg=0, add in sin (0) and subtract in cos (1); else, neg=1, subtract in sin and add in cos
    assign neg = (inner_angle <= sampled_angle) ? 0 : 1;
    
    // angle addition or subtract
    add_or_sub_unit i_aoru (.neg(neg), .ei_radian(ei_radian), .inner_angle(inner_angle), .new_inner_angle(new_inner_angle));

    multiply_and_add i_mac_cos (.in(cos), .a(tanei), .b(sin), .neg(~neg), .out(new_cos));
    multiply_and_add i_mac_sin (.in(sin), .a(tanei), .b(cos), .neg(neg), .out(new_sin));


endmodule