 module adder_16bit(a, b, Cin, y, Co);
	input [15:0] a, b;
	input Cin;
	output [15:0] y;
	output Co;
	assign y = a + b + Cin;
	assign Co = (a[15:0] + b[15:0] + Cin > 16'hffff);
endmodule