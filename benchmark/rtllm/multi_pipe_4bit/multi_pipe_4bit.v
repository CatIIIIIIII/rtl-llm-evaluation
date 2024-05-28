 module multi_pipe_4bit(clk,rst_n,mul_a,mul_b,mul_out);
parameter size = 4;
input clk;
input rst_n;
input [size-1:0] mul_a;
input [size-1:0] mul_b;
output [size-1:0] mul_out;
reg [size-1:0] mul_out;
reg [size-1:0] partial_sum[size-1:0];
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		mul_out <= 0;
		partial_sum[0] <= 0;
		partial_sum[1] <= 0;
		partial_sum[2] <= 0;
		partial_sum[3] <= 0;
	end
	else
	begin
		mul_out <= partial_sum[size-1] + partial_sum[size-2] + partial_sum[size-3] + partial_sum[size-4];
		partial_sum[0] <= mul_a[0] ? mul_b : 0;
		partial_sum[1] <= mul_a[1] ? mul_b << 1 : 0;
		partial_sum[2] <= mul_a[2] ? mul_b << 2 : 0;
		partial_sum[3] <= mul_a[3] ? mul_b << 3 : 0;
	end
end
endmodule