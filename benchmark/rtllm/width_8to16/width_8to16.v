

module width_8to16(clk, rst_n, valid_in, data_in, valid_out, data_out);
    input clk;
    input rst_n;
    input valid_in;
    input [7:0] data_in;
    output reg valid_out;
    output reg [15:0] data_out;
    
    reg [15:0] data_lock;
    reg valid_lock;
    
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            data_out <= 0;
            valid_out <= 0;
            data_lock <= 0;
            valid_lock <= 0;
        end
        else
        begin
            if (valid_in)
            begin
                data_lock <= data_in;
                valid_lock <= 1;
            end
            
            if (valid_lock)
            begin
                data_out <= {data_lock[15:8], data_in};
                valid_out <= 1;
                data_lock <= 0;
                valid_lock <= 0;
            end
        end
    end
endmodule