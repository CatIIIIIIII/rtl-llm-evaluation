 module alu(a,b,aluc,r,zero,carry,negative,overflow,flag);
input [31:0] a,b;
input [5:0] aluc;
output reg [31:0] r;
output reg zero,carry,negative,overflow,flag;
parameter ADD = 6'b100000;
parameter ADDU = 6'b100001;
parameter SUB = 6'b100010;
parameter SUBU = 6'b100011;
parameter AND = 6'b100100;
parameter OR = 6'b100101;
parameter XOR = 6'b100110;
parameter NOR = 6'b100111;
parameter SLT = 6'b101010;
parameter SLTU = 6'b101011;
parameter SLL = 6'b000000;
parameter SRL = 6'b000010;
parameter SRA = 6'b000011;
parameter SLLV = 6'b000100;
parameter SRLV = 6'b000110;
parameter SRAV = 6'b000111;
parameter LUI = 6'b001111;
wire signed [31:0] as,bs;
wire signed [31:0] res;
assign as = a;
assign bs = b;
always @(*)
begin
case(aluc)
ADD:
begin
r = as + bs;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
ADDU:
begin
r = as + bs;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
SUB:
begin
r = as - bs;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
SUBU:
begin
r = as - bs;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
AND:
begin
r = as & bs;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
OR:
begin
r = as | bs;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
XOR:
begin
r = as ^ bs;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
NOR:
begin
r = !(as | bs);
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
SLT:
begin
r = (as < bs)?1:0;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
SLTU:
begin
r = (as < bs)?1:0;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
SLL:
begin
r = bs << a;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
SRL:
begin
r = bs >> a;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
SRA:
begin
r = bs >>> a;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
SLLV:
begin
r = bs << a;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
SRLV:
begin
r = bs >> a;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
SRAV:
begin
r = bs >>> a;
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
LUI:
begin
r = {a[15:0],16'b0};
zero = (r == 32'b0)?1:0;
carry = 0;
overflow = 0;
negative = r[31];
end
default:
begin
r = 32'bz;
zero = 0;
carry = 0;
overflow = 0;
negative = 0;
end
endcase
end
endmodule