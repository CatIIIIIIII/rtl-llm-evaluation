 module RAM (
			clk,
			rst_n,
			write_en,
			write_addr,
			write_data,
			read_en,
			read_addr,
			read_data
);
//	parameter WIDTH = 6;
//	parameter DEPTH = 8;
	input clk;
	input rst_n;
	input write_en;
	input [WIDTH-1:0] write_addr;
	input [WIDTH-1:0] write_data;
	input read_en;
	input [WIDTH-1:0] read_addr;
	output [WIDTH-1:0] read_data;
	reg [WIDTH-1:0] RAM [2**WIDTH-1:0];
	reg [WIDTH-1:0] read_data;
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			RAM[0] <= 0;
			RAM[1] <= 0;
			RAM[2] <= 0;
			RAM[3] <= 0;
			RAM[4] <= 0;
			RAM[5] <= 0;
			RAM[6] <= 0;
			RAM[7] <= 0;
			RAM[8] <= 0;
			RAM[9] <= 0;
			RAM[10] <= 0;
			RAM[11] <= 0;
			RAM[12] <= 0;
			RAM[13] <= 0;
			RAM[14] <= 0;
			RAM[15] <= 0;
			RAM[16] <= 0;
			RAM[17] <= 0;
			RAM[18] <= 0;
			RAM[19] <= 0;
			RAM[20] <= 0;
			RAM[21] <= 0;
			RAM[22] <= 0;
			RAM[23] <= 0;
			RAM[24] <= 0;
			RAM[25] <= 0;
			RAM[26] <= 0;
			RAM[27] <= 0;
			RAM[28] <= 0;
			RAM[29] <= 0;
			RAM[30] <= 0;
			RAM[31] <= 0;
			RAM[32] <= 0;
			RAM[33] <= 0;
			RAM[34] <= 0;
			RAM[35] <= 0;
			RAM[36] <= 0;
			RAM[37] <= 0;
			RAM[38] <= 0;
			RAM[39] <= 0;
			RAM[40] <= 0;
			RAM[41] <= 0;
			RAM[42] <= 0;
			RAM[43] <= 0;
			RAM[44] <= 0;
			RAM[45] <= 0;
			RAM[46] <= 0;
			RAM[47] <= 0;
			RAM[48] <= 0;
			RAM[49] <= 0;
			RAM[50] <= 0;
			RAM[51] <= 0;
			RAM[52] <= 0;
			RAM[53] <= 0;
			RAM[54] <= 0;
			RAM[55] <= 0;
			RAM[56] <= 0;
			RAM[57] <= 0;
			RAM[58] <= 0;
			RAM[59] <= 0;
			RAM[60] <= 0;
			RAM[61] <= 0;
			RAM[62] <= 0;
			RAM[63] <= 0;
			RAM[64] <= 0;
			RAM[65] <= 0;
			RAM[66] <= 0;
			RAM[67] <= 0;
			RAM[68] <= 0;
			RAM[69] <= 0;
			RAM[70] <= 0;
			RAM[71] <= 0;
			RAM[72] <= 0;
			RAM[73] <= 0;
			RAM[74] <= 0;
			RAM[75] <= 0;
			RAM[76] <= 0;
			RAM[77] <= 0;
			RAM[78] <= 0;
			RAM[79] <= 0;
			RAM[80] <= 0;
			RAM[81] <= 0;
			RAM[82] <= 0;
			RAM[83] <= 0;
			RAM[84] <= 0;
			RAM[85] <= 0;
			RAM[86] <= 0;
			RAM[87] <= 0;
			RAM[88] <= 0;
			RAM[89] <= 0;
			RAM[90] <= 0;
			RAM[91] <= 0;
			RAM[92] <= 0;
	