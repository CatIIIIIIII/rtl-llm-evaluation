
module accu(clk, rst_n, data_in, valid_in, valid_out, data_out);
	input clk, rst_n, valid_in;
	input [7:0] data_in;
	output valid_out;
	output [9:0] data_out;
	
	reg [9:0] data_out;
	reg valid_out;
	reg [2:0] count;
	
	always @(posedge clk or negedge rst_n) begin
		if (~rst_n) begin
			data_out <= 10'b0;
			valid_out <= 1'b0;
			count <= 3'b0;
		end else begin
			if (valid_in) begin
				data_out <= data_out + data_in;
				count <= count + 1;
				if (count == 3'b111) begin
					valid_out <= 1'b1;
				end
			end else begin
				valid_out <= 1'b0;
			end
		end
	end
endmodule
//END