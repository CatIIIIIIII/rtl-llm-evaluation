

module RAM(
    input clk,
    input rst_n,
    input write_en,
    input [2:0] write_addr,
    input [5:0] write_data,
    input read_en,
    input [2:0] read_addr,
    output [5:0] read_data
    );
    
    reg [5:0] RAM [7:0];
    
    always @(posedge clk) begin
        if (!rst_n) begin
            RAM[0] <= 6'b000000;
            RAM[1] <= 6'b000000;
            RAM[2] <= 6'b000000;
            RAM[3] <= 6'b000000;
            RAM[4] <= 6'b000000;
            RAM[5] <= 6'b000000;
            RAM[6] <= 6'b000000;
            RAM[7] <= 6'b000000;
        end
        else begin
            if (write_en == 1)
                RAM[write_addr] <= write_data;
        end
    end
    
    always @(posedge clk) begin
        if (!rst_n) begin
            read_data <= 6'b000000;
        end
        else begin
            if (read_en == 1)
                read_data <= RAM[read_addr];
            else
                read_data <= 6'b000000;
        end
    end
    
endmodule


module testbench();

    // Declare inputs.
    reg clk;
    reg rst_n;
    reg [2:0] write_addr;
    reg [5:0] write_data;
    reg write_en;
    reg [2:0] read_addr;
    reg read_en;
    
    // Declare outputs.
    wire [5:0] read_data;
    
    // Instantiate the Unit Under Test (UUT).
    RAM uut (
        .clk(clk),
        .rst_n(rst_n),
        .write_en(write_en),
        .write_addr(write_addr),
        .write_data(write_data),
        .read_en(read_en),
        .read_addr(read_addr),
        .read_data(read_data)
    );
    
    initial begin
        // Initialize inputs.
        clk = 0;
        rst_n = 0;
        write_en = 0;
        read_en = 0;
        write_addr = 0;
        read_addr = 0;
        write_data = 0;
        
        // Wait 100 ns for global reset to finish.
        
        // Add stimulus here.
        rst_n = 1;
        write_en = 1;
        write_addr = 0;
        write_data = 6'b001100;
        read_en = 1;
        read_addr = 0;
        write_en = 0;
        read_en = 1;
        read_addr = 0;
        rst_n = 1;
        write_en = 1;
        write_addr = 1;
        write_data = 6'b000000;
        read_en = 1;
        read_addr = 1;
        write_en = 0;
        read_en = 1;
        read_addr = 1;
        rst_n = 1;
        write_en = 1;
        write_addr = 2;
        write_data = 6'b000000;
        read_en = 1;
        read_addr = 2;
        write_en = 0;
        read_en = 1;
        read_addr = 2;
        rst_n = 1;
        write_en = 1;
        write_addr = 3;
        write_data = 6'b000000;
        read_en = 1;
        read_addr = 3;
        write_en = 0;
        read_en = 1;
        read_addr = 3;
        rst_n = 1;
        write_en = 1;
        write_addr = 4;
        write_data = 6'b000000;
        read_en = 1;
        read_addr = 4;
        write_en = 0;
        read_en = 1;
        read_addr = 4;
        rst_n = 1;
        write_en = 1;
        write_addr = 5;
        write_data = 6'b000000;
        read_en = 1;
        read_addr = 5;
        write_en = 0;
        read_en = 1;
        read_addr = 5;
        rst_n = 1;
        write_en = 1;
        write_addr = 6;
        write_data = 6'b000000;
        read_en = 1;
        read_addr = 6;
        write_en = 0;
        read_en = 1;
        read_addr = 6;
        rst_n = 1;
        write_en = 1;
        write_addr = 7;
        write_data = 6'b000000;
        read_en = 1;
        read_addr = 7;
        write_en = 0;
        read_en = 1;
        read_addr = 7;
        rst_n = 1;
        write_en = 1;
        write_addr = 0;
        write_data = 6'b111111;
        read_en = 0;
        read_addr = 0;
        write_en = 1;
        write_addr = 1;
        write_data = 6'b111111;
        read_en = 0;
        read_addr = 1;
        write_en = 1;
        write_addr = 2;
        write_data = 6'b111111;
        read_en = 0;
        read_addr = 2;
        write_en = 1;
        write_addr = 3;
        write_data = 6'b111111;
        read_en = 0;
        read_addr = 3;
        write_en = 1;
        write_addr = 4;
        write_data = 6'b111111;
        read_en = 0;
        read_addr = 4;
        write_en = 1;
        write_addr = 5;
        write_data = 6'b111111;
        read_en = 0;
        read_addr = 5;
        write_en = 1;
        write_addr = 6;
        write_data = 6'b111111;
        read_en = 0;
        read_addr = 6;
        write_en = 1;
        write_addr = 7;
        write_data = 6'b111111;
        read_en = 0;
        read_addr = 7;
        write_en = 0;
        read_en = 1;
        read_addr = 0;
        read_en = 1;
        read_addr = 1;
        read_en = 1;
        read_addr = 2;
        read_en = 1;
        read_addr = 3;
        read_en = 1;
        read_addr = 4;
        read_en = 1;
        read_addr = 5;
        read_en = 1;
        read_addr = 6;
        read_en = 1;
        read_addr = 7;
        read_en = 0;
        read_addr = 0;
        read_en = 0;
        read_addr = 1;
        read_en = 0;
        read_addr = 2;
        read_en = 0;
        read_addr = 3;
        read_en = 0;
        read_addr = 4;
        read_en = 0;
        read_addr = 5;
        read_en = 0;
        read_addr = 6;
        read_en = 0;
        read_addr = 7;
        read_en = 0;
        read_addr = 0;
        read_en = 0;
        read_addr = 1;
        read_en = 0;
        read_addr = 2;
        read_en = 0;
        read_addr = 3;
        read_en = 0;
        read_addr = 4;
        read_en = 0;
        read_addr = 5;
        read_en = 0;
        read_addr = 6;
        read_en = 0;
        read_addr = 7;
        read_en = 0;
        read_addr = 0;
        read_en = 0;
        read_addr = 1;
        read_en = 0;
        read_addr = 2;
        read_en = 0;
        read_addr = 3;
        read_en = 0;
        read_addr = 4;
        read_en = 0;
        read_addr = 5;
        read_en = 0;
        read_addr = 6;
        read_en = 0;
        read_addr = 7;
        read_en = 0;
        read_addr = 0;
        read_en = 1;
        read_addr = 0;
        read_en = 0;
        read_addr = 0;
        read_en = 1;
        read_addr = 1;
        read_en = 0;
        read_addr = 1;
        read_en = 1;
        read_addr = 2;
        read_en = 0;
        read_addr = 2;
        read_en = 1;
        read_addr = 3;
        read_en = 0;
        read_addr = 3;
        read_en = 1;
        read_addr = 4;
        read_en = 0;
        read_addr = 4;
        read_en = 1;
        read_addr = 5;
        read_en = 0;
        read_addr = 5;
        read_en = 1;
        read_addr = 6;
        read_en = 0;
        read_addr = 6;
        read_en = 1;
        read_addr = 7;
        read_en = 0;
        read_addr = 7;
        read_en = 1;
        read_addr = 0;
        read_data = 6'b111111;
        read_en = 0;
        read_addr = 0;
        read_data = 6'b000000;
        read_en = 1;
        read_addr = 1;
        read_data = 6'b111111;
        read_en = 0;
        read_addr = 1;
        read_data = 6'b000000;
        read_en = 1;
        read_addr = 2;
        read_data = 6'b111111;
       