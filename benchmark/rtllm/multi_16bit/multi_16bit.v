

module multi_16bit(
    clk,
    rst_n,
    start,
    ain,
    bin,
    yout,
    done
    );

// Data bit control
reg [15:0] areg = 16'b0;
reg [15:0] breg = 16'b0;
reg [31:0] yout_r = 32'b0;
reg [16:0] i = 17'b0;

// Multiplication completion flag generation
reg done_r = 1'b0;

// Shift and accumulate operation
reg [15:0] yout = 16'b0;

// Input/output signals
input clk;
input rst_n;
input start;
input [15:0] ain;
input [15:0] bin;
output [31:0] yout;
output done;

// Instantiate the shift register
wire [15:0] bin_s = {16{1'b0}};
wire [15:0] ain_s = {16{1'b0}};

// The following two signals are used to interface with the shift_reg module
reg [15:0] bin_sr;
reg [15:0] ain_sr;

// Instantiate the shift_reg module to the left
// Shift the multiplier (bin) to the left by 16-bit positions
// and append zeros at the least significant bit positions
// 16 times in total
module shift_left(
    clk,
    rst_n,
    start,
    din,
    dout
    );

    input clk;
    input rst_n;
    input start;
    input [15:0] din;
    output reg [15:0] dout;

    reg [1:0] count = 2'b0;

    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            dout <= 16'b0;
            count <= 2'b0;
        end
        else
        begin
            if (start)
            begin
                dout <= din;
                count <= 2'b0;
            end
            else
            begin
                if (count < 4)
                begin
                    dout <= {dout[14:0], 1'b0};
                    count <= count + 1;
                end
                else
                begin
                    dout <= {dout[14:0], 1'b0};
                end
            end
        end
    end

endmodule

// Instantiate the shift_reg module to the right
// Shift the multiplicand (ain) to the right by 16-bit positions
// and append zeros at the most significant bit positions
// 16 times in total
module shift_right(
    clk,
    rst_n,
    start,
    din,
    dout
    );

    input clk;
    input rst_n;
    input start;
    input [15:0] din;
    output reg [15:0] dout;

    reg [1:0] count = 2'b0;

    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            dout <= 16'b0;
            count <= 2'b0;
        end
        else
        begin
            if (start)
            begin
                dout <= din;
                count <= 2'b0;
            end
            else
            begin
                if (count < 4)
                begin
                    dout <= {1'b0, dout[15:1]};
                    count <= count + 1;
                end
                else
                begin
                    dout <= {1'b0, dout[15:1]};
                end
            end
        end
    end

endmodule

// Instantiate the shift_reg module to the left
// Shift the multiplier (bin) to the left by 16-bit positions
// and append zeros at the least significant bit positions
// 16 times in total
module shift_right_16(
    clk,
    rst_n,
    start,
    din,
    dout
    );

    input clk;
    input rst_n;
    input start;
    input [15:0] din;
    output reg [15:0] dout;

    reg [1:0] count = 2'b0;

    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            dout <= 16'b0;
            count <= 2'b0;
        end
        else
        begin
            if (start)
            begin
                dout <= din;
                count <= 2'b0;
            end
            else
            begin
                if (count < 16)
                begin
                    dout <= {dout[15:1], 1'b0};
                    count <= count + 1;
                end
                else
                begin
                    dout <= {dout[15:1], 1'b0};
                end
            end
        end
    end

endmodule

// Instantiate the shift_reg module to the right
// Shift the multiplicand (ain) to the right by 16-bit positions
// and append zeros at the most significant bit positions
// 16 times in total
module shift_left_16(
    clk,
    rst_n,
    start,
    din,
    dout
    );

    input clk;
    input rst_n;
    input start;
    input [15:0] din;
    output reg [15:0] dout;

    reg [1:0] count = 2'b0;

    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            dout <= 16'b0;
            count <= 2'b0;
        end
        else
        begin
            if (start)
            begin
                dout <= din;
                count <= 2'b0;
            end
            else
            begin
                if (count < 16)
                begin
                    dout <= {1'b0, dout[15:1]};
                    count <= count + 1;
                end
                else
                begin
                    dout <= {1'b0, dout[15:1]};
                end
            end
        end
    end

endmodule

// Instantiate the shift_reg module to the right
// Shift the multiplier (bin) to the right by 16-bit positions
// and append zeros at the most significant bit positions
// 16 times in total
module shift_right_1(
    clk,
    rst_n,
    start,
    din,
    dout
    );

    input clk;
    input rst_n;
    input start;
    input [15:0] din;
    output reg [15:0] dout;

    reg [1:0] count = 2'b0;

    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            dout <= 16'b0;
            count <= 2'b0;
        end
        else
        begin
            if (start)
            begin
                dout <= din;
                count <= 2'b0;
            end
            else
            begin
                if (count < 16)
                begin
                    dout <= {dout[15:1], 1'b0};
                    count <= count + 1;
                end
                else
                begin
                    dout <= {dout[15:1], 1'b0};
                end
            end
        end
    end

endmodule

// Instantiate the shift_reg module to the left
// Shift the multiplicand (ain) to the left by 16-bit positions
// and append zeros at the least significant bit positions
// 16 times in total
module shift_left_1(
    clk,
    rst_n,
    start,
    din,
    dout
    );

    input clk;
    input rst_n;
    input start;
    input [15:0] din;
    output reg [15:0] dout;

    reg [1:0] count = 2'b0;

    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            dout <= 16'b0;
            count <= 2'b0;
        end
        else
        begin
            if (start)
            begin
                dout <= din;
                count <= 2'b0;
            end
            else
            begin
                if (count < 16)
                begin
                    dout <= {dout[14:0], 1'b0};
                    count <= count + 1;
                end
                else
                begin
                    dout <= {dout[14:0], 1'b0};
                end
            end
        end
    end

endmodule

always @(posedge clk)
begin
    if (!rst_n)
    begin
        areg <= 16'b0;
        breg <= 16'b0;
        yout_r <= 32'b0;
        i <= 17'b0;
        done_r <= 1'b0;
    end
    else
    begin
        if (start)
        begin
            if (i < 16)
            begin
                areg <= ain;
                breg <= bin;
                i <= i + 1;
            end
            else
            begin
                i <= 16'b0;
            end
        end
        else
        begin
            i <= 16'b0;
        end
        if (i == 0)
        begin
            yout_r <= 32'b0;
        end
        if (i > 0 && i < 17)
        begin
            if (areg[15])
            begin
                yout_r <= {yout_r[30:0], 1'b1};
            end
            else
            begin
                yout_r <= {yout_r[30:0], 1'b0};
            end
        end
        if (i == 16)
        begin
            yout_r <= {yout_r[30:0], 1'b0};
        end
        done_r <= i == 16;
        yout <= yout_r;
    end
end

endmodule

// Please paste your solution into this file and submit it with your assignment.
// You may not modify this file.
module multi_16bit_solution(
    clk,
    rst_n,
    start,
    ain,
    bin,
    yout,
    done
    );

    // Your code here
    // Please paste your solution here
    // You may not modify this file.
    multi_16bit multi_16bit (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .ain(ain),
        .bin(bin),
        .yout(yout),
        .done(done)
    );

endmodule

// You may modify the contents of this file to test your solution.
// You must not modify the file name or the path of this file.
`ifndef ARCH_TEST
`define ARCH_TEST
`timescale 1ns / 1ps

module multi_16bit_test();

    // Inputs
    reg clk;
    reg rst_n;
    reg start;
    reg [15:0] ain;
    reg [15:0] bin;

    // Outputs
    wire [31:0] yout;
    wire done;

    // Instantiate the module under test (solution)
    multi_16bit_solution solution (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .ain(ain),
        .bin(bin),
        .yout(yout),
        .done(done)
    );

    initial
    begin
        // Initialize Inputs
        clk = 0;
        rst_n = 0;
        start = 0;
        ain = 0;
        bin = 0;

        // Wait 100 ns for global reset to finish
        rst_n = 1;
        /*
        start = 1;
        ain = 1;
        bin = 1;
        start = 0;
        ain = 0;
        bin = 0;
        */
        start = 1;
        ain = 1;
        bin = 1;
        start = 0;
        ain = 