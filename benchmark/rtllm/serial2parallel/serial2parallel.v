 module serial2parallel(
	input clk,
	input rst_n,
	input din_serial,
	input din_valid,
	output [7:0] dout_parallel,
	output dout_valid
);
	reg [3:0] cnt;
	reg [7:0] dout;
	reg dout_valid_tmp;
	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 0) begin
			cnt <= 0;
			dout <= 0;
			dout_valid_tmp <= 0;
		end else begin
			if (cnt == 4'd8) begin
				cnt <= 0;
			end else begin
				cnt <= cnt + 1'b1;
			end
			if (cnt == 4'd8) begin
				dout <= {din_serial, dout[7:1]};
			end
			if (cnt == 4'd8) begin
				dout_valid_tmp <= din_valid;
			end else begin
				dout_valid_tmp <= 0;
			end
		end
	end
	assign dout_parallel = dout;
	assign dout_valid = dout_valid_tmp;
endmodule