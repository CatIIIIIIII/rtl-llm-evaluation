 module adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
    );
    wire [7:0] s1, s2, s3, s4, s5, s6, s7, s8;
    assign sum = s8;
    assign cout = s8[7];
    assign s1 = a[0] + b[0] + cin;
    assign s2 = a[1] + b[1] + s1[0];
    assign s3 = a[2] + b[2] + s2[0];
    assign s4 = a[3] + b[3] + s3[0];
    assign s5 = a[4] + b[4] + s4[0];
    assign s6 = a[5] + b[5] + s5[0];
    assign s7 = a[6] + b[6] + s6[0];
    assign s8 = a[7] + b[7] + s7[0];
endmodule