

module counter_12(
    rst_n,
    clk,
    valid_count,
    out);

    //Inputs
    input rst_n;
    input clk;
    input valid_count;
    
    //Outputs
    output [3:0] out;
    
    //Registers/Wires
    reg [3:0] out;
    wire [3:0] next_out;
    
    //Instantiate the Clock Divider
    //clock_divider clk_div (.*);
    
    //Instantiate the Counter
    counter cntr (
        .rst_n(rst_n),
        .clk(clk),
        .valid_count(valid_count),
        .out(next_out)
    );
    
    //Capture the next count value
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            out <= 4'b0000;
        end
        else
        begin
            if (valid_count)
            begin
                if (out == 4'd11)
                begin
                    out <= 4'b0000;
                end
                else
                begin
                    out <= next_out;
                end
            end
        end
    end
    
endmodule

module clock_divider(
    clk,
    rst_n,
    slow_clk);
    
    //Inputs
    input clk;
    input rst_n;
    
    //Outputs
    output slow_clk;
    
    //Registers/Wires
    reg slow_clk;
    wire [23:0] count;
    
    //Instantiate the Counter
    counter cntr (
        .rst_n(rst_n),
        .clk(clk),
        .valid_count(1'b1),
        .out(count)
    );
    
    //Capture the next count value
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            slow_clk <= 0;
        end
        else
        begin
            if (count == 24'd116000)
            begin
                slow_clk <= ~slow_clk;
                count <= 0;
            end
            else
            begin
                count <= count + 1;
            end
        end
    end
    
endmodule

module counter(
    rst_n,
    clk,
    valid_count,
    out);
    
    //Inputs
    input rst_n;
    input clk;
    input valid_count;
    
    //Outputs
    output [3:0] out;
    
    //Registers/Wires
    reg [3:0] out;
    wire [3:0] next_out;
    
    //Instantiate the Counter
    counter cntr (
        .rst_n(rst_n),
        .clk(clk),
        .valid_count(valid_count),
        .out(next_out)
    );
    
    //Capture the next count value
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            out <= 4'b0000;
        end
        else
        begin
            if (valid_count)
            begin
                if (out == 4'd11)
                begin
                    out <= 4'b0000;
                end
                else
                begin
                    out <= next_out;
                end
            end
        end
    end
    
endmodule