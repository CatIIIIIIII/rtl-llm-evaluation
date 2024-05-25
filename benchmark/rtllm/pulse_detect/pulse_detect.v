

module pulse_detect(clk, rst_n, data_in, data_out);

    input clk, rst_n, data_in;
    output reg data_out;

    reg [1:0] state;

    parameter [1:0]
        IDLE = 2'b00,
        PULSE = 2'b01,
        PULSE_END = 2'b10;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            state <= IDLE;
            data_out <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (data_in) begin
                        state <= PULSE;
                        data_out <= 0;
                    end else begin
                        state <= IDLE;
                        data_out <= 0;
                    end
                end
                PULSE: begin
                    if (data_in) begin
                        state <= PULSE;
                        data_out <= 0;
                    end else begin
                        state <= PULSE_END;
                        data_out <= 1;
                    end
                end
                PULSE_END: begin
                    if (data_in) begin
                        state <= PULSE;
                        data_out <= 0;
                    end else begin
                        state <= IDLE;
                        data_out <= 0;
                    end
                end
                default: begin
                    state <= IDLE;
                    data_out <= 0;
                end
            endcase
        end
    end
endmodule

//END