
module radix2_div(
	input clk,
	input rst,
	input sign,
	input [7:0] dividend,
	input [7:0] divisor,
	input opn_valid,
	output reg res_valid,
	output reg [15:0] result
	);
	reg [7:0] NEG_DIVISOR;
	reg [7:0] SR;
	reg [2:0] cnt;
	reg start_cnt;
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			res_valid <= 0;
			result <= 0;
			cnt <= 0;
			start_cnt <= 0;
		end else begin
			if(opn_valid && !res_valid) begin
				if(sign) begin
					NEG_DIVISOR <= ~divisor + 1;
					SR <= ~dividend + 1;
				end else begin
					NEG_DIVISOR <= ~divisor;
					SR <= ~dividend;
				end
				cnt <= 1;
				start_cnt <= 1;
			end else if(res_valid && !opn_valid) begin
				res_valid <= 0;
				cnt <= 0;
				start_cnt <= 0;
			end else if(res_valid && !res_ready) begin
				if(cnt == 8) begin
					res_valid <= 0;
					cnt <= 0;
					start_cnt <= 0;
				end else begin
					if(SR[7]) begin
						SR <= {SR[6:0], 1'b0};
						result[cnt] <= 1;
					end else begin
						SR <= {SR[6:0], 1'b1};
						result[cnt] <= 0;
					end
					cnt <= cnt + 1;
				end
			end
		end
	end
	assign res_ready = (cnt == 8) ? 1 : 0;
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			res_valid <= 0;
		end else begin
			if(start_cnt) begin
				res_valid <= 1;
			end else if(res_ready && res_valid) begin
				res_valid <= 0;
			end
		end
	end
endmodule