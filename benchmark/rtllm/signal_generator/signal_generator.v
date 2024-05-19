

module signal_generator(
    input clk,
    input rst_n,
    output [4:0] wave
    );
    
    reg [4:0] wave_out;
    reg [1:0] state;
    
    always @(posedge clk) begin
        if(!rst_n) begin
            wave_out <= 5'b0;
            state <= 2'b0;
        end
        else begin
            case(state)
            0: begin
                if(wave_out != 31) begin
                    wave_out <= wave_out + 1;
                    state <= 1;
                end
                else begin
                    state <= 0;
                end
            end
            1: begin
                if(wave_out != 0) begin
                    wave_out <= wave_out - 1;
                    state <= 0;
                end
                else begin
                    state <= 1;
                end
            end
            default: begin
                state <= 0;
            end
            endcase
        end
    end
    
    assign wave = wave_out;
    
endmodule