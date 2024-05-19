

module multi_pipe_4bit (clk, rst_n, mul_a, mul_b, mul_out);

    // Input signals
    input       clk;
    input       rst_n;
    input [3:0] mul_a;
    input [3:0] mul_b;

    // Output signals
    output [7:0] mul_out;

    // Parameters
    localparam size = 4;

    // Wires
    wire [3:0]   mul_a_ext;
    wire [3:0]   mul_b_ext;
    wire [7:0]   mul_out_int1;
    wire [7:0]   mul_out_int2;

    //                           Name          Output              Other arguments
    extend_input_signals       extend_a       (mul_a_ext, mul_a, size);
    extend_input_signals       extend_b       (mul_b_ext, mul_b, size);
    mul_4bit_unsigned_number   mul_4bit_unsign (mul_out_int1, mul_a_ext, mul_b_ext);
    register_4bit_unsigned_number register_4bit_unsigned_number_1 (mul_out_int2, mul_out_int1, clk, rst_n);
    assign       mul_out = mul_out_int2;

endmodule

module extend_input_signals (extended_signal, original_signal, size);

    // Input signals
    input       clk;
    input       rst_n;
    input [3:0] original_signal;
    input       size;

    // Output signals
    output [3:0] extended_signal;

    // Wires
    wire [3:0]   zeros;

    // Initial value of zeros is all zeros
    initial begin
        zeros = 4'b0;
    end

    // Assign the extended signal
    assign extended_signal = {original_signal, zeros};

endmodule

module mul_4bit_unsigned_number (product, multiplicand, multiplier);

    // Input signals
    input [3:0] multiplicand;
    input [3:0] multiplier;

    // Output signals
    output [7:0] product;

    // Wires
    wire [7:0]   partial_product0;
    wire [7:0]   partial_product1;
    wire [7:0]   partial_product2;
    wire [7:0]   partial_product3;
    wire [7:0]   product;

    //                                 Name         Output             Other arguments
    mul_4bit_unsigned_number_64bit_pipeline mul_4bit_unsigned_number_64bit_pipeline_1 (partial_product0, multiplicand, multiplier);
    mul_4bit_unsigned_number_64bit_pipeline mul_4bit_unsigned_number_64bit_pipeline_2 (partial_product1, partial_product0, multiplier);
    mul_4bit_unsigned_number_64bit_pipeline mul_4bit_unsigned_number_64bit_pipeline_3 (partial_product2, partial_product1, multiplier);
    mul_4bit_unsigned_number_64bit_pipeline mul_4bit_unsigned_number_64bit_pipeline_4 (partial_product3, partial_product2, multiplier);
    add_4bit_unsigned_number           add_4bit_unsigned_number_1 (product, partial_product3, 4'b0);

endmodule

module mul_4bit_unsigned_number_64bit_pipeline (partial_product, multiplicand, multiplier);

    // Input signals
    input [3:0] multiplicand;
    input [3:0] multiplier;

    // Output signals
    output [7:0] partial_product;

    // Wires
    wire [7:0]   partial_product_w;

    //                                 Name         Output             Other arguments
    mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_1 (partial_product_w, multiplicand, multiplier);
    assign       partial_product = {1'b0, partial_product_w};

endmodule

module mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier (partial_product_w, multiplicand, multiplier);

    // Input signals
    input [3:0] multiplicand;
    input [3:0] multiplier;

    // Output signals
    output [7:0] partial_product_w;

    // Wires
    wire [7:0]   partial_product_w_reg;

    //                                 Name         Output             Other arguments
    mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_1 (partial_product_w_reg, multiplicand, multiplier);
    assign       partial_product_w = partial_product_w_reg;

endmodule

module mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i (partial_product_w_reg, multiplicand, multiplier);

    // Input signals
    input [3:0] multiplicand;
    input [3:0] multiplier;

    // Output signals
    output [7:0] partial_product_w_reg;

    // Wires
    wire [7:0]   partial_product0;
    wire [7:0]   partial_product1;
    wire [7:0]   partial_product2;
    wire [7:0]   partial_product3;
    wire [7:0]   partial_product_w_reg_0;

    //                                 Name         Output             Other arguments
    mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_4 mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_4_1 (partial_product3, multiplicand, 4'b1);
    mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_3 mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_3_1 (partial_product2, multiplicand, 4'b1);
    mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_2 mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_2_1 (partial_product1, multiplicand, 4'b1);
    mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_1 mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_1_1 (partial_product0, multiplicand, 4'b1);
    assign       partial_product_w_reg_0 = {1'b0, partial_product0};
    assign       partial_product_w_reg = {partial_product_w_reg_0, partial_product1, partial_product2, partial_product3};

endmodule

module mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_1 (partial_product, multiplicand, multiplier);

    // Input signals
    input [3:0] multiplicand;
    input [3:0] multiplier;

    // Output signals
    output [7:0] partial_product;

    // Wires
    wire [7:0]   partial_product1;
    wire [7:0]   partial_product_w;

    //                                 Name         Output             Other arguments
    mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_2 mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_2_1 (partial_product1, multiplicand, multiplier);
    mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i   mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_1_1 (partial_product_w, partial_product1, 4'b0);
    assign       partial_product = partial_product_w;

endmodule

module mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_2 (partial_product, multiplicand, multiplier);

    // Input signals
    input [3:0] multiplicand;
    input [3:0] multiplier;

    // Output signals
    output [7:0] partial_product;

    // Wires
    wire [7:0]   partial_product2;
    wire [7:0]   partial_product_w;

    //                                 Name         Output             Other arguments
    mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_4 mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_4_1 (partial_product2, multiplicand, 4'b1);
    mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i   mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_1_1 (partial_product_w, partial_product2, 4'b0);
    assign       partial_product = partial_product_w;

endmodule

module mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_4 (partial_product, multiplicand, multiplier);

    // Input signals
    input [3:0] multiplicand;
    input [3:0] multiplier;

    // Output signals
    output [7:0] partial_product;

    // Wires
    wire [7:0]   partial_product3;
    wire [7:0]   partial_product_w;

    //                                 Name         Output             Other arguments
    mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_8 mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_8_1 (partial_product3, multiplicand, multiplier);
    mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i   mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_1_1 (partial_product_w, partial_product3, 4'b0);
    assign       partial_product = partial_product_w;

endmodule

module mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_8 (partial_product, multiplicand, multiplier);

    // Input signals
    input [3:0] multiplicand;
    input [3:0] multiplier;

    // Output signals
    output [7:0] partial_product;

    // Wires
    wire [7:0]   partial_product_w;

    //                                 Name         Output             Other arguments
    mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_1 mul_4bit_unsigned_number_64bit_pipeline_64bit_multiplier_64bit_dsp_i_1_1 (partial_product_w, multiplicand, multiplier);
    assign       partial_product = partial_product_w;

endmodule

module add_4bit_unsigned_number (sum, operand_a, operand_b);

    // Input signals
    input [7:0] operand_a;
    input [7:0] operand_b;

    // Output signals
    output [7:0] sum;

    // Wires
    wire [7:0]   sum_w;

    //                           Name          Output              Other arguments
    add_subt_4bit_unsigned_number add_subt_4bit_unsigned_number_1 (sum_w, operand_a, operand_b);
    assign       sum = sum_w;

endmodule

module add_subt_4bit_unsigned_number (sum, operand_a, operand_b);

    // Input signals
    input [7:0] operand_a;
    input [7:0] operand_b;

    // Output signals
    output [7:0] sum;

    // Wires
    wire [7:0]   carry;
    wire [7:0]   sum_w;

    //                           Name          Output              Other arguments
    add_subt_4bit_unsigned_number_carry add_subt_4bit_unsigned_number_carry_1 (carry, operand_a, operand_b);
    full_adder_4bit_unsigned_number     full_adder_4bit_unsigned_number_1 (sum_w, carry, 4'b0);
    assign       sum = sum_w;

endmodule

module add_subt_4bit_unsigned_number_carry (carry, operand_a, operand_b);

