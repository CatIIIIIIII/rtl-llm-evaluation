
 module JC_counter(
    input clk,
    input rst_n,
    output reg [63:0] Q
    );
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            Q <= 64'b0;
        else if (!Q[0])
            Q <= {Q[63:1], 1'b1};
        else
            Q <= {Q[63:1], 1'b0};
    end
endmodule