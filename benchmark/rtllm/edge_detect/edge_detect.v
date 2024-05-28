 module edge_detect(
	input clk,
	input rst_n,
	input a,
	output rise,
	output down
);
	reg r_rise, r_down;
	always @(posedge clk) begin
		if (rst_n == 1'b0) begin
			r_rise <= 1'b0;
			r_down <= 1'b0;
		end
		else begin
			if (a == 1'b1 && r_rise == 1'b1)
				r_rise <= 1'b0;
			else if (a == 1'b1)
				r_rise <= 1'b1;
			if (a == 1'b0 && r_down == 1'b1)
				r_down <= 1'b0;
			else if (a == 1'b0)
				r_down <= 1'b1;
		end
	end
	assign rise = r_rise;
	assign down = r_down;
endmodule