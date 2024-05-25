
module adder_16bit(a, b, Cin, y, Co);
    input [15:0] a, b;
    input Cin;
    output [15:0] y;
    output Co;

    wire [7:0] a_0, a_1, a_2, a_3, a_4, a_5, a_6, a_7;
    wire [7:0] b_0, b_1, b_2, b_3, b_4, b_5, b_6, b_7;
    wire [7:0] y_0, y_1, y_2, y_3, y_4, y_5, y_6, y_7;
    wire [7:0] c_0, c_1, c_2, c_3, c_4, c_5, c_6, c_7;
    wire [7:0] c_0_0, c_0_1, c_0_2, c_0_3, c_0_4, c_0_5, c_0_6, c_0_7;
    wire [7:0] c_1_0, c_1_1, c_1_2, c_1_3, c_1_4, c_1_5, c_1_6, c_1_7;
    wire [7:0] c_2_0, c_2_1, c_2_2, c_2_3, c_2_4, c_2_5, c_2_6, c_2_7;
    wire [7:0] c_3_0, c_3_1, c_3_2, c_3_3, c_3_4, c_3_5, c_3_6, c_3_7;
    wire [7:0] c_4_0, c_4_1, c_4_2, c_4_3, c_4_4, c_4_5, c_4_6, c_4_7;
    wire [7:0] c_5_0, c_5_1, c_5_2, c_5_3, c_5_4, c_5_5, c_5_6, c_5_7;
    wire [7:0] c_6_0, c_6_1, c_6_2, c_6_3, c_6_4, c_6_5, c_6_6, c_6_7;
    wire [7:0] c_7_0, c_7_1, c_7_2, c_7_3, c_7_4, c_7_5, c_7_6, c_7_7;

    assign a_0 = a[7:0];
    assign a_1 = a[15:8];
    assign a_2 = a[7:0];
    assign a_3 = a[15:8];
    assign a_4 = a[7:0];
    assign a_5 = a[15:8];
    assign a_6 = a[7:0];
    assign a_7 = a[15:8];

    assign b_0 = b[7:0];
    assign b_1 = b[15:8];
    assign b_2 = b[7:0];
    assign b_3 = b[15:8];
    assign b_4 = b[7:0];
    assign b_5 = b[15:8];
    assign b_6 = b[7:0];
    assign b_7 = b[15:8];

    assign y_0 = a_0 + b_0 + Cin;
    assign y_1 = a_1 + b_1 + c_0_0;
    assign y_2 = a_2 + b_2 + c_1_0;
    assign y_3 = a_3 + b_3 + c_2_0;
    assign y_4 = a_4 + b_4 + c_3_0;
    assign y_5 = a_5 + b_5 + c_4_0;
    assign y_6 = a_6 + b_6 + c_5_0;
    assign y_7 = a_7 + b_7 + c_6_0;

    assign c_0_0 = y_0[8];
    assign c_0_1 = y_1[8];
    assign c_0_2 = y_2[8];
    assign c_0_3 = y_3[8];
    assign c_0_4 = y_4[8];
    assign c_0_5 = y_5[8];
    assign c_0_6 = y_6[8];
    assign c_0_7 = y_7[8];

    assign c_1_0 = y_0[7] | y_1[8];
    assign c_1_1 = y_1[7] | y_2[8];
    assign c_1_2 = y_2[7] | y_3[8];
    assign c_1_3 = y_3[7] | y_4[8];
    assign c_1_4 = y_4[7] | y_5[8];
    assign c_1_5 = y_5[7] | y_6[8];
    assign c_1_6 = y_6[7] | y_7[8];
    assign c_1_7 = y_7[7];

    assign c_2_0 = y_0[6] | y_1[7] | y_0[8];
    assign c_2_1 = y_1[6] | y_2[7] | y_1[8];
    assign c_2_2 = y_2[6] | y_3[7] | y_2[8];
    assign c_2_3 = y_3[6] | y_4[7] | y_3[8];
    assign c_2_4 = y_4[6] | y_5[7] | y_4[8];
    assign c_2_5 = y_5[6] | y_6[7] | y_5[8];
    assign c_2_6 = y_6[6] | y_7[7] | y_6[8];
    assign c_2_7 = y_7[6] | y_7[8];

    assign c_3_0 = y_0[5] | y_1[6] | y_0[8];
    assign c_3_1 = y_1[5] | y_2[6] | y_1[8];
    assign c_3_2 = y_2[5] | y_3[6] | y_2[8];
    assign c_3_3 = y_3[5] | y_4[6] | y_3[8];
    assign c_3_4 = y_4[5] | y_5[6] | y_4[8];
    assign c_3_5 = y_5[5] | y_6[6] | y_5[8];
    assign c_3_6 = y_6[5] | y_7[6] | y_6[8];
    assign c_3_7 = y_7[5] | y_7[8];

    assign c_4_0 = y_0[4] | y_1[5] | y_0[8];
    assign c_4_1 = y_