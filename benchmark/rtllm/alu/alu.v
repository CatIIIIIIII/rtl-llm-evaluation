

module alu(
    input [31:0] a, b,
    input [5:0] aluc,
    output [31:0] r,
    output zero, carry, negative, overflow, flag
    );

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

    reg [31:0] res;
    wire [31:0] a_s = a;
    wire [31:0] b_s = b;
    wire [31:0] r_s;
    wire zero_s;
    wire carry_s;
    wire negative_s;
    wire overflow_s;
    wire flag_s;

    assign r = res[31:0];
    assign zero = zero_s;
    assign carry = carry_s;
    assign negative = negative_s;
    assign overflow = overflow_s;
    assign flag = flag_s;

    always @(a_s or b_s or aluc) begin
        case(aluc)
            ADD: begin
                r_s = a_s + b_s;
                carry_s = (a_s[31] ^ b_s[31] ^ r_s[31] ^ r_s[30]) ? 1'b1 : 1'b0;
                negative_s = r_s[31];
                overflow_s = (a_s[30:27] != b_s[27:24] && a_s[23:0] != 0) ? 1'b1 : 1'b0;
            end
            ADDU: begin
                r_s = a_s + b_s;
                carry_s = (a_s[31] ^ b_s[31] ^ r_s[31] ^ r_s[30]) ? 1'b1 : 1'b0;
                negative_s = r_s[31];
                overflow_s = (a_s[30:27] != b_s[27:24] && a_s[23:0] != 0) ? 1'b1 : 1'b0;
            end
            SUB: begin
                r_s = a_s - b_s;
                carry_s = (a_s[31] ^ b_s[31] ^ r_s[31] ^ r_s[30]) ? 1'b1 : 1'b0;
                negative_s = r_s[31];
                overflow_s = (a_s[30:27] != b_s[27:24] && a_s[23:0] != 0) ? 1'b1 : 1'b0;
            end
            SUBU: begin
                r_s = a_s - b_s;
                carry_s = (a_s[31] ^ b_s[31] ^ r_s[31] ^ r_s[30]) ? 1'b1 : 1'b0;
                negative_s = r_s[31];
                overflow_s = (a_s[30:27] != b_s[27:24] && a_s[23:0] != 0) ? 1'b1 : 1'b0;
            end
            AND: begin
                r_s = a_s & b_s;
                carry_s = 1'b0;
                negative_s = r_s[31];
                overflow_s = 1'b0;
            end
            OR: begin
                r_s = a_s | b_s;
                carry_s = 1'b0;
                negative_s = r_s[31];
                overflow_s = 1'b0;
            end
            XOR: begin
                r_s = a_s ^ b_s;
                carry_s = 1'b0;
                negative_s = r_s[31];
                overflow_s = 1'b0;
            end
            NOR: begin
                r_s = a_s | b_s;
                carry_s = 1'b0;
                negative_s = r_s[31];
                overflow_s = 1'b0;
            end
            SLT: begin
                if (a_s < b_s) begin
                    r_s = 32'b1;
                    flag_s = 1'b1;
                end else begin
                    r_s = 32'b0;
                    flag_s = 1'b0;
                end
                carry_s = 1'b0;
                negative_s = r_s[31];
                overflow_s = 1'b0;
            end
            SLTU: begin
                if (a_s < b_s) begin
                    r_s = 32'b1;
                    flag_s = 1'b1;
                end else begin
                    r_s = 32'b0;
                    flag_s = 1'b0;
                end
                carry_s = 1'b0;
                negative_s = r_s[31];
                overflow_s = 1'b0;
            end
            SLL: begin
                r_s = a_s << b_s[4:0];
                carry_s = 1'b0;
                negative_s = r_s[31];
                overflow_s = 1'b0;
            end
            SRL: begin
                r_s = a_s >> b_s[4:0];
                carry_s = 1'b0;
                negative_s = r_s[31];
                overflow_s = 1'b0;
            end
            SRA: begin
                r_s = {a_s[31], a_s >> b_s[4:0]};
                carry_s = 1'b0;
                negative_s = r_s[31];
                overflow_s = 1'b0;
            end
            SLLV: begin
                r_s = a_s << b_s[3:0];
                carry_s = 1'b0;
                negative_s = r_s[31];
                overflow_s = 1'b0;
            end
            SRLV: begin
                r_s = a_s >> b_s[3:0];
                carry_s = 1'b0;
                negative_s = r_s[31];
                overflow_s = 1'b0;
            end
            SRAV: begin
                r_s = {a_s[31], a_s >> b_s[3:0]};
                carry_s = 1'b0;
                negative_s = r_s[31];
                overflow_s = 1'b0;
            end
            LUI: begin
                r_s = {a[15:0], 16'b0};
                carry_s = 1'b0;
                negative_s = r_s[31];
                overflow_s = 1'b0;
            end
            default: begin
                r_s = {32{1'bz}};
                carry_s = 1'b0;
                negative_s = 1'b0;
                overflow_s = 1'b0;
                flag_s = 1'b0;
            end
        endcase

        if (r_s == 32'b0)
            zero_s = 1'b1;
        else
            zero_s = 1'b0;
    end

endmodule