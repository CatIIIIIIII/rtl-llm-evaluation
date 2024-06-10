 module width_8to16(
clk,
rst_n,
valid_in,
data_in,
valid_out,
data_out
);
input clk;
input rst_n;
input valid_in;
input [7:0] data_in;
output valid_out;
output [15:0] data_out;
reg valid_out;
reg [15:0] data_out;
reg [7:0] data_lock;
reg flag;
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		data_out <= 0;
	end
	else
	begin
		if(valid_in && flag)
		begin
			data_out <= {data_lock,data_in};
			valid_out <= 1;
			flag <= 0;
		end
		else if(valid_in && !flag)
		begin
			data_lock <= data_in;
			flag <= 1;
		end
		else if(!valid_in && flag)
		begin
			data_out <= {data_lock,data_in};
			valid_out <= 1;
			flag <= 0;
		end
		else
		begin
			data_out <= 0;
			valid_out <= 0;
		end
	end
end
endmodule