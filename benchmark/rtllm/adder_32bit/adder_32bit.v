 module adder_32bit(
	input [32:1] A,
	input [32:1] B,
	output [32:1] S,
	output C32
);
	assign {C32, S[32:1]} = A[32:1] + B[32:1];
endmodule