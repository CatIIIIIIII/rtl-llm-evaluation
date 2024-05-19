

module freq_div(CLK_in, RST, CLK_50, CLK_10, CLK_1);

    input CLK_in;
    input RST;

    output CLK_50;
    output CLK_10;
    output CLK_1;

    reg CLK_50;
    reg CLK_10;
    reg CLK_1;

    reg [2:0] cnt_50;
    reg [3:0] cnt_10;
    reg [2:0] cnt_100;

    always @(posedge CLK_in)
    begin
        if (RST)
        begin
            CLK_50 <= 0;
            CLK_10 <= 0;
            CLK_1 <= 0;
            cnt_50 <= 0;
            cnt_10 <= 0;
            cnt_100 <= 0;
        end
        else
        begin
            CLK_50 <= ~CLK_50;
            if (cnt_50 == 2'b11)
            begin
                CLK_50 <= 0;
                cnt_50 <= 0;
            end
            else
            begin
                cnt_50 <= cnt_50 + 1;
            end

            CLK_10 <= ~CLK_10;
            if (cnt_10 == 4'b1111)
            begin
                CLK_10 <= 0;
                cnt_10 <= 0;
            end
            else
            begin
                if (cnt_10 == 4'b1000)
                begin
                    CLK_10 <= ~CLK_10;
                    cnt_10 <= 0;
                end
                else
                begin
                    cnt_10 <= cnt_10 + 1;
                end
            end

            CLK_1 <= ~CLK_1;
            if (cnt_100 == 3'b111)
            begin
                CLK_1 <= 0;
                cnt_100 <= 0;
            end
            else
            begin
                if (cnt_100 == 3'b100)
                begin
                    CLK_1 <= ~CLK_1;
                    cnt_100 <= 0;
                end
                else
                begin
                    cnt_100 <= cnt_100 + 1;
                end
            end
        end
    end

endmodule