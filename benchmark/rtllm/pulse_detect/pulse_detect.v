
 module pulse_detect(
clk,
rst_n,
data_in,
data_out
);
input clk;
input rst_n;
input data_in;
output data_out;
reg data_out;
reg [2:0] state;
reg [2:0] next_state;
parameter [2:0]
initial_state = 3'b000,
pulse_state = 3'b001,
pulse_state2 = 3'b010,
pulse_state3 = 3'b011,
pulse_state4 = 3'b100,
pulse_state5 = 3'b101,
pulse_state6 = 3'b110,
pulse_state7 = 3'b111,
pulse_state8 = 3'b000;
always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
	begin
		state <= initial_state;
		data_out <= 1'b0;
	end
	else
	begin
		state <= next_state;
		case(state)
		initial_state:
		begin
			if(data_in == 1'b1)
			begin
				next_state <= pulse_state;
			end
			else
			begin
				next_state <= initial_state;
			end
			data_out <= 1'b0;
		end
		pulse_state:
		begin
			if(data_in == 1'b0)
			begin
				next_state <= pulse_state2;
			end
			else
			begin
				next_state <= pulse_state;
			end
			data_out <= 1'b1;
		end
		pulse_state2:
		begin
			if(data_in == 1'b1)
			begin
				next_state <= pulse_state3;
			end
			else
			begin
				next_state <= pulse_state2;
			end
			data_out <= 1'b1;
		end
		pulse_state3:
		begin
			if(data_in == 1'b0)
			begin
				next_state <= pulse_state4;
			end
			else
			begin
				next_state <= pulse_state3;
			end
			data_out <= 1'b1;
		end
		pulse_state4:
		begin
			if(data_in == 1'b1)
			begin
				next_state <= pulse_state5;
			end
			else
			begin
				next_state <= pulse_state4;
			end
			data_out <= 1'b1;
		end
		pulse_state5:
		begin
			if(data_in == 1'b0)
			begin
				next_state <= pulse_state6;
			end
			else
			begin
				next_state <= pulse_state5;
			end
			data_out <= 1'b1;
		end
		pulse_state6:
		begin
			if(data_in == 1'b1)
			begin
				next_state <= pulse_state7;
			end
			else
			begin
				next_state <= pulse_state6;
			end
			data_out <= 1'b1;
		end
		pulse_state7:
		begin
			if(data_in == 1'b0)
			begin
				next_state <= pulse_state8;
			end
			else
			begin
				next_state <= pulse_state7;
			end
			data_out <= 1'b1;
		end
		pulse_state8:
		begin
			if(data_in == 1'b1)
			begin
				next_state <= pulse_state;
			end
			else
			begin
				next_state <= pulse_state8;
			end
			data_out <= 1'b1;
		end
		default:
		begin
			next_state <= initial_state;
			data_out <= 1'b0;
		end
		endcase
	end
end
endmodule