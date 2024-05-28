
module multi_16bit(
	input wire clk,
	input wire rst_n,
	input wire start,
	input wire [15:0] ain,
	input wire [15:0] bin,
	output reg [31:0] yout,
	output reg done_r
);
	reg [15:0] areg, breg;
	reg [31:0] yout_r;
	reg [3:0] i;
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			i <= 0;
			areg <= 0;
			breg <= 0;
			yout_r <= 0;
		end
		else begin
			i <= i + 1;
			if(start) begin
				if(i < 16) begin
					areg <= ain;
					breg <= bin;
					yout_r <= 0;
				end
				else if(i < 32) begin
					if(areg[i-1]) begin
						yout_r <= yout_r + breg;
					end
					else begin
						yout_r <= yout_r;
					end
				end
				else begin
					yout_r <= yout_r;
				end
			end
			else begin
				i <= 0;
				areg <= 0;
				breg <= 0;
				yout_r <= 0;
			end
		end
	end
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			done_r <= 0;
		end
		else begin
			if(i == 16) begin
				done_r <= 1;
			end
			else if(i == 17) begin
				done_r <= 0;
			end
		end
	end
	assign yout = yout_r;
endmodule