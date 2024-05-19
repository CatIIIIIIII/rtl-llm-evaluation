

module accu(clk, rst_n, data_in, valid_in, data_out, valid_out);

    input clk;
    input rst_n;
    input [7:0] data_in;
    input valid_in;
    output [9:0] data_out;
    output valid_out;

    reg [9:0] data_out;
    reg valid_out;

    reg [3:0] cnt;
    reg [7:0] data_in_r;
    reg valid_in_r;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            data_out <= 10'b0;
            valid_out <= 0;
            cnt <= 0;
            data_in_r <= 0;
            valid_in_r <= 0;
        end
        else begin
            if (valid_in)
                data_in_r <= data_in;
            valid_in_r <= valid_in;

            if (valid_in_r)
                cnt <= cnt + 1;
            else
                cnt <= 0;

            if (cnt == 4) begin
                data_out <= data_in_r * 4;
                valid_out <= 1;
            end
            else begin
                data_out <= 10'b0;
                valid_out <= 0;
            end
        end
    end

endmodule