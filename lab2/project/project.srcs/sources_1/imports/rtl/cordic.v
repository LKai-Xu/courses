
module cordic (
    input clk,
    input rst_n,
    input start,
    input [15:0] angle,
    output reg [15:0] cos,
    output reg [15:0] sin
);

    reg [15:0] sampled_angle;
    reg finish;
    reg [3:0] state;
    wire [15:0] ei_radian;
    wire [15:0] tanei;

    // sample the input angle
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n == 1'b0) begin
            sampled_angle <= 16'b0;
        end
        else begin
            if (start == 1'b1) begin
                sampled_angle <= angle;
            end
            else begin
                if (sampled_angle == 16'b0) begin
                    sampled_angle <= sampled_angle;
                end
                else if (sampled_angle > ei_radian) begin
                    sampled_angle <= sampled_angle - ei_radian;
                end
                else begin
                    sampled_angle <= sampled_angle - ei_radian;
                end
            end
        end
    end

    // finish
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n == 1'b0) begin
            finish <= 1'b0;
        end
        else begin
            if (start == 1'b1) begin
                finish <= 1'b0;
            end
            else begin
                if ((sampled_angle == 16'b0) | (state == 4'b1111)) begin
                    finish <= 1'b1;
                end
                else begin
                    finish <= finish;
                end
            end
        end
    end

    // state
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n == 1'b0) begin
            state <= 4'b0;
        end
        else begin
            if (start == 1'b1) begin
                state <= 4'b0;
            end
            else begin
                if ((finish == 1'b1) | (sampled_angle == 16'b0)) begin
                    state <= 4'b0;
                end
                else begin
                    state <= state + 1;
                end
            end
        end
    end

    // sin
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n == 1'b0) begin
            sin <= 16'b0;
        end
        else begin
            if (start == 1'b1) begin
                sin <= 16'b0;
            end
            else begin
                if ((finish == 1'b1) | (sampled_angle == 16'b0)) begin
                    sin <= sin;
                end
                else begin
                    sin <= sin + cos * tanei;
                end
            end
        end
    end
    // cos
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n == 1'b0) begin
            cos <= 16'b0;
        end
        else begin
            if (start == 1'b1) begin
                cos <= 16'h8000;
            end
            else begin
                if ((finish == 1'b1) | (sampled_angle == 16'b0)) begin
                    cos <= cos;
                end
                else begin
                    cos <= cos - sin * tanei;
                end
            end
        end
    end

    // look up table unit
    lut i_lut_0 (.index(state), .ei_radian(ei_radian),  .tanei(tanei));





endmodule