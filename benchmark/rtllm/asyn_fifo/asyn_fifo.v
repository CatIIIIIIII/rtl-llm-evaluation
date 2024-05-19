

`timescale 1ns/1ps

module asyn_fifo #(
    parameter DEPTH = 16,
    parameter WIDTH = 8
)(
    input wclk,
    input rclk,
    input wrstn,
    input rrstn,
    input winc,
    input rinc,
    input [WIDTH-1:0] wdata,
    output reg [WIDTH-1:0] rdata,
    output wfull,
    output rempty
);

    reg [3:0] waddr_bin;
    reg [3:0] raddr_bin;
    reg [3:0] wptr;
    reg [3:0] rptr;
    reg [3:0] wptr_buff;
    reg [3:0] rptr_buff;
    reg [3:0] rptr_syn;
    wire [3:0] raddr_gray;
    wire [3:0] waddr_gray;
    wire [3:0] wptr_gray;
    wire [3:0] rptr_gray;
    wire [3:0] raddr_bin_gray;
    wire [3:0] waddr_bin_gray;
    wire [7:0] rdata_out;
    wire [7:0] wdata_in;
    wire [7:0] ram_rdata;
    wire ram_ren;
    wire ram_wen;
    wire [3:0] ram_waddr;
    wire [3:0] ram_raddr;
    wire [7:0] ram_wdata;
    wire [7:0] ram_rdata;
    wire wfull_i;
    wire rempty_i;

    assign wfull = wfull_i;
    assign rempty = rempty_i;
    assign ram_ren = ren;
    assign ram_wen = wen;
    assign ram_waddr = waddr;
    assign ram_raddr = raddr;
    assign ram_wdata = wdata;
    assign rdata = rdata_out;
    assign ram_rdata = rdata_out;

    always @(posedge wclk) begin
        if (~wrstn) begin
            wptr <= 0;
            wptr_buff <= 0;
            waddr_bin <= 0;
            waddr_gray <= 0;
            wptr_gray <= 0;
        end else begin
            wptr_buff <= wptr;
            waddr_bin <= waddr_bin_gray;
            waddr_gray <= waddr;
            wptr_gray <= wptr;
        end
    end

    always @(posedge rclk) begin
        if (~rrstn) begin
            rptr <= 0;
            rptr_buff <= 0;
            raddr_bin <= 0;
            raddr_gray <= 0;
            rptr_gray <= 0;
        end else begin
            rptr_buff <= rptr;
            raddr_bin <= raddr_bin_gray;
            raddr_gray <= raddr;
            rptr_gray <= rptr;
        end
    end

    always @(posedge wclk or negedge wrstn) begin
        if (~wrstn) begin
            wptr_gray <= 0;
            waddr_bin_gray <= 0;
        end else begin
            wptr_gray <= wptr_bin;
            waddr_bin_gray <= waddr_bin;
        end
    end

    always @(posedge rclk or negedge rrstn) begin
        if (~rrstn) begin
            rptr_gray <= 0;
            raddr_bin_gray <= 0;
        end else begin
            rptr_gray <= rptr_bin;
            raddr_bin_gray <= raddr_bin;
        end
    end

    always @(posedge wclk) begin
        if (wenc) begin
            RAM_MEM[waddr_bin] <= wdata;
        end
    end

    assign rdata_out = RAM_MEM[raddr_bin];

    wire [7:0] empty_val = {8{1'b1}};
    wire [7:0] full_val = {8{1'b0}};

    always @(posedge wclk) begin
        if (~wrstn) begin
            wfull_i <= 1'b1;
        end else begin
            wfull_i <= (wptr_bin == ~raddr_bin_gray) ? 1'b1 : 1'b0;
        end
    end

    always @(posedge rclk) begin
        if (~rrstn) begin
            rempty_i <= 1'b1;
        end else begin
            rempty_i <= (raddr_bin == wptr_bin_gray) ? 1'b1 : 1'b0;
        end
    end

    assign wen = ram_wen & ~wfull_i;
    assign ren = ram_ren & ~rempty_i;
    assign waddr = waddr_gray;
    assign raddr = raddr_gray;
    assign wdata = wdata_in;
    assign rdata_out = ram_rdata;

    dual_port_RAM dual_port_ram (
        .wclk(wclk),
        .rclk(rclk),
        .wenc(wen),
        .renc(ren),
        .waddr(waddr),
        .raddr(raddr),
        .wdata(wdata),
        .rdata(rdata_out)
    );

    always @(posedge wclk) begin
        if (wenc) begin
            wptr <= wptr_bin;
        end
    end

    always @(posedge rclk) begin
        if (renc) begin
            rptr <= rptr_bin;
        end
    end

    function [3:0] bin2gray (
        input [3:0] bin
    );
        bin2gray = bin ^ (bin >> 1);
    endfunction

    function [3:0] gray2bin (
        input [3:0] gray
    );
        gray2bin = gray ^ (gray >> 1);
    endfunction

    assign waddr_bin_gray = bin2gray(waddr_bin);
    assign raddr_bin_gray = bin2gray(raddr_bin);
    assign wptr_bin = gray2bin(wptr_gray);
    assign rptr_bin = gray2bin(rptr_gray);

endmodule

module dual_port_RAM (
    input wclk,
    input rclk,
    input wenc,
    input renc,
    input [3:0] waddr,
    input [3:0] raddr,
    input [7:0] wdata,
    output reg [7:0] rdata
);

    parameter DEPTH = 16;
    parameter WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    localparam RAM_WIDTH = 2 ** ADDR_WIDTH;

    reg [RAM_WIDTH - 1:0] mem [0:DEPTH - 1];

    always @(posedge wclk) begin
        if (wenc) begin
            mem[waddr] <= wdata;
        end
    end

    always @(posedge rclk) begin
        if (renc) begin
            rdata <= mem[raddr];
        end
    end

endmodule

/*

DEPTH = 16
WIDTH = 8

*/

module asyn_fifo_tb;

    parameter DEPTH = 16;
    parameter WIDTH = 8;

    reg clk;
    reg rstn;
    reg [WIDTH - 1:0] wdata;
    reg [ADDR_WIDTH - 1:0] waddr;
    reg winc;
    reg [ADDR_WIDTH - 1:0] raddr;
    reg rinc;
    wire [WIDTH - 1:0] rdata;
    wire wfull;
    wire rempty;

    asyn_fifo #(
        .DEPTH(DEPTH),
        .WIDTH(WIDTH)
    )
    asyn_fifo (
        .wclk(clk),
        .rclk(clk),
        .wrstn(rstn),
        .rrstn(rstn),
        .winc(winc),
        .rinc(rinc),
        .wdata(wdata),
        .wfull(wfull),
        .rempty(rempty),
        .rdata(rdata),
        .waddr(waddr)
    );

    initial begin
        clk = 0;
        rstn = 0;
    end

    always begin
    end

    initial begin
        rstn = 0;
        winc = 0;
        rinc = 0;
    end

    always begin
    end

    always begin
    end

endmodule

module gray_code_test;

    parameter WIDTH = 4;
    parameter DEPTH = 8;

    reg [WIDTH - 1:0] bin;
    reg [WIDTH - 1:0] gray;
    reg [WIDTH - 1:0] bin_gray;

    asyn_fifo_tb asyn_fifo_tb (
        .DEPTH(DEPTH),
        .WIDTH(WIDTH),
        .clk(clk),
        .rstn(rstn),
        .winc(winc),
        .rinc(rinc),
        .wdata(wdata),
        .wfull(wfull),
        .rempty(rempty),
        .rdata(rdata),
        .waddr(waddr)
    );

    always begin
    end

    task expect;
        input [WIDTH - 1:0] exp_out;
        if (gray !== exp_out) begin
            $display("TEST FAILED");
            $display("At time %0d: gray = %b", $time, gray);
            $display("At time %0d: exp_out = %b", $time, exp_out);
            $display("width = %0d", WIDTH);
            $display("depth = %0d", DEPTH);
            $finish;
        end else begin
            $display("At time %0d: gray = %b", $time, gray);
            $display("At time %0d: exp_out = %b", $time, exp_out);
            $display("width = %0d", WIDTH);
            $display("depth = %0d", DEPTH);
        end
    endtask

   