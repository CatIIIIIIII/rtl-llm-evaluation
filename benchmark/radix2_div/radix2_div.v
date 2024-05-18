`timescale 1ns / 1ps

module radix2_div #(
    parameter DATAWIDTH = 8
)(
    input wire clk,
    input wire rstn,
    input wire en,
    input wire [DATAWIDTH-1:0] dividend,
    input wire [DATAWIDTH-1:0] divisor,
    output reg ready,
    output reg [DATAWIDTH-1:0] quotient,
    output reg [DATAWIDTH-1:0] remainder,
    output reg vld_out
);

// State definitions
localparam IDLE  = 2'b00,
           SUB   = 2'b01,
           SHIFT = 2'b10,
           DONE  = 2'b11;

// FSM and data registers
reg [1:0] current_state, next_state;
reg [DATAWIDTH*2-1:0] dividend_e, divisor_e;
reg [DATAWIDTH-1:0] quotient_e;
reg [DATAWIDTH:0] counter; // Extra bit for counting up to DATAWIDTH inclusively

// State transition logic
always @(posedge clk or negedge rstn) begin
    if (!rstn)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

// Next state logic and operations
always @(*) begin
    next_state = current_state; // Default to hold current state
    case (current_state)
        IDLE: if (en) next_state = SUB;
        SUB: next_state = SHIFT;
        SHIFT: if (counter < DATAWIDTH) next_state = SUB;
               else next_state = DONE;
        DONE: next_state = IDLE;
    endcase
end

// Operations for each state
always @(posedge clk) begin
    if (!rstn) begin
        dividend_e <= 0;
        divisor_e <= 0;
        quotient_e <= 0;
        counter <= 0;
        ready <= 1;
        vld_out <= 0;
    end else begin
        case (next_state)
            IDLE: begin
                ready <= 1;
                vld_out <= 0;
                quotient <= quotient_e;
                remainder <= dividend_e[DATAWIDTH-1:0];
            end
            SUB: begin
                ready <= 0;
                if (dividend_e >= divisor_e) begin
                    dividend_e <= dividend_e - divisor_e;
                    quotient_e[counter] <= 1'b1;
                end
            end
            SHIFT: begin
                dividend_e <= dividend_e << 1;
                counter <= counter + 1;
            end
            DONE: begin
                vld_out <= 1;
                counter <= 0; // Reset counter for next operation
            end
        endcase
    end
end

// Initial setup for division operation
always @(posedge clk) begin
    if (en && current_state == IDLE) begin
        dividend_e <= {DATAWIDTH{1'b0}} | dividend; // Extend dividend to double width
        divisor_e <= divisor << DATAWIDTH; // Align divisor to the left
        quotient_e <= 0; // Reset quotient
        counter <= 0; // Reset counter
    end
end

endmodule
