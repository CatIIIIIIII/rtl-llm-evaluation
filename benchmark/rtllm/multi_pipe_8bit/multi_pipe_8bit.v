 module multi_pipe_8bit(
						clk,
						rst_n,
						mul_en_in,
						mul_a,
						mul_b,
						mul_en_out,
						mul_out
);
// ====================================================================================
// 										Port Declarations
// ====================================================================================
   input 						clk;
	input 						rst_n;
	input 						mul_en_in;
	input 			[7:0]	mul_a;
	input 			[7:0]	mul_b;
	output 						mul_en_out;
	output 		[15:0]	mul_out;
// ====================================================================================
// 							  Parameters, Registers, and Wires
// ====================================================================================
	reg 						mul_en_out_reg;
	reg 			[7:0]	mul_a_reg;
	reg 			[7:0]	mul_b_reg;
	wire 		[15:0]	temp;
	reg 			[15:0]	sum;
	reg 			[15:0]	mul_out_reg;
// ====================================================================================
// 							  			Implementation
// ====================================================================================
	//-------------------------------------------------
	// 							  Input Control
	//-------------------------------------------------
	always @(posedge clk)
		mul_en_out_reg <= mul_en_in;
	assign mul_en_out = mul_en_out_reg;
	//-------------------------------------------------
	// 							Input Registers
	//-------------------------------------------------
	always @(posedge clk)
		if (mul_en_in)
			mul_a_reg <= mul_a;
	always @(posedge clk)
		if (mul_en_in)
			mul_b_reg <= mul_b;
	//-------------------------------------------------
	// 							  Pipeline
	//-------------------------------------------------
	assign temp[0] = mul_a_reg[0] ? mul_b_reg : 0;
	assign temp[1] = mul_a_reg[1] ? mul_b_reg << 1 : 0;
	assign temp[2] = mul_a_reg[2] ? mul_b_reg << 2 : 0;
	assign temp[3] = mul_a_reg[3] ? mul_b_reg << 3 : 0;
	assign temp[4] = mul_a_reg[4] ? mul_b_reg << 4 : 0;
	assign temp[5] = mul_a_reg[5] ? mul_b_reg << 5 : 0;
	assign temp[6] = mul_a_reg[6] ? mul_b_reg << 6 : 0;
	assign temp[7] = mul_a_reg[7] ? mul_b_reg << 7 : 0;
	assign temp[8] = mul_a_reg[0] ? mul_b_reg << 8 : 0;
	assign temp[9] = mul_a_reg[1] ? mul_b_reg << 9 : 0;
	assign temp[10] = mul_a_reg[2] ? mul_b_reg << 10 : 0;
	assign temp[11] = mul_a_reg[3] ? mul_b_reg << 11 : 0;
	assign temp[12] = mul_a_reg[4] ? mul_b_reg << 12 : 0;
	assign temp[13] = mul_a_reg[5] ? mul_b_reg << 13 : 0;
	assign temp[14] = mul_a_reg[6] ? mul_b_reg << 14 : 0;
	assign temp[15] = mul_a_reg[7] ? mul_b_reg << 15 : 0;
	always @(posedge clk)
		sum <= temp[0] + temp[1] + temp[2] + temp[3] + temp[4] + temp[5] + temp[6] + temp[7] +
				temp[8] + temp[9] + temp[10] + temp[11] + temp[12] + temp[13] + temp[14] + temp[15];
	always @(posedge clk)
		mul_out_reg <= sum;
	assign mul_out = mul_en_out_reg ? mul_out_reg : 0;
endmodule