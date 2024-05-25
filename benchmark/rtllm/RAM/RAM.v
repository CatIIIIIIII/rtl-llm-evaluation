

module RAM(
	clk,
	rst_n,
	write_en,
	write_addr,
	write_data,
	read_en,
	read_addr,
	read_data
);

parameter WIDTH = 6;
parameter DEPTH = 8;

input clk;
input rst_n;
input write_en;
input [WIDTH-1:0] write_addr;
input [WIDTH-1:0] write_data;
input read_en;
input [WIDTH-1:0] read_addr;
output reg [WIDTH-1:0] read_data;

reg [WIDTH-1:0] RAM [DEPTH-1:0];

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		RAM[0] <= 0;
		RAM[1] <= 0;
		RAM[2] <= 0;
		RAM[3] <= 0;
		RAM[4] <= 0;
		RAM[5] <= 0;
		RAM[6] <= 0;
		RAM[7] <= 0;
	end
	else begin
		if (write_en) begin
			RAM[write_addr] <= write_data;
		end
	end
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		read_data <= 0;
	end
	else begin
		if (read_en) begin
			read_data <= RAM[read_addr];
		end
		else begin
			read_data <= 0;
		end
	end
end

endmodule

//END