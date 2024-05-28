 module fsm(
	input IN,
	input CLK,
	input RST,
	output reg MATCH
);
	reg [2:0] state;
	reg [2:0] nextState;
	parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;
	always @(posedge CLK) begin
		if(RST) begin
			state <= S0;
			MATCH <= 0;
		end
		else begin
			state <= nextState;
			case(state)
				S0: begin
					if(IN) begin
						nextState <= S1;
						MATCH <= 0;
					end
					else begin
						nextState <= S0;
						MATCH <= 0;
					end
				end
				S1: begin
					if(IN) begin
						nextState <= S2;
						MATCH <= 0;
					end
					else begin
						nextState <= S0;
						MATCH <= 0;
					end
				end
				S2: begin
					if(IN) begin
						nextState <= S3;
						MATCH <= 0;
					end
					else begin
						nextState <= S0;
						MATCH <= 0;
					end
				end
				S3: begin
					if(IN) begin
						nextState <= S4;
						MATCH <= 0;
					end
					else begin
						nextState <= S0;
						MATCH <= 0;
					end
				end
				S4: begin
					if(IN) begin
						nextState <= S5;
						MATCH <= 1;
					end
					else begin
						nextState <= S0;
						MATCH <= 0;
					end
				end
				S5: begin
					if(IN) begin
						nextState <= S5;
						MATCH <= 1;
					end
					else begin
						nextState <= S0;
						MATCH <= 0;
					end
				end
				default: begin
					nextState <= S0;
					MATCH <= 0;
				end
			endcase
		end
	end
endmodule