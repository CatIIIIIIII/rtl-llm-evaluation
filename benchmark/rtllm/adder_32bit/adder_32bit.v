 module adder_32bit(
	input [32:1] A,
	input [32:1] B,
	output [32:1] S,
	output C32
);
	assign S[1] = A[1] + B[1];
	assign S[2] = A[2] + B[2];
	assign S[3] = A[3] + B[3];
	assign S[4] = A[4] + B[4];
	assign S[5] = A[5] + B[5];
	assign S[6] = A[6] + B[6];
	assign S[7] = A[7] + B[7];
	assign S[8] = A[8] + B[8];
	assign S[9] = A[9] + B[9];
	assign S[10] = A[10] + B[10];
	assign S[11] = A[11] + B[11];
	assign S[12] = A[12] + B[12];
	assign S[13] = A[13] + B[13];
	assign S[14] = A[14] + B[14];
	assign S[15] = A[15] + B[15];
	assign S[16] = A[16] + B[16];
	assign S[17] = A[17] + B[17];
	assign S[18] = A[18] + B[18];
	assign S[19] = A[19] + B[19];
	assign S[20] = A[20] + B[20];
	assign S[21] = A[21] + B[21];
	assign S[22] = A[22] + B[22];
	assign S[23] = A[23] + B[23];
	assign S[24] = A[24] + B[24];
	assign S[25] = A[25] + B[25];
	assign S[26] = A[26] + B[26];
	assign S[27] = A[27] + B[27];
	assign S[28] = A[28] + B[28];
	assign S[29] = A[29] + B[29];
	assign S[30] = A[30] + B[30];
	assign S[31] = A[31] + B[31];
	assign S[32] = A[32] + B[32];
	assign C32 = S[32];
endmodule