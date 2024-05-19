

module parallel2serial(
    input clk,
    input rst_n,
    input [3:0] d,
    output reg valid_out,
    output reg [3:0] dout
    );
    
    reg [3:0] data;
    reg [2:0] cnt;
    reg valid;
    
    always @(posedge clk)
        if(!rst_n)
            begin
                data <= 4'b0;
                cnt <= 3'b0;
                valid_out <= 1'b0;
            end
        else
            begin
                if(valid)
                    begin
                        dout <= data;
                        valid_out <= 1'b0;
                    end
                else if(!valid && cnt == 3)
                    begin
                        data <= d;
                        cnt <= 3'b0;
                        valid_out <= 1'b1;
                    end
                else
                    begin
                        dout <= {data[2:0], 1'b0};
                        data <= {data[1:0], d[3]};
                        cnt <= cnt + 1;
                        valid_out <= 1'b1;
                    end
            end
    
endmodule