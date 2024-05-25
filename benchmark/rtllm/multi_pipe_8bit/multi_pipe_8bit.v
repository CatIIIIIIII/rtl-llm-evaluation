

module multi_pipe_8bit(
    input clk,
    input rst_n,
    input mul_en_in,
    input [7:0] mul_a,
    input [7:0] mul_b,
    output mul_en_out,
    output [15:0] mul_out
);

    // Define constants: parameter [name_of_constant] = value;
    parameter NUMBER_OF_BITS = 8;
    parameter NUMBER_OF_PARTIAL_PRODUCTS = 8;
    parameter NUMBER_OF_PARTIAL_SUMS = 8;
    parameter NUMBER_OF_BITS_IN_SUM = 8;
    parameter NUMBER_OF_BITS_IN_PRODUCT = 16;
    
    // Define input ports as wires: wire [name_of_port] = value;
    wire [NUMBER_OF_BITS-1:0] mul_a;
    wire [NUMBER_OF_BITS-1:0] mul_b;
    wire mul_en_in;
    
    // Define output ports as wires: wire [name_of_port] = value;
    wire mul_en_out;
    wire [NUMBER_OF_BITS_IN_PRODUCT-1:0] mul_out;
    
    // Define internal wires: wire [name_of_wire] = value;
    wire [NUMBER_OF_BITS-1:0] mul_a_reg;
    wire [NUMBER_OF_BITS-1:0] mul_b_reg;
    wire [NUMBER_OF_BITS-1:0] mul_en_out_reg;
    wire [NUMBER_OF_PARTIAL_PRODUCTS-1:0] temp;
    wire [NUMBER_OF_PARTIAL_SUMS-1:0] sum;
    wire [NUMBER_OF_BITS_IN_SUM-1:0] mul_out_reg;
    
    // Implement the module here.
    // You can use the following functions:
    // assign, always, always@(posedge clk), always@(posedge clk, posedge rst_n), always@(negedge clk), always@(negedge clk, negedge rst_n), always@(rst_n), always@(posedge rst_n), always@(negedge rst_n), always@(rst_n, posedge clk), always@(rst_n, negedge clk), always@(posedge clk, posedge rst_n), always@(posedge clk, negedge rst_n), always@(negedge clk, posedge rst_n), always@(negedge clk, negedge rst_n)
    
    // Input Control
    always@(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            mul_en_out_reg <= 0;
        end
        else begin
            mul_en_out_reg <= mul_en_in;
        end
    end
    
    assign mul_en_out = mul_en_out_reg[NUMBER_OF_BITS-1];
    
    // Input Registers
    always@(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            mul_a_reg <= 0;
            mul_b_reg <= 0;
        end
        else begin
            if (mul_en_in) begin
                mul_a_reg <= mul_a;
                mul_b_reg <= mul_b;
            end
        end
    end
    
    // Partial Product Generation
    assign temp[0] = mul_a_reg[0] & mul_b_reg[0];
    assign temp[1] = mul_a_reg[1] & mul_b_reg[1];
    assign temp[2] = mul_a_reg[2] & mul_b_reg[2];
    assign temp[3] = mul_a_reg[3] & mul_b_reg[3];
    assign temp[4] = mul_a_reg[4] & mul_b_reg[4];
    assign temp[5] = mul_a_reg[5] & mul_b_reg[5];
    assign temp[6] = mul_a_reg[6] & mul_b_reg[6];
    assign temp[7] = mul_a_reg[7] & mul_b_reg[7];
    
    // Partial Sum Calculation
    always@(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            sum[0] <= 0;
            sum[1] <= 0;
            sum[2] <= 0;
            sum[3] <= 0;
            sum[4] <= 0;
            sum[5] <= 0;
            sum[6] <= 0;
            sum[7] <= 0;
        end
        else begin
            if (mul_en_in) begin
                sum[0] <= temp[0];
                sum[1] <= temp[1] + temp[0];
                sum[2] <= temp[2] + temp[1];
                sum[3] <= temp[3] + temp[