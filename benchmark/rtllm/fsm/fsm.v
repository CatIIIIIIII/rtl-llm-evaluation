 module fsm(
    input IN,
    input CLK,
    input RST,
    output reg MATCH
    );
    reg [7:0] state;
    reg [7:0] next_state;
    parameter S0 = 8'b00000001;
    parameter S1 = 8'b00000010;
    parameter S2 = 8'b00000100;
    parameter S3 = 8'b00001000;
    parameter S4 = 8'b00010000;
    parameter S5 = 8'b00100000;
    parameter S6 = 8'b01000000;
    parameter S7 = 8'b10000000;
    always @(posedge CLK or posedge RST)
    begin
        if(RST)
            MATCH <= 0;
        else
        begin
            state <= next_state;
            case(state)
                S0:
                begin
                    if(IN == 1)
                        MATCH <= 1;
                    else
                        MATCH <= 0;
                end
                S1:
                begin
                    if(IN == 1)
                        MATCH <= 1;
                    else
                        MATCH <= 0;
                end
                S2:
                begin
                    if(IN == 1)
                        MATCH <= 1;
                    else
                        MATCH <= 0;
                end
                S3:
                begin
                    if(IN == 1)
                        MATCH <= 1;
                    else
                        MATCH <= 0;
                end
                S4:
                begin
                    if(IN == 1)
                        MATCH <= 1;
                    else
                        MATCH <= 0;
                end
                S5:
                begin
                    if(IN == 1)
                        MATCH <= 1;
                    else
                        MATCH <= 0;
                end
                S6:
                begin
                    if(IN == 1)
                        MATCH <= 1;
                    else
                        MATCH <= 0;
                end
                S7:
                begin
                    if(IN == 1)
                        MATCH <= 1;
                    else
                        MATCH <= 0;
                end
            endcase
        end
    end
    always @(IN or state)
    begin
        case(state)
            S0:
            begin
                if(IN == 1)
                    next_state <= S1;
                else
                    next_state <= S0;
            end
            S1:
            begin
                if(IN == 1)
                    next_state <= S2;
                else
                    next_state <= S0;
            end
            S2:
            begin
                if(IN == 1)
                    next_state <= S3;
                else
                    next_state <= S0;
            end
            S3:
            begin
                if(IN == 1)
                    next_state <= S4;
                else
                    next_state <= S0;
            end
            S4:
            begin
                if(IN == 1)
                    next_state <= S5;
                else
                    next_state <= S0;
            end
            S5:
            begin
                if(IN == 1)
                    next_state <= S6;
                else
                    next_state <= S0;
            end
            S6:
            begin
                if(IN == 1)
                    next_state <= S7;
                else
                    next_state <= S0;
            end
            S7:
            begin
                if(IN == 1)
                    next_state <= S7;
                else
                    next_state <= S0;
            end
        endcase
    end
endmodule