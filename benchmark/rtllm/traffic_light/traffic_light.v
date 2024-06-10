 module traffic_light(
    input rst_n,
    input clk,
    input pass_request,
    output reg [7:0] clock,
    output reg red,
    output reg yellow,
    output reg green
    );
    localparam idle = 2'b00;
    localparam s1_red = 2'b01;
    localparam s2_yellow = 2'b10;
    localparam s3_green = 2'b11;
    reg [1:0] state;
    reg [1:0] next_state;
    reg p_red, p_yellow, p_green;
    reg [7:0] cnt;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= idle;
        end else begin
            state <= next_state;
        end
    end
    always @(state or pass_request) begin
        case (state)
            idle: begin
                p_red = 0;
                p_yellow = 0;
                p_green = 0;
                next_state = s1_red;
            end
            s1_red: begin
                p_red = 1;
                p_yellow = 0;
                p_green = 0;
                if (cnt == 3) begin
                    next_state = s3_green;
                end else begin
                    next_state = s1_red;
                end
            end
            s2_yellow: begin
                p_red = 0;
                p_yellow = 1;
                p_green = 0;
                if (cnt == 3) begin
                    next_state = s1_red;
                end else begin
                    next_state = s2_yellow;
                end
            end
            s3_green: begin
                p_red = 0;
                p_yellow = 0;
                p_green = 1;
                if (cnt == 3) begin
                    next_state = s2_yellow;
                end else begin
                    next_state = s3_green;
                end
            end
        endcase
    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 10;
        end else begin
            if (pass_request && green) begin
                cnt <= 10;
            end else if (Green == 0 && p_green) begin
                cnt <= 60;
            end else if (Yellow == 0 && p_yellow) begin
                cnt <= 5;
            end else if (Red == 0 && p_red) begin
                cnt <= 10;
            end else begin
                cnt <= cnt - 1;
            end
        end
    end
    assign clock = cnt;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            red <= 0;
            yellow <= 0;
            green <= 0;
        end else begin
            red <= p_red;
            yellow <= p_yellow;
            green <= p_green;
        end
    end
endmodule