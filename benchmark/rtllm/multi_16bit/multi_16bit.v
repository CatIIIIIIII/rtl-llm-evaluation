

module multi_16bit(
    input clk,
    input rst_n,
    input start,
    input [15:0] ain,
    input [15:0] bin,
    output [31:0] yout,
    output done
    );

    // WRITE YOUR CODE BELOW THIS LINE
    reg [15:0] areg;
    reg [15:0] breg;
    reg [31:0] yout_r;
    reg [4:0] i;
    reg done_r;
    
    always @(posedge clk or negedge rst_n) begin
        if (rst_n == 0) begin
            areg <= 0;
            breg <= 0;
            yout_r <= 0;
            i <= 0;
            done_r <= 0;
        end
        else begin
            if (start == 1) begin
                if (i < 17) begin
                    i <= i + 1;
                    if (areg[i-1] == 1) begin
                        yout_r <= (breg << i-1) + yout_r;
                    end
                end
                else begin
                    done_r <= 1;
                end
            end
            else begin
                i <= 0;
                done_r <= 0;
            end
            areg <= ain;
            breg <= bin;
        end
    end
    
    assign yout = yout_r;
    assign done = done_r;
    // WRITE YOUR CODE ABOVE THIS LINE

    // END
    // DO NOT EDIT BELOW THIS LINE
    // 16-bit counter
    //reg [15:0] counter;
    //always @(posedge clk or negedge rst_n) begin
    //    if (rst_n == 0) begin
    //        counter <= 0;
    //    end
    //    else begin
    //        counter <= counter + 1;
    //    end
    //end
    // 16-bit shift register
    //reg [15:0] shift_reg;
    //always @(posedge clk or negedge rst_n) begin
    //    if (rst_n == 0) begin
    //        shift_reg <= 0;
    //    end
    //    else begin
    //        if (start == 1) begin
    //            shift_reg <= shift_reg << 1;
    //        end
    //    end
    //end
    // 16-bit shift register
    //reg [15:0] shift_reg;
    //always @(posedge clk or negedge rst_n) begin
    //    if (rst_n == 0) begin
    //        shift_reg <= 0;
    //    end
    //    else begin
    //        if (start == 1) begin
    //            shift_reg <= shift_reg << 1;
    //        end
    //    end
    //end
    // 16-bit shift register
    //reg [15:0] shift_reg;
    //always @(posedge clk or negedge rst_n) begin
    //    if (rst_n == 0) begin
    //        shift_reg <= 0;
    //    end
    //    else begin
    //        if (start == 1) begin
    //            shift_reg <= shift_reg << 1;
    //        end
    //    end
    //end
    // 16-bit shift register
    //reg [15:0] shift_reg;
    //always @(posedge clk or negedge rst_n) begin
    //    if (rst_n == 0) begin
    //        shift_reg <= 0;
    //    end
    //    else begin
    //        if (start == 1) begin
    //            shift_reg <= shift_reg << 1;
    //        end
    //    end
    //end
    // 16-bit shift register
    //reg [15:0] shift_reg;
    //always @(posedge clk or negedge rst_n) begin
    //    if (rst_n == 0) begin
    //        shift_reg <= 0;
    //    end
    //    else begin
    //        if (start == 1) begin
    //            shift_reg <= shift_reg << 1;
    //        end
    //    end
    //end
    // 16-bit shift register
    //reg [15:0] shift_reg;
    //always @(posedge clk or negedge rst_n) begin
    //    if (rst_n == 0) begin
    //        shift_reg <= 0;
    //    end
    //    else begin
    //        if (start == 1) begin
   