

module signal_generator(
    input clk,
    input rst_n,
    output reg [4:0] wave
);

    // Define constants
    localparam STATE_SIZE = 1;
    localparam STATE_IDLE = 0;
    localparam STATE_GENERATING = 1;
    
    // Define internal variables
    reg [STATE_SIZE-1:0] state;
    
    // Define helper functions
    function [4:0] incr_wave;
        input [4:0] wave;
        begin
            if (wave == 31)
                incr_wave = 0;
            else
                incr_wave = wave + 1;
        end
    endfunction
    
    function [4:0] decr_wave;
        input [4:0] wave;
        begin
            if (wave == 0)
                decr_wave = 31;
            else
                decr_wave = wave - 1;
        end
    endfunction
    
    // Define state transition logic
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            state <= STATE_IDLE;
            wave <= 0;
        end else begin
            case (state)
                STATE_IDLE: begin
                    if (wave == 31)
                        state <= STATE_GENERATING;
                end
                STATE_GENERATING: begin
                    if (wave == 0)
                        state <= STATE_IDLE;
                end
            endcase
            
            case (state)
                STATE_IDLE: begin
                    wave <= incr_wave(wave);
                end
                STATE_GENERATING: begin
                    wave <= decr_wave(wave);
                end
            endcase
        end
    end
    
    //END
endmodule