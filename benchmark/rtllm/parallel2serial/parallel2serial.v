 module parallel2serial(
	input clk,
	input rst_n,
	input [3:0] d,
	output valid_out,
	output dout
);
	reg [3:0] data;
	reg [2:0] cnt;
	reg valid;
	assign dout = data[3];
	assign valid_out = valid;
	always @(posedge clk) begin
		if (rst_n == 0) begin
			data <= 0;
			cnt <= 0;
			valid <= 0;
		end else begin
			if (cnt == 3) begin
				data <= d;
				cnt <= 0;
				valid <= 1;
			end else begin
				cnt <= cnt + 1;
				valid <= 0;
				data <= {data[2:0], data[3]};
			end
		end
	end
endmodule