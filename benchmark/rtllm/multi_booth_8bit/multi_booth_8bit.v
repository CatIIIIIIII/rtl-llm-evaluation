 module multi_booth_8bit(
	input clk,
	input reset,
	input [7:0] a,
	input [7:0] b,
	output reg [15:0] p,
	output reg rdy
);
	reg [4:0] ctr;
	reg [15:0] multiplier, multiplicand;
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			multiplier <= {{8{a[7]}}, a};
			multiplicand <= {{8{b[7]}}, b};
		end else begin
			if (ctr < 16) begin
				multiplicand <= multiplicand << 1;
				if (multiplier[ctr]) begin
					p <= p + multiplicand;
				end
				ctr <= ctr + 1;
			end else begin
				rdy <= 1;
			end
		end
	end
endmodule