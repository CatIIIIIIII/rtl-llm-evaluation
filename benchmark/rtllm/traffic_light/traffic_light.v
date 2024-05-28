
// ====================================================================================
// 										  Define Module
// ====================================================================================
module traffic_light(
	input rst_n,
	input clk,
	input pass_request,
	output reg [7:0] clock,
	output reg red,
	output reg yellow,
	output reg green
);
	parameter idle = 2'b00;
	parameter s1_red = 2'b01;
	parameter s2_yellow = 2'b10;
	parameter s3_green = 2'b11;
	reg [1:0] state;
	reg [1:0] nextState;
	reg [7:0] cnt;
	reg p_red, p_yellow, p_green;
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			state <= idle;
		end
		else begin
			state <= nextState;
		end
	end
	always @(state or pass_request or cnt) begin
		nextState = state;
		case(state)
			idle:
				nextState = s1_red;
			s1_red:
				if(cnt == 3)
					nextState = s2_yellow;
				else
					nextState = s1_red;
			s2_yellow:
				if(cnt == 3)
					nextState = s3_green;
				else
					nextState = s2_yellow;
			s3_green:
				if(cnt == 3)
					nextState = s2_yellow;
				else
					nextState = s3_green;
			default:
				nextState = idle;
		endcase
	end
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			cnt <= 8'd10;
		end
		else begin
			if(pass_request && green)
				cnt <= 8'd10;
			else if(green && !p_green)
				cnt <= 8'd60;
			else if(yellow && !p_yellow)
				cnt <= 8'd5;
			else if(red && !p_red)
				cnt <= 8'd10;
			else
				cnt <= cnt - 1;
		end
	end
	assign clock = cnt;
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			p_red <= 1'b0;
			p_yellow <= 1'b0;
			p_green <= 1'b0;
		end
		else begin
			p_red <= red;
			p_yellow <= yellow;
			p_green <= green;
		end
	end
	always @(state or cnt) begin
		red <= 1'b0;
		yellow <= 1'b0;
		green <= 1'b0;
		case(state)
			idle:
				begin
					red <= 1'b1;
					green <= 1'b0;
					yellow <= 1'b0;
				end
			s1_red:
				begin
					red <= 1'b1;
					green <= 1'b0;
					yellow <= 1'b0;
				end
			s2_yellow:
				begin
					red <= 1'b0;
					green <= 1'b0;
					yellow <= 1'b1;
				end
			s3_green:
				begin
					red <= 1'b0;
					green <= 1'b1;
					yellow <= 1'b0;
				end
			default:
				begin
					red <= 1'b0;
					green <= 1'b0;
					yellow <= 1'b0;
				end
		endcase
	end
endmodule