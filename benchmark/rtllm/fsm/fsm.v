

module fsm(IN, CLK, RST, MATCH);
    input IN, CLK, RST;
    output MATCH;

    reg match_reg;
    reg [3:0] counter;
    reg [3:0] counter_reg;

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            match_reg <= 0;
            counter <= 0;
        end else begin
            if (IN == 1) begin
                counter <= counter + 1;
            end else begin
                counter <= 0;
            end
            if (counter == 5) begin
                match_reg <= 1;
            end else begin
                match_reg <= 0;
            end
        end
    end

    assign MATCH = match_reg;

endmodule

//END