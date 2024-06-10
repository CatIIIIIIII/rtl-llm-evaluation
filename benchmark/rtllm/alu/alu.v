
module alu(
    input [31:0] a,
    input [31:0] b,
    input [5:0] aluc,
    output reg [31:0] r,
    output reg zero,
    output reg carry,
    output reg negative,
    output reg overflow,
    output reg flag
    );
    wire [31:0] res;
    wire [31:0] a_s, b_s;
    assign a_s = a;
    assign b_s = b;
    assign res = r;
    assign flag = (aluc == SLT || aluc == SLTU) ? 1'b1 : 1'bz;
    assign zero = (res == 32'b0) ? 1'b1 : 1'b0;
    assign carry = 1'b0;
    assign negative = (res[31] == 1'b1) ? 1'b1 : 1'b0;
    assign overflow = 1'b0;
    always @(*) begin
        case (aluc)
            ADD: begin
                {carry, r} = a_s + b_s;
            end
            ADDU: begin
                {carry, r} = a_s + b_s;
            end
            SUB: begin
                {carry, r} = a_s - b_s;
            end
            SUBU: begin
                {carry, r} = a_s - b_s;
            end
            AND: begin
                r = a_s & b_s;
            end
            OR: begin
                r = a_s | b_s;
            end
            XOR: begin
                r = a_s ^ b_s;
            end
            NOR: begin
                r = ~(a_s | b_s);
            end
            SLT: begin
                r = (a_s < b_s) ? 32'b1 : 32'b0;
            end
            SLTU: begin
                r = (a_s < b_s) ? 32'b1 : 32'b0;
            end
            SLL: begin
                r = b_s << a;
            end
            SRL: begin
                r = b_s >> a;
            end
            SRA: begin
                r = (b_s >>> a);
            end
            SLLV: begin
                r = b_s << a[4:0];
            end
            SRLV: begin
                r = b_s >> a[4:0];
            end
            SRAV: begin
                r = (b_s >>> a[4:0]);
            end
            LUI: begin
                r = {a[31:16], 16'b0};
            end
            default: begin
                r = 32'bz;
            end
        endcase
    end
endmodule