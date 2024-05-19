

module synchronizer(
	input clk_a,
	input clk_b,
	input arstn,
	input brstn,
	input [3:0] data_in,
	input data_en,
	output [3:0] dataout
);

	reg [3:0] data_reg;
	reg en_data_reg;
	reg en_clap_one;
	reg en_clap_two;

	always @(posedge clk_a or negedge arstn) begin
		if(!arstn) begin
			data_reg <= 0;
			en_data_reg <= 0;
		end
		else begin
			if(en_data_reg) begin
				data_reg <= data_in;
			end
			en_data_reg <= data_en;
		end
	end

	always @(posedge clk_b or negedge brstn) begin
		if(!brstn) begin
			en_clap_one <= 0;
			en_clap_two <= 0;
		end
		else begin
			en_clap_one <= en_data_reg;
			en_clap_two <= en_clap_one;
		end
	end

	always @(posedge clk_b or negedge brstn) begin
		if(!brstn) begin
			dataout <= 0;
		end
		else begin
			if(en_clap_two) begin
				dataout <= data_reg;
			end
		end
	end

endmodule

// Please paste the declaration of the top-level module here.
module synchronizer_top(
	input clk_a,
	input clk_b,
	input arstn,
	input brstn,
	input [3:0] data_in,
	input data_en,
	output [3:0] dataout
);

	synchronizer syn_1(
		.clk_a(clk_a),
		.clk_b(clk_b),
		.arstn(arstn),
		.brstn(brstn),
		.data_in(data_in),
		.data_en(data_en),
		.dataout(dataout)
	);

endmodule

// Please paste the test bench code here.
module synchronizer_top_tb();
	// Inputs
	reg clk_a;
	reg clk_b;
	reg arstn;
	reg brstn;
	reg [3:0] data_in;
	reg data_en;

	// Outputs
	wire [3:0] dataout;

	// Instantiate the Unit Under Test (UUT)
	synchronizer_top uut(
		.clk_a(clk_a),
		.clk_b(clk_b),
		.arstn(arstn),
		.brstn(brstn),
		.data_in(data_in),
		.data_en(data_en),
		.dataout(dataout)
	);

	initial begin
		// Initialize Inputs
		clk_a = 0;
		clk_b = 0;
		arstn = 0;
		brstn = 0;
		data_in = 0;
		data_en = 0;

		// Wait 100 ns for global reset to finish
        /*
		data_in = 4'b1010;
		data_en = 1;
		data_in = 4'b0101;
		data_en = 1;
		data_in = 4'b0010;
		data_en = 1;
		data_in = 4'b1101;
		data_en = 1;
		data_in = 4'b0110;
		data_en = 1;
		data_in = 4'b1011;
		data_en = 1;
		data_in = 4'b0100;
		data_en = 1;
		data_in = 4'b0001;
		data_en = 1;
		data_in = 4'b1110;
		data_en = 1;
		data_in = 4'b0111;
		data_en = 1;
		data_in = 4'b1000;
		data_en = 1;
		data_in = 4'b0101;
		data_en = 1;
		data_in = 4'b0010;
		data_en = 1;
		data_in = 4'b1101;
		data_en = 1;
		data_in = 4'b0110;
		data_en = 1;
		data_in = 4'b1011;
		data_en = 1;
		data_in = 4'b0100;
		data_en = 1;
		data_in = 4'b0001;
		data_en = 1;
		data_in = 4'b1110;
		data_en = 1;
		data_in = 4'b0111;
		data_en = 1;
		data_in = 4'b1000;
		data_en = 1;
        */
		data_in = 4'b1010;
		data_en = 0;
		data_in = 4'b0101;
		data_en = 0;
		data_in = 4'b0010;
		data_en = 0;
		data_in = 4'b1101;
		data_en = 0;
		data_in = 4'b0110;
		data_en = 0;
		data_in = 4'b1011;
		data_en = 0;
		data_in = 4'b0100;
		data_en = 0;
		data_in = 4'b0001;
		data_en = 0;
		data_in = 4'b1110;
		data_en = 0;
		data_in = 4'b0111;
		data_en = 0;
		data_in = 4'b1000;
		data_en = 0;
		// data_in = 4'b1010;
		// data_en = 1;
		// #100000;
		// data_in = 4'b0101;
		// data_en = 1;
		// #100000;
		// data_in = 4'b0010;
		// data_en = 1;
		// #100000;
		// data_in = 4'b1101;
		// data_en = 1;
		// #100000;
		// data_in = 4'b0110;
		// data_en = 1;
		// #100000;
		// data_in = 4'b1011;
		// data_en = 1;
		// #100000;
		// data_in = 4'b0100;
		// data_en = 1;
		// #100000;
		// data_in = 4'b0001;
		// data_en = 1;
		// #100000;
		// data_in = 4'b1110;
		// data_en = 1;
		// #100000;
		// data_in = 4'b0111;
		// data_en = 1;
		// #100000;
		// data_in = 4'b1000;
		// data_en = 1;
		// #100000;
		// data_in = 4'b1010;
		// data_en = 0;
		// #100000;
		// data_in = 4'b0101;
		// data_en = 0;
		// #100000;
		// data_in = 4'b0010;
		// data_en = 0;
		// #100000;
		// data_in = 4'b1101;
		// data_en = 0;
		// #100000;
		// data_in = 4'b0110;
		// data_en = 0;
		// #100000;
		// data_in = 4'b1011;
		// data_en = 0;
		// #100000;
		// data_in = 4'b0100;
		// data_en = 0;
		// #100000;
		// data_in = 4'b0001;
		// data_en = 0;
		// #100000;
		// data_in = 4'b1110;
		// data_en = 0;
		// #100000;
		// data_in = 4'b0111;
		// data_en = 0;
		// #100000;
		// data_in = 4'b1000;
		// data_en = 0;
		// #100000;
		// data_in = 4'b1010;
		// data_en = 1;
		// #100000;
		// data_in = 4'b0101;
		// data_en = 1;
		// #100000;
		// data_in = 4'b0010;
		// data_en = 1;
		// #100000;
		// data_in = 4'b1101;
		// data_en =