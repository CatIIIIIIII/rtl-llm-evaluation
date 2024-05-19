

module fsm (
    input wire CLK,
    input wire RST,
    input wire [3:0] IN,
    output wire MATCH
    );

    localparam [2:0]
        // States
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        S4 = 3'b100,
        S5 = 3'b101,
        S6 = 3'b110,
        S7 = 3'b111;

    reg [2:0] state;
    reg [2:0] next_state;
    wire match_0, match_1;

    // Instantiate the match detector.
    fsm_match match0 (
        .IN(IN[0]),
        .CLK(CLK),
        .RST(RST),
        .MATCH(match_0)
    );

    // Instantiate the match detector.
    fsm_match match1 (
        .IN(IN[1]),
        .CLK(CLK),
        .RST(RST),
        .MATCH(match_1)
    );

    // Instantiate the match detector.
    fsm_match match2 (
        .IN(IN[2]),
        .CLK(CLK),
        .RST(RST),
        .MATCH(MATCH)
    );

    // State Machine for handling inputs.
    always @(posedge CLK)
    begin
        if (RST)
            state <= S0;
        else
            state <= next_state;
    end

    // Combinational logic for state machine.
    always @*
    begin
        next_state = S0;
        MATCH = 0;

        case (state)
            S0:
                if (IN == 4'b0001)
                    next_state = S1;
                else
                    MATCH = 1;
            S1:
                if (IN == 4'b0101)
                    next_state = S2;
                else
                    MATCH = 1;
            S2:
                if (IN == 4'b1001)
                    next_state = S3;
                else
                    MATCH = 1;
            S3:
                if (IN == 4'b0001)
                    next_state = S4;
                else
                    MATCH = 1;
            S4:
                if (IN == 4'b1001)
                    next_state = S5;
                else
                    MATCH = 1;
            S5:
                if (IN == 4'b0001)
                    next_state = S6;
                else
                    MATCH = 1;
            S6:
                if (IN == 4'b1001)
                    next_state = S7;
                else
                    MATCH = 1;
            S7:
                if (IN == 4'b1111)
                    MATCH = 1;
                else
                    next_state = S0;
        endcase
    end

    // Create a match signal for each state.
    assign match_1 = (state == S1 || state == S5 || state == S7);
    assign match_0 = (state == S0 || state == S2 || state == S3);

    // Use the match signals to set the output signal.
    always @(posedge CLK)
    begin
        if (RST)
            MATCH <= 0;
        else
            MATCH <= match_1 | match_0;
    end

endmodule

module fsm_match (
    input wire CLK,
    input wire RST,
    input wire IN,
    output wire MATCH
    );

    localparam [2:0]
        // States
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        S4 = 3'b100,
        S5 = 3'b101,
        S6 = 3'b110,
        S7 = 3'b111;

    reg [2:0] state;
    reg [2:0] next_state;
    wire match_0, match_1;

    // Instantiate the match detector.
    fsm_match_1 match0 (
        .IN(IN),
        .CLK(CLK),
        .RST(RST),
        .MATCH(match_0)
    );

    // Instantiate the match detector.
    fsm_match_1 match1 (
        .IN(IN),
        .CLK(CLK),
        .RST(RST),
        .MATCH(match_1)
    );

    // State Machine for handling inputs.
    always @(posedge CLK)
    begin
        if (RST)
            state <= S0;
        else
            state <= next_state;
    end

    // Combinational logic for state machine.
    always @*
    begin
        next_state = S0;
        MATCH = 0;

        case (state)
            S0:
                if (IN)
                    next_state = S1;
                else
                    MATCH = 1;
            S1:
                if (IN)
                    next_state = S2;
                else
                    MATCH = 1;
            S2:
                if (IN)
                    next_state = S3;
                else
                    MATCH = 1;
            S3:
                if (IN)
                    next_state = S4;
                else
                    MATCH = 1;
            S4:
                if (IN)
                    next_state = S5;
                else
                    MATCH = 1;
            S5:
                if (IN)
                    next_state = S6;
                else
                    MATCH = 1;
            S6:
                if (IN)
                    next_state = S7;
                else
                    MATCH = 1;
            S7:
                if (IN)
                    MATCH = 1;
                else
                    next_state = S0;
        endcase
    end

    // Create a match signal for each state.
    assign match_1 = (state == S1 || state == S5 || state == S7);
    assign match_0 = (state == S0 || state == S2 || state == S3);

    // Use the match signals to set the output signal.
    always @(posedge CLK)
    begin
        if (RST)
            MATCH <= 0;
        else
            MATCH <= match_1 | match_0;
    end

endmodule

module fsm_match_1 (
    input wire CLK,
    input wire RST,
    input wire IN,
    output wire MATCH
    );

    localparam [2:0]
        // States
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        S4 = 3'b100,
        S5 = 3'b101,
        S6 = 3'b110,
        S7 = 3'b111;

    reg [2:0] state;
    reg [2:0] next_state;
    wire match_0, match_1;

    // Instantiate the match detector.
    fsm_match_2 match0 (
        .IN(IN),
        .CLK(CLK),
        .RST(RST),
        .MATCH(match_0)
    );

    // Instantiate the match detector.
    fsm_match_2 match1 (
        .IN(IN),
        .CLK(CLK),
        .RST(RST),
        .MATCH(match_1)
    );

    // State Machine for handling inputs.
    always @(posedge CLK)
    begin
        if (RST)
            state <= S0;
        else
            state <= next_state;
    end

    // Combinational logic for state machine.
    always @*
    begin
        next_state = S0;
        MATCH = 0;

        case (state)
            S0:
                if (IN)
                    next_state = S1;
                else
                    MATCH = 1;
            S1:
                if (IN)
                    next_state = S2;
                else
                    MATCH = 1;
            S2:
                if (IN)
                    next_state = S3;
                else
                    MATCH = 1;
            S3:
                if (IN)
                    next_state = S4;
                else
                    MATCH = 1;
            S4:
                if (IN)
                    next_state = S5;
                else
                    MATCH = 1;
            S5:
                if (IN)
                    next_state = S6;
                else
                    MATCH = 1;
            S6:
                if (IN)
                    next_state = S7;
                else
                    MATCH = 1;
            S7:
                if (IN)
                    MATCH = 1;
                else
                    next_state = S0;
        endcase
    end

    // Create a match signal for each state.
    assign match_1 = (state == S1 || state == S5 || state == S7);
    assign match_0 = (state == S0 || state == S2 || state == S3);

    // Use the match signals to set the output signal.
    always @(posedge CLK)
    begin
        if (RST)
            MATCH <= 0;
        else
            MATCH <= match_1 | match_0;
    end

endmodule

module fsm_match_2 (
    input wire CLK,
    input wire RST,
    input wire IN,
    output wire MATCH
    );

    localparam [2:0]
        // States
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        S4 = 3'b100,
        S5 = 3'b101,
        S6 = 3'b110,
        S7 = 3'b111;

    reg [2:0] state;
    reg [2:0] next_state;
    wire match_0, match_1;

    // Instantiate the match detector.
    fsm_match_3 match0 (
        .IN(IN),
        .CLK(CLK),
        .RST(RST),
        .MATCH(match_0)
    );

    // Instantiate the match detector.
    fsm_match_3 match1 (
        .IN(IN),
        .CLK(CLK),
        .RST(RST),
        .MATCH(match_1)
    );

    // State Machine for handling inputs.
    always @(posedge CLK)
    begin
        if (RST)
            state <= S0;
        else
            state <= next_state;
    end

    // Combinational logic for state machine.
    always @*
    begin
        next_state = S0;
        MATCH = 0;

        case (state)
            S0:
                if (IN)
                    next_state = S1;
                else
                    MATCH = 1;
            S1:
                if (IN)
                    next_state = S2;
                else
                    MATCH = 1;
            S2:
                if (IN)
                    next_state = S3;
                else
                    MATCH = 1;
            S3:
                if (IN)
                    next_state = S4;
                else
                    MATCH = 1;
            S4:
                if (IN)
                    next_state = S5;
                else
                    MATCH = 1;
            S5:
                if (IN)
                    next_state = S6;
                else
                    MATCH = 1;
            S6:
                if (IN)
                    next_state = S7;
                else
                    MATCH = 1;
            S7:
                if (IN)
                    MATCH = 1;
                else
                    next_state = S0;
        endcase
    end

    // Create a match signal for each state.
    assign match_1 = (state == S1 || state == S5 || state == S7);
    assign match_0 = (state == S0 || state == S2 || state == S3);

    // Use the match signals to set the output signal.
    always @(posedge CLK)
    begin
        if (RST)
            MATCH <= 0;
        else
            MATCH <= match_1 | match_0;
    end

endmodule

module fsm_match_3 (
    input wire CLK,
    input wire RST,
    input wire IN,
    output wire MATCH
    );

    localparam [2:0]
        // States
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        S4 = 3'b100,
        S5 = 3'b101,
        S6 = 3'b110,
        S7 = 3'b111;

    reg [2:0] state;
    reg [2:0] next_state;
    wire match_0, match_1;

    // Instantiate the match detector.
    fsm_match_4 match0 (
        .IN(IN),
        .CLK(CLK),
        .RST(RST),
        .MATCH(match_0)
    );

    // Instantiate the match detector.
    fsm_match_4 match1 (
        .IN(IN),
        .CLK(CLK),
        .RST(RST),
        .MATCH(match_1)
    );

    // State Machine for handling inputs.
    always @(posedge CLK)
    begin
        if (RST)
            state <= S0;
        else
            state <= next_state;
    end

    // Combinational logic for state machine.
    always @*
    begin
        next_state = S0;
        MATCH = 0;

        case (state)
            S0:
                if (IN)
                    next_state = S1;
                else
                    MATCH =