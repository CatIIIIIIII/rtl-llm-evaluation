
module width_8to16
(
	input 						clk,
	input 						rst_n,
	input 						valid_in,
	input 						data_in,
	output 						valid_out,
	output 						data_out
);
	reg 							data_lock;
	reg 							flag;
	reg 							valid_out;
	reg 							data_out;
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			data_lock 	<= 0;
			flag 			<= 0;
			valid_out 	<= 0;
			data_out 		<= 0;
		end
		else begin
			if(valid_in) begin
				if(flag == 0) begin
					data_lock 	<= data_in;
					flag 			<= 1;
				end
				else begin
					data_lock 	<= data_in;
					flag 			<= 0;
					valid_out 	<= 1;
					data_out 		<= {data_lock, data_in};
				end
			end
			else begin
				valid_out 	<= 0;
				data_out 		<= 0;
			end
		end
	end
endmodule