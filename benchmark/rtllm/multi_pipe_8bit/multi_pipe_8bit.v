 module multi_pipe_8bit (
	input clk,
	input rst_n,
	input mul_en_in,
	input [7:0] mul_a,
	input [7:0] mul_b,
	output reg mul_en_out,
	output reg [15:0] mul_out
);
	reg [7:0] mul_a_reg;
	reg [7:0] mul_b_reg;
	reg [15:0] sum;
	reg [15:0] mul_out_reg;
	reg [1:0] mul_en_out_reg;
	wire [15:0] temp;
	assign temp[0] = mul_a_reg[0] & mul_b_reg[0];
	assign temp[1] = mul_a_reg[0] & mul_b_reg[1];
	assign temp[2] = mul_a_reg[0] & mul_b_reg[2];
	assign temp[3] = mul_a_reg[0] & mul_b_reg[3];
	assign temp[4] = mul_a_reg[0] & mul_b_reg[4];
	assign temp[5] = mul_a_reg[0] & mul_b_reg[5];
	assign temp[6] = mul_a_reg[0] & mul_b_reg[6];
	assign temp[7] = mul_a_reg[0] & mul_b_reg[7];
	assign temp[8] = mul_a_reg[1] & mul_b_reg[0];
	assign temp[9] = mul_a_reg[1] & mul_b_reg[1];
	assign temp[10] = mul_a_reg[1] & mul_b_reg[2];
	assign temp[11] = mul_a_reg[1] & mul_b_reg[3];
	assign temp[12] = mul_a_reg[1] & mul_b_reg[4];
	assign temp[13] = mul_a_reg[1] & mul_b_reg[5];
	assign temp[14] = mul_a_reg[1] & mul_b_reg[6];
	assign temp[15] = mul_a_reg[1] & mul_b_reg[7];
	always @(posedge clk) begin
		if (rst_n == 1'b0) begin
			mul_en_out_reg <= 2'b00;
			mul_out_reg <= 16'd0;
		end
		else begin
			mul_en_out_reg <= {mul_en_out_reg[0], mul_en_in};
			mul_out_reg <= mul_out_reg + sum;
		end
	end
	always @(posedge clk) begin
		if (rst_n == 1'b0) begin
			mul_a_reg <= 8'd0;
			mul_b_reg <= 8'd0;
			mul_en_out <= 1'b0;
			mul_out <= 16'd0;
		end
		else begin
			mul_a_reg <= mul_a;
			mul_b_reg <= mul_b;
			mul_en_out <= mul_en_out_reg[1];
			mul_out <= (mul_en_out == 1'b1) ? mul_out_reg : 16'd0;
		end
	end
	always @(posedge clk) begin
		if (rst_n == 1'b0) begin
			sum <= 16'd0;
		end
		else begin
			sum <= temp + sum;
		end
	end
endmodule