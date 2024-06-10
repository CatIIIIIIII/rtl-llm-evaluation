 module multi_16bit(
	input clk,
	input rst_n,
	input start,
	input [15:0] ain,
	input [15:0] bin,
	output [31:0] yout,
	output done
);
	reg [31:0] yout_r;
	reg [31:0] breg;
	reg [31:0] areg;
	reg [4:0] i;
	reg done_r;
	assign yout = yout_r;
	assign done = done_r;
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			i <= 0;
		end else begin
			if (start && i < 17) begin
				i <= i + 1;
			end else begin
				i <= 0;
			end
		end
	end
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			done_r <= 0;
		end else begin
			if (i == 16) begin
				done_r <= 1;
			end else if (i == 17) begin
				done_r <= 0;
			end
		end
	end
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			areg <= 0;
			breg <= 0;
			yout_r <= 0;
		end else begin
			if (start) begin
				areg <= ain;
				breg <= bin;
				yout_r <= 0;
			end else begin
				if (i == 0) begin
					areg <= ain;
					breg <= bin;
				end else if (i > 0 && i < 17) begin
					if (areg[i-1]) begin
						yout_r <= yout_r + breg;
					end
					breg <= breg << 1;
				end
			end
		end
	end
endmodule