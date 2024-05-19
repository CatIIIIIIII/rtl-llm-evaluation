

module JC_counter(
    input clk,
    input rst_n,
    output reg [63:0] Q
    );
    
    reg [63:0] Q_temp;
    
    always @(posedge clk) begin
        if (!rst_n) begin
            Q <= 0;
        end
        else begin
            if (Q[0]) begin
                Q_temp <= Q_temp >> 1;
                Q_temp[0] <= 0;
            end
            else begin
                Q_temp <= Q_temp >> 1;
                Q_temp[0] <= 1;
            end
            
            Q <= Q_temp;
        end
    end
    
endmodule


module JC_counter_tb;

    // Inputs
    reg clk;
    reg rst_n;

    // Outputs
    wire [63:0] Q;

    // Instantiate the Unit Under Test (UUT)
    JC_counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .Q(Q)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        rst_n = 0;

        // Wait 100 ns for global reset to finish
        rst_n = 1;
        /*
        rst_n = 0;
        rst_n = 1;
        */
        $finish;
    end

    always begin
    end

endmodule