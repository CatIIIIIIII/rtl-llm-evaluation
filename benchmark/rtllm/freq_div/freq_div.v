 module freq_div(
    input CLK_in,
    input RST,
    output reg CLK_50,
    output reg CLK_10,
    output reg CLK_1
    );
    reg [15:0] cnt_100;
    reg [15:0] cnt_10;
    always @(posedge CLK_in or posedge RST) begin
        if (RST)
            CLK_50 <= 0;
        else
            CLK_50 <= ~CLK_50;
    end
    always @(posedge CLK_in or posedge RST) begin
        if (RST) begin
            CLK_10 <= 0;
            cnt_10 <= 0;
        end
        else begin
            if (cnt_10 == 4) begin
                CLK_10 <= ~CLK_10;
                cnt_10 <= 0;
            end
            else
                cnt_10 <= cnt_10 + 1;
        end
    end
    always @(posedge CLK_in or posedge RST) begin
        if (RST) begin
            CLK_1 <= 0;
            cnt_100 <= 0;
        end
        else begin
            if (cnt_100 == 49) begin
                CLK_1 <= ~CLK_1;
                cnt_100 <= 0;
            end
            else
                cnt_100 <= cnt_100 + 1;
        end
    end
endmodule