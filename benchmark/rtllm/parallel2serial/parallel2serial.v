 module parallel2serial(
    input clk,
    input rst_n,
    input [3:0] d,
    output reg valid_out,
    output reg dout
);
    reg [1:0] cnt;
    reg [3:0] data;
    always @(posedge clk) begin
        if (rst_n == 1'b0) begin
            cnt <= 0;
            data <= 0;
            valid_out <= 0;
            dout <= 0;
        end else begin
            if (cnt == 3) begin
                cnt <= 0;
                data <= d;
                valid_out <= 1;
            end else begin
                cnt <= cnt + 1;
                valid_out <= 0;
            end
            case (cnt)
                0: dout <= data[3];
                1: dout <= data[2];
                2: dout <= data[1];
                3: dout <= data[0];
            endcase
        end
    end
endmodule