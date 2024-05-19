

module multi_booth_8bit(clk, reset, a, b, p, rdy);

// Inputs
input clk;
input reset;
input [7:0] a;
input [7:0] b;

// Outputs
output [15:0] p;
output rdy;

// Registers/Wires
reg [15:0] p;
reg rdy;
reg [4:0] ctr;
reg [7:0] multiplier;
reg [7:0] multiplicand;

// The Booth algorithm
assign multiplier = {8{a[7]}} & a;
assign multiplicand = {8{b[7]}} & b;

always @(posedge clk)
begin
    if (reset)
    begin
        p <= 16'b0;
        rdy <= 0;
        ctr <= 5'b0;
    end
    else
    begin
        if (ctr < 16)
        begin
            if (multiplier[ctr])
                p <= p + multiplicand;
            multiplicand <= multiplicand << 1;
            ctr <= ctr + 1;
        end
        else
        begin
            rdy <= 1;
        end
    end
end

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: AutoSizeResult NUMERIC "1"
// Retrieval info: PRIVATE: Booth_Multiplier NUMERIC "1"
// Retrieval info: PRIVATE: Booth_Multiplier_1 NUMERIC "0"
// Retrieval info: PRIVATE: Booth_Multiplier_2 NUMERIC "0"
// Retrieval info: PRIVATE: Booth_Multiplier_3 NUMERIC "0"
// Retrieval info: PRIVATE: Booth_Multiplier_4 NUMERIC "0"
// Retrieval info: PRIVATE: Booth_Multiplier_5 NUMERIC "0"
// Retrieval info: PRIVATE: Booth_Multiplier_6 NUMERIC "0"
// Retrieval info: PRIVATE: Booth_Multiplier_7 NUMERIC "0"
// Retrieval info: PRIVATE: Booth_Multiplier_8 NUMERIC "0"
// Retrieval info: PRIVATE: Booth_Multiplier_9 NUMERIC "0"
// Retrieval info: PRIVATE: Booth_Multiplier_SWR NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_ENABLE_A NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_ENABLE_B NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_SIZE NUMERIC "8"
// Retrieval info: PRIVATE: BlankMemory NUMERIC "0"
// Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_A NUMERIC "0"
// Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_B NUMERIC "0"
// Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_A NUMERIC "0"
// Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_B NUMERIC "0"
// Retrieval info: PRIVATE: CLRdata NUMERIC "0"
// Retrieval info: PRIVATE: CLRq NUMERIC "0"
// Retrieval info: PRIVATE: CLRrdaddress NUMERIC "0"
// Retrieval info: PRIVATE: CLRrren NUMERIC "0"
// Retrieval info: PRIVATE: CLRwraddress NUMERIC "0"
// Retrieval info: PRIVATE: CLRwren NUMERIC "0"
// Retrieval info: PRIVATE: Clock NUMERIC "0"
// Retrieval info: PRIVATE: Clock_A NUMERIC "0"
// Retrieval info: PRIVATE: Clock_B NUMERIC "0"
// Retrieval info: PRIVATE: IMPLEMENT_IN_LES NUMERIC "0"
// Retrieval info: PRIVATE: INDATA_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: INDATA_REG_B NUMERIC "0"
// Retrieval info: PRIVATE: INIT_FILE_LAYOUT STRING "PORT_B"
// Retrieval info: PRIVATE: INIT_TO_SIM_X NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "0"
// Retrieval info: PRIVATE: JTAG_ID STRING "NONE"
// Retrieval info: PRIVATE: MAXIMUM_DEPTH NUMERIC "0"
// Retrieval info: PRIVATE: MIFfilename STRING "win_ram.mif"
// Retrieval info: PRIVATE: NUMWORDS_A NUMERIC "1"
// Retrieval info: PRIVATE: NUMWORDS_B NUMERIC "1"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
// Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_MIXED_PORTS NUMERIC "2"
// Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_PORT_A NUMERIC "3"
// Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_PORT_B NUMERIC "3"
// Retrieval info: PRIVATE: REGdata NUMERIC "1"
// Retrieval info: PRIVATE: REGq NUMERIC "1"
// Retrieval info: PRIVATE: REGrdaddress NUMERIC "1"
// Retrieval info: PRIVATE: REGrren NUMERIC "1"
// Retrieval info: PRIVATE: REGwraddress NUMERIC "1"
// Retrieval info: PRIVATE: REGwren NUMERIC "1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: USE_DIFF_CLKEN NUMERIC "0"
// Retrieval info: PRIVATE: UseDPRAM NUMERIC "1"
// Retrieval info: PRIVATE: VarWidth NUMERIC "0"
// Retrieval info: PRIVATE: WIDTH_READ_A NUMERIC "16"
// Retrieval info: PRIVATE: WIDTH_READ_B NUMERIC "16"
// Retrieval info: PRIVATE: WIDTH_WRITE_A NUMERIC "16"
// Retrieval info: PRIVATE: WIDTH_WRITE_B NUMERIC "16"
// Retrieval info: PRIVATE: WRADDR_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: WRADDR_REG_B NUMERIC "0"
// Retrieval info: PRIVATE: WRCTRL_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: enable NUMERIC "0"
// Retrieval info: PRIVATE: rden NUMERIC "0"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: ADDRESS_ACLR_B STRING "NONE"
// Retrieval info: CONSTANT: ADDRESS_REG_B STRING "CLOCK0"
// Retrieval info: CONSTANT: CLOCK_ENABLE_INPUT_A STRING "BYPASS"
// Retrieval info: CONSTANT: CLOCK_ENABLE_INPUT_B STRING "BYPASS"
// Retrieval info: CONSTANT: CLOCK_ENABLE_OUTPUT_B STRING "BYPASS"
// Retrieval info: CONSTANT: INIT_FILE STRING "win_ram.mif"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altsyncram"
// Retrieval info: CONSTANT: NUMWORDS_A NUMERIC "1"
// Retrieval info: CONSTANT: NUMWORDS_B NUMERIC "1"
// Retrieval info: CONSTANT: OPERATION_MODE STRING "DUAL_PORT"
// Retrieval info: CONSTANT: OUTDATA_ACLR_B STRING "NONE"
// Retrieval info: CONSTANT: OUTDATA_REG_B STRING "CLOCK0"
// Retrieval info: CONSTANT: POWER_UP_UNINITIALIZED STRING "FALSE"
// Retrieval info: CONSTANT: READ_DURING_WRITE_MODE_MIXED_PORTS STRING "DONT_CARE"
// Retrieval info: CONSTANT: READ_DURING_WRITE_MODE_PORT_A STRING "NEW_DATA_NO_NBE_READ"
// Retrieval info: CONSTANT: READ_DURING_WRITE_MODE_PORT_B STRING "NEW_DATA_NO_NBE_READ"
// Retrieval info: CONSTANT: WIDTHAD_A NUMERIC "4"
// Retrieval info: CONSTANT: WIDTHAD_B NUMERIC "4"
// Retrieval info: CONSTANT: WIDTH_A NUMERIC "16"
// Retrieval info: CONSTANT: WIDTH_B NUMERIC "16"
// Retrieval info: CONSTANT: WIDTH_BYTEENA_A NUMERIC "1"
// Retrieval info: USED_PORT: a 0 0 8 0 INPUT NODEFVAL "a[7..0]"
// Retrieval info: USED_PORT: b 0 0 8 0 INPUT NODEFVAL "b[7..0]"
// Retrieval info: USED_PORT: clk 0 0 0 0 INPUT VCC "clk"
// Retrieval info: USED_PORT: p 0 0 16 0 OUTPUT NODEFVAL "p[15..0]"
// Retrieval info: USED_PORT: rdy 0 0 0 0 OUTPUT NODEFVAL "rdy"
// Retrieval info: USED_PORT: reset 0 0 0 0 INPUT GND "reset"
// Retrieval info: CONNECT: @address_a 0 0 4 0 a 0 0 4 0
// Retrieval info: CONNECT: @address_b 0 0 4 0 b 0 0 4 0
// Retrieval info: CONNECT: @clock0 0 0 0 0 clk 0 0 0 0
// Retrieval info: CONNECT: @data_a 0 0 16 0 multiplier 0 0 16 0
// Retrieval info: CONNECT: @rden_b 0 0 0 0 rdy 0 0 0 0
// Retrieval info: CONNECT: @wren_a 0 0 0 0 reset 0 0 0 0
// Retrieval info: CONNECT: p 0 0 16 0 @q_b 0 0 16 0
// Retrieval info: CONNECT: @address_b 0 0 4 0 ctr 0 0 4 0
// Retrieval info: CONNECT: @clock0 0 0 0 0 clk 0 0 0 0
// Retrieval info: CONNECT: @data_b 0 0 16 0 multiplicand 0 0 16 0
// Retrieval info: CONNECT: @wren_b 0 0 0 0 reset 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram_bb.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram_waveforms.html FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram_wave*.jpg FALSE
// Retrieval info: LIB_FILE: altera_mf
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: win_ram
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: win_ram
// Retrieval info: LIB_FILE: altera_mf
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram.bsf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram_bb.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram_wave*.jpg FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram_wave*.html FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram_wave*.txt FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram_wave*.rtf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram_wave*.pdf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram_wave*.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL win_ram_inst.v TRUE
// Retrieval info: GEN