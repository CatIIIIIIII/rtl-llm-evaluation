

module div_16bit(A, B, result, odd);
    input [15:0] A;
    input [7:0] B;
    output [15:0] result;
    output [15:0] odd;

    reg [15:0] a_reg;
    reg [7:0] b_reg;
    reg [15:0] result_reg;
    reg [15:0] odd_reg;

    always @(A or B) begin
        a_reg <= A;
        b_reg <= B;
    end

    always @(a_reg or b_reg) begin
        result_reg = 16'b0;
        odd_reg = 16'b0;
        if (a_reg[15] == 1'b1) begin
            result_reg[15] = 1'b1;
            odd_reg[15] = a_reg[15];
        end
        if (a_reg[14] == 1'b1) begin
            result_reg[14] = 1'b1;
            odd_reg[14] = a_reg[14];
        end
        if (a_reg[13] == 1'b1) begin
            result_reg[13] = 1'b1;
            odd_reg[13] = a_reg[13];
        end
        if (a_reg[12] == 1'b1) begin
            result_reg[12] = 1'b1;
            odd_reg[12] = a_reg[12];
        end
        if (a_reg[11] == 1'b1) begin
            result_reg[11] = 1'b1;
            odd_reg[11] = a_reg[11];
        end
        if (a_reg[10] == 1'b1) begin
            result_reg[10] = 1'b1;
            odd_reg[10] = a_reg[10];
        end
        if (a_reg[9] == 1'b1) begin
            result_reg[9] = 1'b1;
            odd_reg[9] = a_reg[9];
        end
        if (a_reg[8] == 1'b1) begin
            result_reg[8] = 1'b1;
            odd_reg[8] = a_reg[8];
        end
        if (a_reg[7] == 1'b1) begin
            result_reg[7] = 1'b1;
            odd_reg[7] = a_reg[7];
        end
        if (a_reg[6] == 1'b1) begin
            result_reg[6] = 1'b1;
            odd_reg[6] = a_reg[6];
        end
        if (a_reg[5] == 1'b1) begin
            result_reg[5] = 1'b1;
            odd_reg[5] = a_reg[5];
        end
        if (a_reg[4] == 1'b1) begin
            result_reg[4] = 1'b1;
            odd_reg[4] = a_reg[4];
        end
        if (a_reg[3] == 1'b1) begin
            result_reg[3] = 1'b1;
            odd_reg[3] = a_reg[3];
        end
        if (a_reg[2] == 1'b1) begin
            result_reg[2] = 1'b1;
            odd_reg[2] = a_reg[2];
        end
        if (a_reg[1] == 1'b1) begin
            result_reg[1] = 1'b1;
            odd_reg[1] = a_reg[1];
        end
        if (a_reg[0] == 1'b1) begin
            result_reg[0] = 1'b1;
            odd_reg[0] = a_reg[0];
        end
    end

    assign result = result_reg;
    assign odd = odd_reg;

endmodule

//END