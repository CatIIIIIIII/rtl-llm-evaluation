

module pulse_detect(clk, rst_n, data_in, data_out);

    parameter initial = 3'b000;
    parameter wait = 3'b001;
    parameter detect = 3'b010;
    parameter finish = 3'b100;

    input clk;
    input rst_n;
    input data_in;
    output reg data_out = 0;

    reg [2:0] state = initial;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= initial;
            data_out <= 0;
        end else begin
            case(state)
                initial: begin
                    data_out <= 0;
                    if (data_in) begin
                        state <= wait;
                    end
                end
                wait: begin
                    data_out <= 0;
                    if (!data_in) begin
                        state <= detect;
                    end
                end
                detect: begin
                    data_out <= 1;
                    if (data_in) begin
                        state <= detect;
                    end else begin
                        state <= finish;
                    end
                end
                finish: begin
                    data_out <= 0;
                    state <= initial;
                end
            endcase
        end
    end

endmodule