

module asyn_fifo #(parameter DEPTH = 16, parameter WIDTH = 8)
(
	input wclk,
	input rclk,
	input wrstn,
	input rrstn,
	input winc,
	input rinc,
	input [WIDTH-1:0] wdata,
	output reg wfull,
	output reg rempty,
	output reg [WIDTH-1:0] rdata
);

// BEGIN

// Define constants
localparam PTR_WIDTH = $clog2(DEPTH);

// Define dual-port RAM
reg [WIDTH-1:0] RAM_MEM [DEPTH-1:0];

// Define dual-port RAM interface
reg [PTR_WIDTH-1:0] waddr;
reg [PTR_WIDTH-1:0] raddr;
reg wenc;
reg renc;
reg [WIDTH-1:0] wdata;
reg [WIDTH-1:0] rdata;

// Define write pointer
reg [PTR_WIDTH-1:0] wptr;
reg [PTR_WIDTH-1:0] wptr_buff;
reg wptr_syn;

// Define read pointer
reg [PTR_WIDTH-1:0] rptr;
reg [PTR_WIDTH-1:0] rptr_buff;
reg rptr_syn;

// Define full and empty signals
reg wfull;
reg rempty;

// Define helper functions
function [PTR_WIDTH-1:0] bin2gray;
	input [PTR_WIDTH-1:0] bin;
	begin
		bin2gray = bin ^ {1'b0, bin[PTR_WIDTH-1:1]};
	end
endfunction

function [PTR_WIDTH-1:0] gray2bin;
	input [PTR_WIDTH-1:0] gray;
	integer i;
	begin
		for (i=0; i<PTR_WIDTH; i=i+1)
			if (i==0)
				gray2bin[i] = gray[i];
			else
				gray2bin[i] = gray[i] ^ gray2bin[i-1];
	end
endfunction

// Instantiate dual-port RAM
dual_port_RAM #(
	.DEPTH(DEPTH),
	.WIDTH(WIDTH)
) dual_port_RAM_inst (
	.wclk(wclk),
	.waddr(waddr),
	.wdata(wdata),
	.wenc(wenc),
	.rclk(rclk),
	.raddr(raddr),
	.rdata(rdata),
	.renc(renc)
);
