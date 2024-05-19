

module traffic_light(
    input rst_n,
    input clk,
    input pass_request,
    output reg [7:0] clock,
    output reg red,
    output reg yellow,
    output reg green
    );

    // Parameters
    localparam  idle      = 2'b00;
    localparam  s1_red    = 2'b01;
    localparam  s2_yellow  = 2'b10;
    localparam  s3_green   = 2'b11;

    // Registers and wires
    reg [7:0] cnt;
    reg [1:0] state;
    reg p_red;
    reg p_yellow;
    reg p_green;

    // The following always block is responsible for the state transition logic.
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= idle;
        end
        else begin
            case(state)
                idle: begin
                    red <= 1'b0;
                    yellow <= 1'b0;
                    green <= 1'b0;
                    state <= s1_red;
                end
                s1_red: begin
                    red <= 1'b1;
                    yellow <= 1'b0;
                    green <= 1'b0;
                    if (cnt == 8'b00000000) begin
                        state <= s3_green;
                    end
                    else begin
                        cnt <= cnt - 1;
                    end
                end
                s2_yellow: begin
                    red <= 1'b0;
                    yellow <= 1'b1;
                    green <= 1'b0;
                    if (cnt == 8'b00000000) begin
                        state <= s1_red;
                    end
                    else begin
                        cnt <= cnt - 1;
                    end
                end
                s3_green: begin
                    red <= 1'b0;
                    yellow <= 1'b0;
                    green <= 1'b1;
                    if (cnt == 8'b00000000) begin
                        state <= s2_yellow;
                    end
                    else begin
                        cnt <= cnt - 1;
                    end
                end
            endcase
        end
    end

    // The following always block handles the counting logic of the internal counter (cnt).
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 8'b10001000;
        end
        else begin
            if (state == s1_red) begin
                if (cnt == 8'b00000000) begin
                    cnt <= 8'b10001000;
                end
                else begin
                    cnt <= cnt - 1;
                end
            end
            else if (state == s2_yellow) begin
                if (cnt == 8'b00000000) begin
                    cnt <= 8'b10001000;
                end
                else begin
                    cnt <= cnt - 1;
                end
            end
            else if (state == s3_green) begin
                if (cnt == 8'b00000000) begin
                    cnt <= 8'b10001000;
                end
                else begin
                    cnt <= cnt - 1;
                end
            end
            else begin
                if (!rst_n) begin
                    cnt <= 8'b10001000;
                end
                else begin
                    cnt <= cnt - 1;
                end
            end
        end
    end

    // The following assign statement assigns the value of the internal counter (cnt) to the output clock.
    assign clock = cnt;

    // The following always block handles the output signals.
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            red <= 1'b0;
            yellow <= 1'b0;
            green <= 1'b0;
        end
        else begin
            red <= p_red;
            yellow <= p_yellow;
            green <= p_green;
        end
    end

    // The following always block calculates the next values for the red, yellow, and green signals.
    always @(state or cnt or pass_request) begin
        case(state)
            idle: begin
                p_red <= 1'b0;
                p_yellow <= 1'b0;
                p_green <= 1'b0;
            end
            s1_red: begin
                p_red <= 1'b1;
                p_yellow <= 1'b0;
                p_green <= 1'b0;
            end
            s2_yellow: begin
                p_red <= 1'b0;
                p_yellow <= 1'b1;
                p_green <= 1'b0;
            end
            s3_green: begin
                p_red <= 1'b0;
                p_yellow <= 1'b0;
                p_green <= 1'b1;
            end
        endcase
        if (!rst_n) begin
            p_red <= 1'b0;
            p_yellow <= 1'b0;
            p_green <= 1'b0;
        end
        else if (pass_request) begin
            if (green) begin
                if (cnt > 8'b10000000) begin
                    p_green <= 1'b0;
                end
                else begin
                    p_green <= 1'b1;
                end
            end
            else begin
                p_green <= 1'b0;
            end
        end
    end

endmodule