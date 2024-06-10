 module accu(
	input clk,
	input rst_n,
	input [7:0] data_in[3:0],
	input valid_in,
	output reg valid_out,
	output reg [9:0] data_out
);
	reg [9:0] data_in_r[3:0];
	reg [3:0] data_in_r_valid;
	reg [9:0] data_out_r;
	reg [3:0] data_out_r_valid;
	always @(posedge clk) begin
		if (rst_n == 1'b0) begin
			data_in_r <= 0;
			data_in_r_valid <= 0;
			data_out_r <= 0;
			data_out_r_valid <= 0;
		end else begin
			if (data_in_r_valid[0] == 1'b1) begin
				data_in_r[0] <= data_in[0];
			end
			if (data_in_r_valid[1] == 1'b1) begin
				data_in_r[1] <= data_in[1];
			end
			if (data_in_r_valid[2] == 1'b1) begin
				data_in_r[2] <= data_in[2];
			end
			if (data_in_r_valid[3] == 1'b1) begin
				data_in_r[3] <= data_in[3];
			end
			if (valid_in == 1'b1) begin
				data_in_r_valid <= data_in_r_valid + 1'b1;
			end
			if (data_out_r_valid == 1'b1) begin
				data_out_r <= data_out_r + 1'b1;
			end
			if (data_in_r_valid == 4'b1111) begin
				data_out_r_valid <= 1'b1;
			end else begin
				data_out_r_valid <= 1'b0;
			end
			if (data_out_r_valid == 1'b1) begin
				data_out <= data_out_r;
			end
			if (data_out_r_valid == 1'b1) begin
				valid_out <= 1'b1;
			end else begin
				valid_out <= 1'b0;
			end
		end
	end
endmodule