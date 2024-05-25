

module freq_div(
    input CLK_in,
    input RST,
    output reg CLK_50,
    output reg CLK_10,
    output reg CLK_1
);

    reg [1:0] cnt_50;
    reg [3:0] cnt_10;
    reg [5:0] cnt_100;

    always @(posedge CLK_in or posedge RST) begin
        if (RST) begin
            cnt_50 <= 0;
            cnt_10 <= 0;
            cnt_100 <= 0;
            CLK_50 <= 0;
            CLK_10 <= 0;
            CLK_1 <= 0;
        end else begin
            if (cnt_50 == 2) begin
                cnt_50 <= 0;
                CLK_50 <= ~CLK_50;
            end else begin
                cnt_50 <= cnt_50 + 1;
            end
            if (cnt_10 == 4) begin
                cnt_10 <= 0;
                CLK_10 <= ~CLK_10;
            end else begin
                if (cnt_10 == 9) begin
                    cnt_10 <= 0;
                    CLK_1 <= ~CLK_1;
                end else begin
                    cnt_10 <= cnt_10 + 1;
                end
            end
            if (cnt_100 == 50) begin
                cnt_100 <= 0;
                CLK_1 <= ~CLK_1;
            end else begin
                cnt_100 <= cnt_100 + 1;
            end
        end
    end

endmodule

//END