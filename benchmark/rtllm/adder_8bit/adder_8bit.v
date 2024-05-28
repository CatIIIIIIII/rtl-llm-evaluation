 module adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
    );
    assign sum[0] = a[0] + b[0] + cin;
    assign sum[1] = a[1] + b[1] + sum[0];
    assign sum[2] = a[2] + b[2] + sum[1];
    assign sum[3] = a[3] + b[3] + sum[2];
    assign sum[4] = a[4] + b[4] + sum[3];
    assign sum[5] = a[5] + b[5] + sum[4];
    assign sum[6] = a[6] + b[6] + sum[5];
    assign sum[7] = a[7] + b[7] + sum[6];
    assign cout = sum[7] + cin;
endmodule