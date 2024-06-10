 module right_shifter(
    input clk,
    input d,
    output reg q
);
    initial q <= 0;
    always @(posedge clk)
        q <= (q >> 1);
    always @(posedge clk)
        q[7] <= d;
endmodule