

module adder_32bit(
    input [32:1] A,
    input [32:1] B,
    output [32:1] S,
    output C32
    );

    wire [32:1] S1;
    wire C1;
    wire [15:1] C16;
    wire [32:1] S2;
    wire C2;
    wire [15:1] C16_2;
    wire [32:1] S3;
    wire C3;
    wire [15:1] C16_3;
    wire [32:1] S4;
    wire C4;
    wire [15:1] C16_4;
    wire [32:1] S5;
    wire C5;
    wire [15:1] C16_5;
    wire [32:1] S6;
    wire C6;
    wire [15:1] C16_6;
    wire [32:1] S7;
    wire C7;
    wire [15:1] C16_7;
    wire [32:1] S8;
    wire C8;
    wire [15:1] C16_8;
    wire [32:1] S9;
    wire C9;
    wire [15:1] C16_9;
    wire [32:1] S10;
    wire C10;
    wire [15:1] C16_10;
    wire [32:1] S11;
    wire C11;
    wire [15:1] C16_11;
    wire [32:1] S12;
    wire C12;
    wire [15:1] C16_12;
    wire [32:1] S13;
    wire C13;
    wire [15:1] C16_13;
    wire [32:1] S14;
    wire C14;
    wire [15:1] C16_14;
    wire [32:1] S15;
    wire C15;
    wire [15:1] C16_15;
    wire [32:1] S16;
    wire C16;
    wire [15:1] C16_16;
    wire [32:1] S17;
    wire C17;
    wire [15:1] C16_17;
    wire [32:1] S18;
    wire C18;
    wire [15:1] C16_18;
    wire [32:1] S19;
    wire C19;
    wire [15:1] C16_19;
    wire [32:1] S20;
    wire C20;
    wire [15:1] C16_20;
    wire [32:1] S21;
    wire C21;
    wire [15:1] C16_21;
    wire [32:1] S22;
    wire C22;
    wire [15:1] C16_22;
    wire [32:1] S23;
    wire C23;
    wire [15:1] C16_23;
    wire [32:1] S24;
    wire C24;
    wire [15:1] C16_24;
    wire [32:1] S25;
    wire C25;
    wire [15:1] C16_25;
    wire [32:1] S26;
    wire C26;
    wire [15:1] C16_26;
    wire [32:1] S27;
    wire C27;
    wire [15:1] C16_27;
    wire [32:1] S28;
    wire C28;
    wire [15:1] C16_28;
    wire [32:1] S29;
    wire C29;
    wire [15:1] C16_29;
    wire [32:1] S30;
    wire C30;
    wire [15:1] C16_30;
    wire [32:1] S31;
    wire C31;
    wire [15:1] C16_31;
    wire [32:1] S32;
    wire C32;
    wire [15:1] C16_32;

    CLA_16bit C16bit1(
        .A(A[1:16]),
        .B(B[1:16]),
        .S(S1[1:16]),
        .C(C1)
    );

    CLA_16bit C16bit2(
        .A(A[17:32]),
        .B(B[17:32]),
        .S(S2[17:32]),
        .C(C2)
    );

    CLA_16bit C16bit3(
        .A(A[1:16]),
        .B(B[17:32]),
        .S(S3[1:16]),
        .C(C3)
    );

    CLA_16bit C16bit4(
        .A(A[17:32]),
        .B(B[1:16]),
        .S(S4[17:32]),
        .C(C4)
    );

    CLA_16bit C16bit5(
        .A(A[1:16]),
        .B(B[17:32]),
        .S(S5[1:16]),
        .C(C5)
    );

    CLA_16bit C16bit6(
        .A(A[17:32]),
        .B(B[1:16]),
        .S(S6[17:32]),
        .C(C6)
    );

    CLA_16bit C16bit7(
        .A(A[1:16]),
        .B(B[17:32]),
        .S(S7[1:16]),
        .C(C7)
    );

    CLA_16bit C16bit8(
        .A(A[17:32]),
        .B(B[1:16]),
        .S(S8[17:32]),
        .C(C8)
    );

    CLA_16bit C16bit9(
        .A(A[1:16]),
        .B(B[17:32]),
        .S(S9[1:16]),
        .C(C9)
    );

    CLA_16bit C16bit10(
        .A(A[17:32]),
        .B(B[1:16]),
        .S(S10[17:32]),
        .C(C10)
    );

    CLA_16bit