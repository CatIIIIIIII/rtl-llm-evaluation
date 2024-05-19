

module calendar(CLK, RST, Hours, Mins, Secs);

    //Inputs
    input CLK;
    input RST;
    
    //Outputs
    output [5:0]Hours;
    output [5:0]Mins;
    output [5:0]Secs;
    
    //Variables/Regs
    reg [5:0]Hours;
    reg [5:0]Mins;
    reg [5:0]Secs;
    
    //Submodules
    
    //Asynchronous Logic
    always @(posedge CLK)
    begin
        if(RST)
        begin
            Secs <= 6'b0;
        end
        else if(Secs == 6'b111111)
        begin
            Secs <= 6'b0;
        end
        else
        begin
            Secs <= Secs + 1;
        end
    end
    
    always @(posedge CLK)
    begin
        if(RST)
        begin
            Mins <= 6'b0;
        end
        else if((Secs == 6'b111111) && (Mins == 6'b111111))
        begin
            Mins <= 6'b0;
        end
        else if(Secs == 6'b111111)
        begin
            Mins <= Mins + 1;
        end
        else
        begin
            Mins <= Mins;
        end
    end
    
    always @(posedge CLK)
    begin
        if(RST)
        begin
            Hours <= 6'b0;
        end
        else if((Mins == 6'b111111) && (Hours == 6'b111111))
        begin
            Hours <= 6'b0;
        end
        else if(Mins == 6'b111111)
        begin
            Hours <= Hours + 1;
        end
        else
        begin
            Hours <= Hours;
        end
    end
    
    //Synchronous Logic
    
    
endmodule