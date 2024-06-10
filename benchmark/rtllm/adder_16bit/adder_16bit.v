 module adder_16bit(
    input [15:0] a,
    input [15:0] b,
    input Cin,
    output [15:0] y,
    output Co
    );
    assign {Co, y} = a + b + Cin;
endmodule