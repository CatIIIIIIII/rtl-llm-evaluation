

module multi_booth_8bit(clk, reset, a, b, p, rdy);
   input clk, reset;
   input [7:0] a, b;
   output [15:0] p;
   output rdy;
   
   reg [15:0] p;
   reg [4:0] ctr;
   reg [15:0] multiplier, multiplicand;
   reg rdy;
   
   always @(posedge clk or posedge reset) begin
      if (reset) begin
         ctr <= 0;
         multiplier <= {{8{a[7]}}, a};
         multiplicand <= {{8{b[7]}}, b};
         p <= 0;
         rdy <= 0;
      end
      else begin
         if (ctr < 16) begin
            multiplicand <= multiplicand << 1;
            if (multiplier[ctr]) begin
               p <= p + multiplicand;
            end
            ctr <= ctr + 1;
         end
         else begin
            rdy <= 1;
         end
      end
   end
endmodule

//END