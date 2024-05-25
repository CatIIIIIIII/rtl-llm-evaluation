

module serial2parallel(
	input clk,
	input rst_n,
	input din_serial,
	input din_valid,
	output reg [7:0] dout_parallel,
	output reg dout_valid
);

	// Define a 4-bit counter to keep track of the number of serial input data bits received.
	reg [3:0] cnt;
	
	// Define a 4-bit register to keep track of the serial input data bits received.
	reg [3:0] din_reg;
	
	always @(posedge clk or negedge rst_n) begin
		if (~rst_n) begin
			cnt <= 0;
			din_reg <= 0;
			dout_valid <= 0;
		end else begin
			if (din_valid) begin
				din_reg <= {din_reg[2:0], din_serial};
				cnt <= cnt + 1;
				if (cnt == 4'b1111) begin
					dout_parallel <= {din_reg[2:0], din_serial};
					dout_valid <= 1;
				end
			end else begin
				cnt <= 0;
				din_reg <= 0;
				dout_valid <= 0;
			end
		end
	end
	
endmodule

//END