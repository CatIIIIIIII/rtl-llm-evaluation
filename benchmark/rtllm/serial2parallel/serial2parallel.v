 module serial2parallel(
	input clk,
	input rst_n,
	input din_serial,
	input din_valid,
	output reg [7:0] dout_parallel,
	output reg dout_valid
);
	reg [3:0] cnt;
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			cnt <= 4'd0;
			dout_parallel <= 8'd0;
			dout_valid <= 1'b0;
		end
		else begin
			if(din_valid) begin
				cnt <= cnt + 1'b1;
				case(cnt)
					4'd0: dout_parallel[7:0] <= {din_serial, dout_parallel[7:1]};
					4'd1: dout_parallel[7:0] <= {din_serial, dout_parallel[7:1]};
					4'd2: dout_parallel[7:0] <= {din_serial, dout_parallel[7:1]};
					4'd3: dout_parallel[7:0] <= {din_serial, dout_parallel[7:1]};
					4'd4: dout_parallel[7:0] <= {din_serial, dout_parallel[7:1]};
					4'd5: dout_parallel[7:0] <= {din_serial, dout_parallel[7:1]};
					4'd6: dout_parallel[7:0] <= {din_serial, dout_parallel[7:1]};
					4'd7: dout_parallel[7:0] <= {din_serial, dout_parallel[7:1]};
					default: dout_parallel[7:0] <= {din_serial, dout_parallel[7:1]};
				endcase
				if(cnt == 4'd7)
					dout_valid <= 1'b1;
				else
					dout_valid <= 1'b0;
			end
			else begin
				cnt <= 4'd0;
				dout_parallel <= 8'd0;
				dout_valid <= 1'b0;
			end
		end
	end
endmodule