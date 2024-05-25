
module counter_12(rst_n, clk, valid_count, out);
    input rst_n, clk, valid_count;
    output reg [3:0] out;
    
    // Define constants
    localparam MAX_COUNT = 4'd11;
    
    // Define internal variables
    reg [3:0] count;
    
    // Define helper functions
    function [3:0] count_wrap;
        input [3:0] count;
        begin
            if (count == MAX_COUNT)
                count_wrap = 4'd0;
            else
                count_wrap = count + 4'd1;
        end
    endfunction
    
    // Define the module
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            out <= 4'b0000;
        else if (valid_count) begin
            if (out == MAX_COUNT)
                out <= 4'b0000;
            else
                out <= out + 4'd1;
        end
    end
    
    //END
endmodule