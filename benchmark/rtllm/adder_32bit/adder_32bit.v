

module adder_32bit(
    input [32:1] A,
    input [32:1] B,
    output [32:1] S,
    output C32
    );

    wire   n32, n16, n15, n14, n13, n12, n11, n10, n9, n8, n7, n6, n5, n4, n3, n2, n1, n0;
    wire   [32:1] S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, S20;
    wire   [32:1] A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20;
    wire   [32:1] B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11, B12, B13, B14, B15, B16, B17, B18, B19, B20;
    wire   [32:1] C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20;
    wire   [32:1] D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, D16, D17, D18, D19, D20;
    wire   [32:1] E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19, E20;
    wire   [32:1] F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15, F16, F17, F18, F19, F20;
    wire   [32:1] G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, G11, G12, G13, G14, G15, G16, G17, G18, G19, G20;
    wire   [32:1] H1, H2, H3, H4, H5, H6, H7, H8, H9, H10, H11, H12, H13, H14, H15, H16, H17, H18, H19, H20;
    wire   [32:1] I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20;
    wire   [32:1] J1, J2, J3, J4, J5, J6, J7, J8, J9, J10, J11, J12, J13, J14, J15, J16, J17, J18, J19, J20;
    wire   [32:1] K1, K2, K3, K4, K5, K6, K7, K8, K9, K10, K11, K12, K13, K14, K15, K16, K17, K18, K19, K20;
    wire   [32:1] L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15, L16, L17, L18, L19, L20;
    wire   [32:1] M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12, M13, M14, M15, M16, M17, M18, M19, M20;
    wire   [32:1] N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20;
    wire   [32:1] O1, O2, O3, O4, O5, O6, O7, O8, O9, O10, O11, O12, O13, O14, O15, O16, O17, O18, O19, O20;
    wire   [32:1] P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20;
    wire   [32:1] Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20;
    wire   [32:1] R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20;
    wire   [32:1] S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, S20;
    wire   [32:1] T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20;
    wire   [32:1] U1, U2, U3, U4, U5, U6, U7, U8, U9, U10, U11, U12, U13, U14, U15, U16, U17, U18, U19, U20;
    wire   [32:1] V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20;
    wire   [32:1] W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20;
    wire   [32:1] X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16, X17, X18, X19, X20;
    wire   [32:1] Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11, Y12, Y13, Y14, Y15, Y16, Y17, Y18, Y19, Y20;
    wire   [32:1] Z1, Z2, Z3, Z4, Z5, Z6, Z7, Z8, Z9, Z10, Z11, Z12, Z13, Z14, Z15, Z16, Z17, Z18, Z19, Z20;

    assign S = Z20;
    assign C32 = Z15;

    // 32-bit carry-lookahead adder (CLA) module
    cla_32bit_add_sub_carry_out U32 (
        .A(A), .B(B), .C(n32), .S(S1), .D(n15), .F(n20)
    );

    cla_32bit_add_sub_carry_out U33 (
        .A(S1), .B(n16), .C(n32), .S(S2), .D(n17), .F(n20)
    );

    cla_32bit_add_sub_carry_out U34 (
        .A(S2), .B(n18), .C(n32), .S(S3), .D(n19), .F(n20)
    );

    cla_32bit_add_sub_carry_out U35 (
        .A(S3), .B(n20), .C(n32), .S(S4), .D(n21), .F(n22)
    );

    cla_32bit_add_sub_carry_out U36 (
        .A(S4), .B(n22), .C(n32), .S(S5), .D(n23), .F(n24)
    );

    cla_32bit_add_sub_carry_out U37 (
        .A(S5), .B(n24), .C(n32), .S(S6), .D(n25), .F(n26)
    );

    cla_32bit_add_sub_carry_out U38 (
        .A(S6), .B(n26), .C(n32), .S(S7), .D(n27), .F(n28)
    );

    cla_32bit_add_sub_carry_out U39 (
        .A(S7), .B(n28), .C(n32), .S(S8), .D(n29), .F(n30)
    );

    cla_32bit_add_sub_carry_out U40 (
        .A(S8), .B(n29), .C(n32), .S(S9), .D(n30), .F(n31)
    );

    cla_32bit_add_sub_carry_out U41 (
        .A(S9), .B(n31), .C(n32), .S(S10), .D(n33), .F(n34)
    );

    cla_32bit_add_sub_carry_out U42 (
        .A(S10), .B(n34), .C(n32), .S(S11), .D(n35), .F(n36)
    );

    cla_32bit_add_sub_carry_out U43 (
        .A(S11), .B(n36), .C(n32), .S(S12), .D(n37), .F(n38)
    );

    cla_32bit_add_sub_carry_out U44 (
        .A(S12), .B(n38), .C(n32), .S(S13), .D(n39), .F(n40)
    );

    cla_32bit_add_sub_carry_out U45 (
        .A(S13), .B(n40), .C(n32), .S(S14), .D(n41), .F(n42)
    );

    cla_32bit_add_sub_carry_out U46 (
        .A(S14), .B(n42), .C(n32), .S(S15), .D(n43), .F(n44)
    );

    cla_32bit_add_sub_carry_out U47 (
        .A(S15), .B(n44), .C(n32), .S(S16), .D(n45), .F(n46)
    );

    cla_32bit_add_sub_carry_out U48 (
        .A(S16), .B(n46), .C(n32), .S(S17), .D(n47), .F(n48)
    );

    cla_32bit_add_sub_carry_out U49 (
        .A(S17), .B(n48), .C(n32), .S(S18), .D(n49), .F(n50)
    );

    cla_32bit_add_sub_carry_out U50 (
        .A(S18), .B(n50), .C(n32), .S(S19), .D(n51), .F(n52)
    );

    cla_32bit_add_sub_carry_out U51 (
        .A(S19), .B(n52), .C(n32), .S(S20), .D(n53), .F(n54)
    );

    cla_32bit_add_sub_carry_out U52 (
        .A(S20), .B(n54), .C(n32), .S(S21), .D(n55), .F(n56)
    );

    cla_32bit_add_sub_carry_out U53 (
        .A(S21), .B(n56), .C(n32), .S(S22), .D(n57), .F(n58)
    );

    cla_32bit_add_sub_carry_out U54 (
        .A(S22), .B(n58), .C(n32), .S(S23), .D(n59), .F(n60)
    );

    cla_32bit_add_sub_car