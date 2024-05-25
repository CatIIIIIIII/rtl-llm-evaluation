

module right_shifter(
    input clk,
    input d,
    output reg q
);

    // Define the register that will store the shifted value.
    reg [7:0] q;

    // Initialize the register to 0.
    initial q = 0;

    // Shift the register to the right by one bit.
    always @(posedge clk)
        q <= (q >> 1);

    // Assign the most significant bit of the register to the input signal.
    always @(posedge clk)
        q[7] <= d;

endmodule

//END