

module edge_detect(clk, rst_n, a, rise, down);

    // Inputs
    input     clk;
    input     rst_n;
    input     a;

    // Outputs
    output    rise;
    output    down;

    // Variables for edge detection
    reg       rise_edge;
    reg       down_edge;
    reg       a_q;

    // Detection
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rise_edge <= 0;
            down_edge <= 0;
            a_q <= 0;
        end
        else begin
            a_q <= a;
            if (a_q && !a)
                down_edge <= 1;
            else if (!a_q && a)
                rise_edge <= 1;
            else
                rise_edge <= 0;
                down_edge <= 0;
        end
    end

    // Synchronize the output signals to the clock
    always @(posedge clk) begin
        rise <= rise_edge;
        down <= down_edge;
    end

endmodule