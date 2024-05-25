

module traffic_light(
    rst_n,
    clk,
    pass_request,
    clock,
    red,
    yellow,
    green
);

    // Parameters
    parameter idle = 2'b00;
    parameter s1_red = 2'b01;
    parameter s2_yellow = 2'b10;
    parameter s3_green = 2'b11;

    // Inputs
    input rst_n;
    input clk;
    input pass_request;

    // Outputs
    output [7:0] clock;
    output red;
    output yellow;
    output green;

    // Registers and Wires
    reg [7:0] cnt;
    reg [1:0] state;
    reg p_red;
    reg p_yellow;
    reg p_green;

    // Implementation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= idle;
        end else begin
            case (state)
                idle: begin
                    state <= s1_red;
                end
                s1_red: begin
                    if (cnt == 3) begin
                        state <= s3_green;
                    end else begin
                        state <= s1_red;
                    end
                end
                s2_yellow: begin
                    if (cnt == 3) begin
                        state <= s1_red;
                    end else begin
                        state <= s2_yellow;
                    end
                end
                s3_green: begin
                    if (cnt == 3) begin
                        state <= s2_yellow;
                    end else begin
                        state <= s3_green;
                    end
                end
            endcase
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 8'b00000000;
        end else begin
            if (pass_request && green) begin
                cnt <= 8'b00000000;
            end else if (pass_request && yellow) begin
                cnt <= 8'b00000000;
            end else if (pass_request && red) begin
                cnt <= 8'b00000000;
            end else if (red && p_red) begin
                cnt <= 8'b00000000;
            end else if (yellow && p_yellow) begin
                cnt <= 8'b00000000;
            end else if (green && p_green) begin
                cnt <= 8'b00000000;
            end else if (cnt == 0) begin
                cnt <= 8'b00000000;
            end else begin
                cnt <= cnt - 1;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            p_red <= 1'b0;
            p_yellow <= 1'b0;
            p_green <= 1'b0;
        end else begin
            p_red <= red;
            p_yellow <= yellow;
            p_green <= green;
        end
    end

    assign clock = cnt;
    assign red = p_red;
    assign yellow = p_yellow;
    assign green = p_green;

    // END
    // synthesis translate_off
    initial begin
        $display("This is the end of the simulation.");
        $finish;
    end
    // synthesis translate_on

endmodule

// synthesis translate_off
module traffic_light_testbench;

    reg rst_n;
    reg clk;
    reg pass_request;

    wire [7:0] clock;
    wire red;
    wire yellow;
    wire green;

    traffic_light dut(
        .rst_n(rst_n),
        .clk(clk),
        .pass_request(pass_request),
        .clock(clock),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    initial begin
        $display("This is the beginning of the simulation.");
        rst_n = 1'b0;
        clk = 1'b0;
        pass_request = 1'b0;