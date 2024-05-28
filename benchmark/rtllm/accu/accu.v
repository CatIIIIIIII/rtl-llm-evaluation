 module accu(
	input clk,
	input rst_n,
	input [7:0] data_in,
	input valid_in,
	output reg valid_out,
	output reg [9:0] data_out
);
	reg [3:0] cnt;
	always @(posedge clk) begin
		if (~rst_n) begin
			cnt <= 0;
			data_out <= 0;
			valid_out <= 0;
		end else begin
			if (cnt == 4) begin
				cnt <= 0;
				data_out <= data_out + data_in;
				valid_out <= 1;
			end else begin
				cnt <= cnt + 1;
				data_out <= data_out + data_in;
				valid_out <= 0;
			end
		end
	end
endmodule