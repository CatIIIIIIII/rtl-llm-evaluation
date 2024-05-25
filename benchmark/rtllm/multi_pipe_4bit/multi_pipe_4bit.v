

module multi_pipe_4bit(
    input clk,
    input rst_n,
    input [3:0] mul_a,
    input [3:0] mul_b,
    output reg [7:0] mul_out
);

    // Declare the constants
    localparam size = 4;

    // Declare the registers
    reg [size-1:0] mul_a_reg;
    reg [size-1:0] mul_b_reg;
    reg [size-1:0] mul_b_reg_shift;
    reg [size-1:0] mul_a_reg_shift;
    reg [size-1:0] mul_a_reg_shift_tmp;
    reg [size-1:0] mul_b_reg_tmp;
    reg [size-1:0] mul_a_reg_tmp;
    reg [size-1:0] mul_b_reg_shift_tmp;
    reg [size-1:0] mul_a_reg_shift_tmp2;
    reg [size-1:0] mul_b_reg_shift_tmp2;
    reg [size-1:0] mul_a_reg_shift_tmp3;
    reg [size-1:0] mul_b_reg_shift_tmp3;
    reg [size-1:0] mul_a_reg_shift_tmp4;
    reg [size-1:0] mul_b_reg_shift_tmp4;
    reg [size-1:0] mul_a_reg_shift_tmp5;
    reg [size-1:0] mul_b_reg_shift_tmp5;
    reg [size-1:0] mul_a_reg_shift_tmp6;
    reg [size-1:0] mul_b_reg_shift_tmp6;
    reg [size-1:0] mul_a_reg_shift_tmp7;
    reg [size-1:0] mul_b_reg_shift_tmp7;
    reg [size-1:0] mul_a_reg_shift_tmp8;
    reg [size-1:0] mul_b_reg_shift_tmp8;
    reg [size-1:0] mul_a_reg_shift_tmp9;
    reg [size-1:0] mul_b_reg_shift_tmp9;
    reg [size-1:0] mul_a_reg_shift_tmp10;
    reg [size-1:0] mul_b_reg_shift_tmp10;
    reg [size-1:0] mul_a_reg_shift_tmp11;
    reg [size-1:0] mul_b_reg_shift_tmp11;
    reg [size-1:0] mul_a_reg_shift_tmp12;
    reg [size-1:0] mul_b_reg_shift_tmp12;
    reg [size-1:0] mul_a_reg_shift_tmp13;
    reg [size-1:0] mul_b_reg_shift_tmp13;
    reg [size-1:0] mul_a_reg_shift_tmp14;
    reg [size-1:0] mul_b_reg_shift_tmp14;
    reg [size-1:0] mul_a_reg_shift_tmp15;
    reg [size-1:0] mul_b_reg_shift_tmp15;
    reg [size-1:0] mul_a_reg_shift_tmp16;
    reg [size-1:0] mul_b_reg_shift_tmp16;
    reg [size-1:0] mul_a_reg_shift_tmp17;
    reg [size-1:0] mul_b_reg_shift_tmp17;
    reg [size-1:0] mul_a_reg_shift_tmp18;
    reg [size-1:0] mul_b_reg_shift_tmp18;
    reg [size-1:0] mul_a_reg_shift_tmp19;
    reg [size-1:0] mul_b_reg_shift_tmp19;
    reg [size-1:0] mul_a_reg_shift_tmp20;
    reg [size-1:0] mul_b_reg_shift_tmp20;
    reg [size-1:0] mul_a_reg_shift_tmp21;
    reg [size-1:0] mul_b_reg_shift_tmp21;
    reg [size-1:0] mul_a_reg_shift_tmp22;
    reg [size-1:0] mul_b_reg_shift_tmp22;
    reg [size-1:0] mul_a_reg_shift_tmp23;
    reg [size-1:0] mul_b_reg_shift_tmp23;
    reg [size-1:0] mul_a_reg_shift_tmp24;
    reg [size-1:0] mul_b_reg_shift_tmp24;
    reg [size-1:0] mul_a_reg_shift_tmp25;
    reg [size-1:0] mul_b_reg_shift_tmp25;
    reg [size-1:0] mul_a_reg_shift_tmp26;
    reg [size-1:0] mul_b_reg_shift_tmp26;
    reg [size-1:0] mul_a_reg_shift_tmp27;
    reg [size-1:0] mul_b_reg_shift_tmp27;
    reg [size-1:0] mul_a_reg_shift_tmp28;
    reg [size-1:0] mul_b_reg_shift_tmp28;
    reg [size-1:0] mul_a_reg_shift_tmp29;
    reg [size-1:0] mul_b_reg_shift_tmp29;
    reg [size-1:0] mul_a_reg