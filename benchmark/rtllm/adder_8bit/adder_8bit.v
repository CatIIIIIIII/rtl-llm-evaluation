

module adder_8bit(a, b, cin, sum, cout);
    input [7:0] a;
    input [7:0] b;
    input cin;
    output [7:0] sum;
    output cout;
    
    wire [7:0] sum_0;
    wire cout_0;
    
    full_adder fa_0(a[0], b[0], cin, sum_0[0], cout_0);
    full_adder fa_1(a[1], b[1], sum_0[0], sum_0[1], sum[0]);
    full_adder fa_2(a[2], b[2], sum_0[1], sum_0[2], sum[1]);
    full_adder fa_3(a[3], b[3], sum_0[2], sum_0[3], sum[2]);
    full_adder fa_4(a[4], b[4], sum_0[3], sum_0[4], sum[3]);
    full_adder fa_5(a[5], b[5], sum_0[4], sum_0[5], sum[4]);
    full_adder fa_6(a[6], b[6], sum_0[5], sum_0[6], sum[5]);
    full_adder fa_7(a[7], b[7], sum_0[6], sum[6], sum[7], cout);
    
endmodule

module full_adder(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;
    
    wire a_b, a_b_c;
    
    and(a_b, a, b);
    and(a_b_c, a_b, cin);
    xor(sum, a, b, cin);
    or(cout, a_b, a_b_c);
    
endmodule

//END