

module alu(
    input [31:0] a, b,
    input [5:0] aluc,
    output [31:0] r,
    output zero, carry, negative, overflow, flag
);

    wire [31:0] res;
    wire [31:0] res_sll, res_srl, res_sra;
    wire [31:0] res_sllv, res_srlv, res_srav;
    wire [31:0] res_lui;
    wire [31:0] res_add, res_addu, res_sub, res_subu;
    wire [31:0] res_and, res_or, res_xor, res_nor;
    wire [31:0] res_slt, res_sltu;

    assign res = res_sll | res_srl | res_sra | res_sllv | res_srlv | res_srav | res_lui | res_add | res_addu | res_sub | res_subu | res_and | res_or | res_xor | res_nor | res_slt | res_sltu;
    assign r = res;

    assign res_sll = a << b[4:0];
    assign res_srl = a >> b[4:0];
    assign res_sra = $signed(a) >>> b[4:0];
    assign res_sllv = a << b;
    assign res_srlv = a >> b;
    assign res_srav = $signed(a) >>> b;
    assign res_lui = {a[15:0], 16'b0};
    assign res_add = a + b;
    assign res_addu = a + b;
    assign res_sub = a - b;
    assign res_subu = a - b;
    assign res_and = a & b;
    assign res_or = a | b;
    assign res_xor = a ^ b;
    assign res_nor = ~(a | b);
    assign res_slt = ($signed(a) < $signed(b)) ? 32'b1 : 32'b0;
    assign res_sltu = (a < b) ? 32'b1 : 32'b0;

    assign zero = (res == 32'b0) ? 1'b1 : 1'b0;
    assign carry = (res == 32'b0) ? 1'b0 : 1'b1;
    assign negative = res[31];
    assign overflow = 1'b0;
    assign flag = (aluc == 6'b101010 || aluc == 6'b101011) ? 1'b1 : 1'bz;

    always @(a or b or aluc) begin
        case (aluc)
            6'b000000: res_sll = a << b[4:0];
            6'b000010: res_srl = a >> b[4:0];
            6'b000011: res_sra = $signed(a) >>> b[4:0];
            6'b000100: res_sllv = a << b;
            6'b000110: res_srlv = a >> b;
            6'b000111: res_srav = $signed(a) >>> b;
            6'b001111: res_lui = {a[15:0], 16'b0};
            6'b100000: res_add = a + b;
            6'b100001: res_addu = a + b;
            6'b100010: res_sub = a - b;
            6'b100011: res_subu = a - b;
            6'b100100: res_and = a & b;
            6'b100101: res_or = a | b;
            6'b100110: res_xor = a ^ b;
            6'b100111: res_nor = ~(a | b);
            6'b101010: res_slt = ($signed(a) < $signed(b)) ? 32'b1 : 32'b0;
            6'b