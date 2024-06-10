 module div_16bit(
    input [15:0] A,
    input [7:0] B,
    output [15:0] result,
    output [15:0] odd
    );
    reg [15:0] a_reg, b_reg;
    reg [15:0] q_reg, r_reg;
    reg [15:0] q_next, r_next;
    assign result = q_reg;
    assign odd = r_reg;
    always @(A or B) begin
        a_reg = A;
        b_reg = B;
    end
    always @(a_reg or b_reg) begin
        q_reg = 16'b0;
        r_reg = 16'b0;
        q_next = 16'b0;
        r_next = 16'b0;
        if (a_reg[15] == 1'b1) begin
            q_next[15] = 1'b1;
            r_next[15] = 1'b1;
        end
        if (a_reg[14] == 1'b1) begin
            q_next[14] = 1'b1;
            r_next[14] = 1'b1;
        end
        if (a_reg[13] == 1'b1) begin
            q_next[13] = 1'b1;
            r_next[13] = 1'b1;
        end
        if (a_reg[12] == 1'b1) begin
            q_next[12] = 1'b1;
            r_next[12] = 1'b1;
        end
        if (a_reg[11] == 1'b1) begin
            q_next[11] = 1'b1;
            r_next[11] = 1'b1;
        end
        if (a_reg[10] == 1'b1) begin
            q_next[10] = 1'b1;
            r_next[10] = 1'b1;
        end
        if (a_reg[9] == 1'b1) begin
            q_next[9] = 1'b1;
            r_next[9] = 1'b1;
        end
        if (a_reg[8] == 1'b1) begin
            q_next[8] = 1'b1;
            r_next[8] = 1'b1;
        end
        if (a_reg[7] == 1'b1) begin
            q_next[7] = 1'b1;
            r_next[7] = 1'b1;
        end
        if (a_reg[6] == 1'b1) begin
            q_next[6] = 1'b1;
            r_next[6] = 1'b1;
        end
        if (a_reg[5] == 1'b1) begin
            q_next[5] = 1'b1;
            r_next[5] = 1'b1;
        end
        if (a_reg[4] == 1'b1) begin
            q_next[4] = 1'b1;
            r_next[4] = 1'b1;
        end
        if (a_reg[3] == 1'b1) begin
            q_next[3] = 1'b1;
            r_next[3] = 1'b1;
        end
        if (a_reg[2] == 1'b1) begin
            q_next[2] = 1'b1;
            r_next[2] = 1'b1;
        end
        if (a_reg[1] == 1'b1) begin
            q_next[1] = 1'b1;
            r_next[1] = 1'b1;
        end
        if (a_reg[0] == 1'b1) begin
            q_next[0] = 1'b1;
            r_next[0] = 1'b1;
        end
        if (b_reg[7] == 1'b1) begin
            q_next[15:8] = r_reg[15:8] - b_reg;
            r_next[15:8] = q_reg[15:8] << 1;
        end
        if (b_reg[6] == 1'b1) begin
            q_next[14:9] = r_reg[14:9] - b_reg;
            r_next[14:9] = q_reg[14:9] << 1;
        end
        if (b_reg[5] == 1'b1) begin
            q_next[13:10] = r_reg[13:10] - b_reg;
            r_next[13:10] = q_reg[13:10] << 1;
        end
        if (b_reg[4] == 1'b1) begin
            q_next[12:11] = r_reg[12:11] - b_reg;
            r_next[12:11] = q_reg[12:11] << 1;
        end
        if (b_reg[3] == 1'b1) begin
            q_next[11:8] = r_reg[11:8] - b_reg;
            r_next[11:8] = q_reg[11:8] << 1;
        end
        if (b_reg[2] == 1'b1) begin
            q_next[10:7] = r_reg[10:7] - b_reg;
            r_next[10:7] = q_reg[10:7] << 1;
        end
        if (b_reg[1] == 1'b1) begin
            q_next[9:4] = r_reg[9:4] - b_reg;
            r_next[9:4] = q_reg[9:4] << 1;
        end
        if (b_reg[0] == 1'b1) begin
            q_next[8:3] = r_reg[8:3] - b_reg;
            r_next[8:3] = q_reg[8:3] << 1;
        end
        q_reg = q_next;
        r_reg = r_next;
    end
endmodule