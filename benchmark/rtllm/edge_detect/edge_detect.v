
module edge_detect(clk, rst_n, a, rise, down);
    input clk, rst_n, a;
    output rise, down;

    reg rise, down;
    reg prev_a;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            rise <= 0;
            down <= 0;
            prev_a <= 0;
        end else begin
            if (a == 1 && prev_a == 0) begin
                rise <= 1;
            end else if (a == 0 && prev_a == 1) begin
                down <= 1;
            end else begin
                rise <= 0;
                down <= 0;
            end
            prev_a <= a;
        end
    end
endmodule
//END