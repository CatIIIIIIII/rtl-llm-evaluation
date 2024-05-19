

module adder_pipe_64bit(
    clk,
    rst_n,
    i_en,
    adda,
    addb,
    result,
    o_en
    );

input clk;
input rst_n;
input i_en;
input [63:0] adda;
input [63:0] addb;
output reg [64:0] result;
output reg o_en;

reg [63:0] adda_reg;
reg [63:0] addb_reg;
reg [63:0] sum_reg;
reg [63:0] adda_comp;
reg [63:0] addb_comp;
reg [63:0] sum_comp;
reg [63:0] carry_reg;
reg [63:0] adda_d1_reg;
reg [63:0] addb_d1_reg;
reg [63:0] sum_d1_reg;
reg [63:0] carry_d1_reg;
reg [63:0] adda_d2_reg;
reg [63:0] addb_d2_reg;
reg [63:0] sum_d2_reg;
reg [63:0] carry_d2_reg;

always @(posedge clk)
begin
    if (!rst_n) begin
        adda_reg <= 64'b0;
        addb_reg <= 64'b0;
        sum_reg <= 64'b0;
        adda_comp <= 64'b0;
        addb_comp <= 64'b0;
        sum_comp <= 64'b0;
        carry_reg <= 64'b0;
        adda_d1_reg <= 64'b0;
        addb_d1_reg <= 64'b0;
        sum_d1_reg <= 64'b0;
        carry_d1_reg <= 64'b0;
        adda_d2_reg <= 64'b0;
        addb_d2_reg <= 64'b0;
        sum_d2_reg <= 64'b0;
        carry_d2_reg <= 64'b0;
    end
    else begin
        if (i_en) begin
            adda_reg <= adda;
            addb_reg <= addb;
        end
        if (i_en || o_en) begin
            sum_reg <= sum_comp;
            carry_reg <= carry_d1_reg;
        end
        if (i_en || o_en || adda_d1_reg) begin
            adda_comp <= adda_reg;
            addb_comp <= addb_reg;
            sum_comp <= sum_reg + carry_reg;
            carry_d1_reg <= sum_comp[64];
        end
        if (i_en || o_en || adda_d2_reg) begin
            adda_d1_reg <= adda_comp;
            addb_d1_reg <= addb_comp;
            sum_d1_reg <= sum_comp;
            carry_d1_reg <= carry_d1_reg;
        end
        if (i_en || o_en || adda_reg) begin
            adda_d2_reg <= adda_d1_reg;
            addb_d2_reg <= addb_d1_reg;
            sum_d2_reg <= sum_d1_reg;
            carry_d2_reg <= carry_d1_reg;
        end
    end
end

always @(posedge clk)
begin
    if (!rst_n) begin
        o_en <= 1'b0;
    end
    else begin
        if (i_en) begin
            o_en <= 1'b1;
        end
        else if (o_en) begin
            if (sum_d2_reg) begin
                o_en <= 1'b0;
            end
        end
    end
end

assign result = sum_d2_reg;

endmodule