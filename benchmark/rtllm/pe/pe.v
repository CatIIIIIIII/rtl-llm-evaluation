 module pe(
	input clk,
	input rst,
	input [31:0] a,
	input [31:0] b,
	output reg [31:0] c
);
	reg [31:0] product;
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			c <= 0;
		end else begin
			c <= c + product;
		end
	end
	always @(a or b) begin
		product = a * b;
	end
endmodule