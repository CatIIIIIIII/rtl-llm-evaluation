
module div_16bit(
	input [15:0] A,
	input [7:0] B,
	output reg [15:0] result,
	output reg [15:0] odd
);
	reg [15:0] a_reg;
	reg [7:0] b_reg;
	always @(*) begin
		a_reg = A;
		b_reg = B;
	end
	always @(*) begin
		result = 0;
		odd = 0;
		if (a_reg[15:8] >= b_reg) begin
			result[15:8] = a_reg[15:8] - b_reg;
			odd[15:8] = 1;
		end else begin
			result[15:8] = a_reg[15:8];
		end
		if (a_reg[7:0] >= b_reg) begin
			result[7:0] = a_reg[7:0] - b_reg;
			odd[7:0] = 1;
		end else begin
			result[7:0] = a_reg[7:0];
		end
	end
endmodule