

module pe (clk, rst, a, b, c);

    // Inputs
    input     clk;
    input     rst;
    input     [31:0] a;
    input     [31:0] b;

    // Outputs
    output    [31:0] c;

    // Registers
    reg       [31:0] c;

    // Internal variables
    wire      [31:0] product;

    // Accumulator Register
    always @(posedge clk)
    begin
        if (rst)
            c <= 0;
        else
            c <= product;
    end

    // Multiplication and Accumulation
    always @(a, b)
    begin
        if (rst)
            product <= 0;
        else
            product <= a * b + c;
    end

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: AutoSizeResult NUMERIC "1"
// Retrieval info: PRIVATE: B_isConstant NUMERIC "0"
// Retrieval info: PRIVATE: ConstantB NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: PRIVATE: LPM_PIPELINE NUMERIC "0"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: SignedMult NUMERIC "0"
// Retrieval info: PRIVATE: USE_MULT NUMERIC "1"
// Retrieval info: PRIVATE: ValidConstant NUMERIC "1"
// Retrieval info: PRIVATE: WidthA NUMERIC "32"
// Retrieval info: PRIVATE: WidthB NUMERIC "32"
// Retrieval info: PRIVATE: WidthP NUMERIC "32"
// Retrieval info: CONSTANT: LPM_HINT STRING "MAXIMIZE_SPEED=9"
// Retrieval info: CONSTANT: LPM_REPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_MULT"
// Retrieval info: CONSTANT: LPM_WIDTHA NUMERIC "32"
// Retrieval info: CONSTANT: LPM_WIDTHB NUMERIC "32"
// Retrieval info: CONSTANT: LPM_WIDTHP NUMERIC "32"
// Retrieval info: USED_PORT: clk 0 0 0 0 INPUT NODEFVAL clk
// Retrieval info: USED_PORT: rst 0 0 0 0 INPUT NODEFVAL rst
// Retrieval info: USED_PORT: a 0 0 32 0 INPUT NODEFVAL a[31..0]
// Retrieval info: USED_PORT: b 0 0 32 0 INPUT NODEFVAL b[31..0]
// Retrieval info: USED_PORT: c 0 0 32 0 OUTPUT NODEFVAL c[31..0]
// Retrieval info: CONNECT: @a 0 0 32 0 a 0 0 32 0
// Retrieval info: CONNECT: @b 0 0 32 0 b 0 0 32 0
// Retrieval info: CONNECT: c 0 0 32 0 @c 0 0 32 0
// Retrieval info: CONNECT: @clk 0 0 0 0 clk 0 0 0 0
// Retrieval info: CONNECT: @rst 0 0 0 0 rst 0 0 0 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL pe.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL pe.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL pe.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL pe.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL pe_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL pe_bb.v FALSE
// Retrieval info: LIB_FILE: lpm
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: CBX_MODULE_PREFIX: ON
// Retrieval info: C