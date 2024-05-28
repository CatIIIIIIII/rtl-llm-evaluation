
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
	always @(posedge clk_a or negedge arstn)
	begin
		if(!arstn)
			data_reg <= 4'd0;
		else
			data_reg <= data_in;
	end
	always @(posedge clk_a or negedge arstn)
	begin
		if(!arstn)
			en_data_reg <= 1'b0;
		else
			en_data_reg <= data_en;
	end
	always @(posedge clk_b or negedge brstn)
	begin
		if(!brstn)
		begin
			en_clap_one <= 1'b0;
			en_clap_two <= 1'b0;
		end
		else
		begin
			en_clap_one <= en_data_reg;
			en_clap_two <= en_clap_one;
		end
	end
	assign dataout = en_clap_two ? data_reg : dataout;
endmodule