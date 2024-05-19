

`timescale 1ns/1ps

module multi_pipe_8bit(
    clk,
    rst_n,
    mul_en_in,
    mul_a,
    mul_b,
    mul_en_out,
    mul_out
);

    // Input control
    input clk;
    input rst_n;
    input mul_en_in;

    // Input registers
    reg [7:0] mul_a_reg;
    reg [7:0] mul_b_reg;

    // Output registers
    reg [9:0] mul_out_reg;

    // Wires
    wire [9:0] mul_out;
    wire [3:0] temp;
    wire [3:0] sum;

    // Input control
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            mul_en_out_reg <= 0;
        end
        else
        begin
            mul_en_out_reg <= {mul_en_out_reg[6:0], mul_en_in};
        end
    end

    assign mul_en_out = mul_en_out_reg[7];

    // Input registers
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            mul_a_reg <= 0;
            mul_b_reg <= 0;
        end
        else if (mul_en_in)
        begin
            mul_a_reg <= mul_a;
            mul_b_reg <= mul_b;
        end
    end

    // Wires
    wire [3:0] mul_a_shr;
    wire [3:0] mul_b_shr;

    // Partial product generation
    assign mul_a_shr = {mul_a_reg[7:4], 4'h0};
    assign mul_b_shr = {mul_b_reg[7:4], 4'h0};
    assign temp[0] = mul_a_shr[3] ? mul_a_reg * mul_b_shr[3] : 0;
    assign temp[1] = mul_a_shr[2] ? mul_a_reg * mul_b_shr[2] : 0;
    assign temp[2] = mul_a_shr[1] ? mul_a_reg * mul_b_shr[1] : 0;
    assign temp[3] = mul_a_shr[0] ? mul_a_reg * mul_b_shr[0] : 0;

    // Partial sum calculation
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            sum[3] <= 0;
            sum[2] <= 0;
            sum[1] <= 0;
            sum[0] <= 0;
        end
        else
        begin
            sum[3] <= sum[2] + temp[3];
            sum[2] <= sum[1] + temp[2];
            sum[1] <= sum[0] + temp[1];
            sum[0] <= temp[0];
        end
    end

    // Final product calculation
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            mul_out_reg <= 0;
        end
        else if (mul_en_out)
        begin
            mul_out_reg <= sum[3] + sum[2] + sum[1] + sum[0];
        end
    end

    assign mul_out = mul_out_reg;

endmodule

module multi_pipe_8bit_tb();

    // Input values
    reg clk;
    reg rst_n;
    reg mul_en_in;
    reg [7:0] mul_a;
    reg [7:0] mul_b;

    // Output values
    wire mul_en_out;
    wire [15:0] mul_out;

    // Instantiate the module
    multi_pipe_8bit my_multi_pipe_8bit (
        .clk(clk),
        .rst_n(rst_n),
        .mul_en_in(mul_en_in),
        .mul_a(mul_a),
        .mul_b(mul_b),
        .mul_en_out(mul_en_out),
        .mul_out(mul_out)
    );

    initial
    begin
        // Initialize Inputs
        clk = 0;
        rst_n = 0;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;

        // Wait 100 ns for global reset to finish
        rst_n = 1;
        /*
        mul_en_in = 1;
        mul_a = 8'b00000001;
        mul_b = 8'b00000001;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000001;
        mul_b = 8'b00000010;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000010;
        mul_b = 8'b00000010;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000010;
        mul_b = 8'b00000001;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000001;
        mul_b = 8'b00000001;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000001;
        mul_b = 8'b00000011;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000010;
        mul_b = 8'b00000011;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000011;
        mul_b = 8'b00000011;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000011;
        mul_b = 8'b00000001;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000010;
        mul_b = 8'b00000001;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000010;
        mul_b = 8'b00000010;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000011;
        mul_b = 8'b00000010;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000010;
        mul_b = 8'b00000001;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000011;
        mul_b = 8'b00000011;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000010;
        mul_b = 8'b00000001;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000011;
        mul_b = 8'b00000010;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000010;
        mul_b = 8'b00000001;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000011;
        mul_b = 8'b00000011;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000010;
        mul_b = 8'b00000010;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000011;
        mul_b = 8'b00000001;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000010;
        mul_b = 8'b00000011;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000011;
        mul_b = 8'b00000010;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 8'b00000010;
        mul_b = 8'b00000001;
        mul_en_in = 0;
        mul_a = 0;
        mul_b = 0;
        mul_en_in = 1;
        mul_a = 