

module synchronizer(
	clk_a,
	clk_b,
	arstn,
	brstn,
	data_in,
	data_en,
	dataout
);

	// Input ports
	input clk_a;
	input clk_b;
	input arstn;
	input brstn;
	input [3:0] data_in;
	input data_en;

	// Output ports
	output [3:0] dataout;

	// Internal variables
	reg [3:0] data_reg;
	reg en_data_reg;
	reg en_clap_one;
	reg en_clap_two;

	// Data Register
	always @(posedge clk_a or negedge arstn) begin
		if (~arstn) begin
			data_reg <= 0;
		end else if (~en_data_reg) begin
			data_reg <= data_in;
		end
	end

	// Enable Data Register
	always @(posedge clk_a or negedge arstn) begin
		if (~arstn) begin
			en_data_reg <= 0;
		end else if (~en_data_reg) begin
			en_data_reg <= data_en;
		end
	end

	// Enable Control Registers
	always @(posedge clk_b or negedge brstn) begin
		if (~brstn) begin
			en_clap_one <= 0;
			en_clap_two <= 0;
		end else if (~brstn) begin
			en_clap_one <= en_data_reg;
			en_clap_two <= en_clap_one;
		end
	end

	// Output Assignment
	always @(posedge clk_b or negedge brstn) begin
		if (~brstn) begin
			dataout <= 0;
		end else if (~brstn) begin
			if (~en_clap_two) begin
				dataout <= data_reg;
			end
		end
	end

	//END
endmodule