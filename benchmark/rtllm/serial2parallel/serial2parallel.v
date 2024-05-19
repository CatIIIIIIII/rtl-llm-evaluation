

module serial2parallel(
	input wire clk,
	input wire rst_n,
	input wire din_valid,
	input wire [3:0] din_serial,
	
	output reg [3:0] dout_parallel,
	output reg dout_valid
    );
    
    reg [3:0] din_buffer;
    reg [2:0] cnt;
    
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            dout_valid <= 0;
            dout_parallel <= 0;
            din_buffer <= 0;
            cnt <= 0;
        end
        else
        begin
            if (din_valid)
                din_buffer <= {din_buffer[2:0], din_serial};
            else
                din_buffer <= 0;
            
            if (cnt == 4'b1111)
            begin
                dout_valid <= 1;
                dout_parallel <= din_buffer;
            end
            else
            begin
                if (din_valid)
                begin
                    dout_valid <= 0;
                    dout_parallel <= 0;
                    cnt <= cnt + 1;
                end
                else
                begin
                    dout_valid <= 0;
                    dout_parallel <= dout_parallel;
                    cnt <= cnt;
                end
            end
        end
    end
    
endmodule


// Please paste the following into the simulator of your choice to test your code.
// I use Xilinx ISE Simulation here.
/*
module serial2parallel_testbench;

// Declare inputs.
reg clk;
reg rst_n;
reg [3:0] din_serial;
reg din_valid;

// Declare outputs.
wire [3:0] dout_parallel;
wire dout_valid;

// Instantiate the Unit Under Test (UUT).
serial2parallel uut (
	.clk(clk),
	.rst_n(rst_n),
	.din_valid(din_valid),
	.din_serial(din_serial),
	.dout_parallel(dout_parallel),
	.dout_valid(dout_valid)
);

// Stimulus.
initial begin
	// Initialize inputs.
	clk = 0;
	rst_n = 0;
	din_valid = 0;
	din_serial = 0;
	
	// Wait 100 ns for global reset to finish.
	rst_n = 1;
	
	// Add stimulus here.
	din_valid = 1;
	din_serial = 4'b0001;
	din_valid = 1;
	din_serial = 4'b0010;
	din_valid = 1;
	din_serial = 4'b0100;
	din_valid = 1;
	din_serial = 4'b1000;
	din_valid = 0;
	din_serial = 4'b0000;
	din_valid = 1;
	din_serial = 4'b0001;
	din_valid = 1;
	din_serial = 4'b0010;
	din_valid = 1;
	din_serial = 4'b0100;
	din_valid = 1;
	din_serial = 4'b1000;
	din_valid = 0;
	din_serial = 4'b0000;
	din_valid = 0;
	din_serial = 4'b0001;
	din_valid = 0;
	din_serial = 4'b0010;
	din_valid = 0;
	din_serial = 4'b0100;
	din_valid = 0;
	din_serial = 4'b1000;
	din_valid = 1;
	din_serial = 4'b0001;
	din_valid = 1;
	din_serial = 4'b0010;
	din_valid = 1;
	din_serial = 4'b0100;
	din_valid = 1;
	din_serial = 4'b1000;
	din_valid = 0;
	din_serial = 4'b0000;
	din_valid = 0;
	din_serial = 4'b0001;
	din_valid = 0;
	din_serial = 4'b0010;
	din_valid = 0;
	din_serial = 4'b0100;
	din_valid = 0;
	din_serial = 4'b1000;
	din_valid = 1;
	din_serial = 4'b0001;
	din_valid = 1;
	din_serial = 4'b0010;
	din_valid = 1;
	din_serial = 4'b0100;
	din_valid = 1;
	din_serial = 4'b1000;
	din_valid = 0;
	din_serial = 4'b0000;
	din_valid = 0;
	din_serial = 4'b0001;
	din_valid = 0;
	din_serial = 4'b0010;
	din_valid = 0;
	din_serial = 4'b0100;
	din_valid = 0;
	din_serial = 4'b1000;
	din_valid = 1;
	din_serial = 4'b0001;
	din_valid = 1;
	din_serial = 4'b0010;
	din_valid = 1;
	din_serial = 4'b0100;
	din_valid = 1;
	din_serial = 4'b1000;
	din_valid = 0;
	din_serial = 4'b0000;
	din_valid = 0;
	din_serial = 4'b0001;
	din_valid = 0;
	din_serial = 4'b0010;
	din_valid = 0;
	din_serial = 4'b0100;
	din_valid = 0;
	din_serial = 4'b1000;
	din_valid = 1;
	din_serial = 4'b0001;
	din_valid = 1;
	din_serial = 4'b0010;
	din_valid = 1;
	din_serial = 4'b0100;
	din_valid = 1;
	din_serial = 4'b1000;
	din_valid = 0;
	din_serial = 4'b0000;
	din_valid = 0;
	din_serial = 4'b0001;
	din_valid = 0;
	din_serial = 4'b0010;
	din_valid = 0;
	din_serial = 4'b0100;
	din_valid = 0;
	din_serial = 4'b1000;
	din_valid = 1;
	din_serial = 4'b0001;
	din_valid = 1;
	din_serial = 4'b0010;
	din_valid = 1;
	din_serial = 4'b0100;
	din_valid = 1;
	din_serial = 4'b1000;
	din_valid = 0;
	din_serial = 4'b0000;
	din_valid = 0;
	din_serial = 4'b0001;
	din_valid = 0;
	din_serial = 4'b0010;
	din_valid = 0;
	din_serial = 4'b0100;
	din_valid = 0;
	din_serial = 4'b1000;
	din_valid = 1;
	din_serial = 4'b0001;
	din_valid = 1;
	din_serial = 4'b0010;
	din_valid = 1;
	din_serial = 4'b0100;
	din_valid = 1;
	din_serial = 4'b1000;
	din_valid = 0;
	din_serial = 4'b0000;
	din_valid = 0;
	din_serial = 4'b0001;
	din_valid = 0;
	din_serial = 4'b0010;
	din_valid = 0;
	din_serial = 4'b0100;
	din_valid = 0;
	din_serial = 4'b1000;
	din_valid = 1;
	din_serial = 4'b0001;
	din_valid = 1;
	din_serial = 4'b0010;
	din_valid = 1;
	din_serial = 4'b0100;
	din_valid = 1;
	din_serial = 4'b1000;
	din_valid = 0;
	din_serial = 4'b0000;
	din_valid = 0;
	din_serial = 4'b0001;
	din_valid = 0;
	din_serial = 4'b0010;
	din_valid = 0;
	din_serial = 4'b0100;
	din_valid = 0;
	din_serial = 4'b1000;
	din_valid = 1;
	din_serial = 4'b0001;
	din_valid = 1;
	din_serial = 4'b0010;
	din_valid = 1;
	din_serial = 4'b0100;
	din_valid = 1;
	din_serial = 4'b1000;
	din_valid = 0;
	din_serial = 4'b0000;
	din_valid = 0;
	din_serial = 4'b0001;
	din_valid = 0;
	din_serial = 4'b0010;
	din_valid = 0;
	din_serial = 4'b0100;
	din_valid = 0;
	din_serial = 4'b1000;
	din_valid = 1;
	din_serial = 4'b0001;
	din_valid = 1;
	din_serial = 4'b0010;
	din_valid = 1;
	din_serial = 4'b0100;
	din_valid = 1;
	din_serial = 4'b1000;
	din_valid = 0;
	din_serial = 4'b0000;
	din_valid = 0;
	din_serial = 4'b0001;
	din_valid = 0;
	din_serial = 4'b0010;
	din_valid = 0;
	din_serial = 4'b0100;
	din_valid = 0;
	din_serial = 4'b1000;
	din_valid = 1;
	din_serial = 4'b0001;
	din_valid = 1;
	din_serial = 4'b0010;
	din_valid = 1;
	din_serial = 4'b0100;
	din_valid = 1;
	din_serial = 4'b1000;
	din_valid = 0;
