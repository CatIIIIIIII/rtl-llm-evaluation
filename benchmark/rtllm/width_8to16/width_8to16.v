
module width_8to16(
    input clk,
    input rst_n,
    input valid_in,
    input [7:0] data_in,
    output valid_out,
    output [15:0] data_out
);

    //Your code goes here
    reg [15:0] data_out_reg;
    reg valid_out_reg;
    reg [7:0] data_in_reg;
    reg valid_in_reg;
    reg flag;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_out_reg <= 0;
            valid_out_reg <= 0;
            data_in_reg <= 0;
            valid_in_reg <= 0;
            flag <= 0;
        end else begin
            if (valid_in_reg) begin
                data_out_reg <= {data_in_reg, data_in};
                valid_out_reg <= 1;
                flag <= 1;
            end else if (valid_in) begin
                data_in_reg <= data_in;
                valid_in_reg <= 1;
            end
            if (flag) begin
                valid_out_reg <= 0;
                flag <= 0;
            end
        end
    end
    assign valid_out = valid_out_reg;
    assign data_out = data_out_reg;
    //END
endmodule

module test_width_8to16;
    reg clk, rst_n, valid_in;
    reg [7:0] data_in;
    wire valid_out;
    wire [15:0] data_out;

    width_8to16 dut(clk, rst_n, valid_in, data_in, valid_out, data_out);

    initial begin
        clk = 0;
        rst_n = 0;
        valid_in = 0;
        data_in = 0;