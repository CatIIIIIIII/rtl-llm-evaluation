
module adder_pipe_64bit(
    clk,
    rst_n,
    i_en,
    adda,
    addb,
    result,
    o_en
);

// Define the ports
input clk;
input rst_n;
input i_en;
input [63:0] adda;
input [63:0] addb;
output [64:0] result;
output o_en;

// Define the constants
// Define the parameters
// Define the registers
reg [64:0] result;
reg o_en;
reg [64:0] result_pipe_0;
reg [64:0] result_pipe_1;
reg [64:0] result_pipe_2;
reg [64:0] result_pipe_3;
reg [64:0] result_pipe_4;
reg [64:0] result_pipe_5;
reg [64:0] result_pipe_6;
reg [64:0] result_pipe_7;
reg [64:0] result_pipe_8;
reg [64:0] result_pipe_9;
reg [64:0] result_pipe_10;
reg [64:0] result_pipe_11;
reg [64:0] result_pipe_12;
reg [64:0] result_pipe_13;
reg [64:0] result_pipe_14;
reg [64:0] result_pipe_15;
reg [64:0] result_pipe_16;
reg [64:0] result_pipe_17;
reg [64:0] result_pipe_18;
reg [64:0] result_pipe_19;
reg [64:0] result_pipe_20;
reg [64:0] result_pipe_21;
reg [64:0] result_pipe_22;
reg [64:0] result_pipe_23;
reg [64:0] result_pipe_24;
reg [64:0] result_pipe_25;
reg [64:0] result_pipe_26;
reg [64:0] result_pipe_27;
reg [64:0] result_pipe_28;
reg [64:0] result_pipe_29;
reg [64:0] result_pipe_30;
reg [64:0] result_pipe_31;
reg [64:0] result_pipe_32;
reg [64:0] result_pipe_33;
reg [64:0] result_pipe_34;
reg [64:0] result_pipe_35;
reg [64:0] result_pipe_36;
reg [64:0] result_pipe_37;
reg [64:0] result_pipe_38;
reg [64:0] result_pipe_39;
reg [64:0] result_pipe_40;
reg [64:0] result_pipe_41;
reg [64:0] result_pipe_42;
reg [64:0] result_pipe_43;
reg [64:0] result_pipe_44;
reg [64:0] result_pipe_45;
reg [64:0] result_pipe_46;
reg [64:0] result_pipe_47;
reg [64:0] result_pipe_48;
reg [64:0] result_pipe_49;
reg [64:0] result_pipe_50;
reg [64:0] result_pipe_51;
reg [64:0] result_pipe_52;
reg [64:0] result_pipe_53;
reg [64:0] result_pipe_54;
reg [64:0] result_pipe_55;
reg [64:0] result_pipe_56;
reg [64:0] result_pipe_57;
reg [64:0] result_pipe_58;
reg [64:0] result_pipe_59;
reg [64:0] result_pipe_60;
reg [64:0] result_pipe_61;
reg [64:0] result_pipe_62;
reg [64:0] result_pipe_63;
reg [64:0] result_pipe_64;
reg [64:0] result_pipe_65;
reg [64:0] result_pipe_66;
reg [64:0] result_pipe_67;
reg [64:0] result_pipe_68;
reg [64:0] result_pipe_69;
reg [64:0] result_pipe_70;
reg [64:0] result_pipe_71;
reg [64:0] result_pipe_72;
reg [64:0] result_pipe_73;
reg [64:0] result_pipe_74;
reg [64:0] result_pipe_75;
reg [64:0] result_pipe_76;
reg [64:0] result_pipe_77;
reg [64:0] result_pipe_78;
reg [64:0] result_pipe_79;
reg [64:0] result_pipe_80;
reg [64:0] result_pipe_81;
reg [64:0] result_pipe_82;
reg [64:0] result_pipe_83;
reg [64:0] result_pipe_84;
reg [64:0] result_pipe_85;
reg [64:0] result_pipe_86;
reg [64:0] result_pipe_87;
reg [64:0] result_pipe_88;
reg [64:0] result_pipe_89;
reg [64:0] result_pipe_90;
reg [64:0] result_pipe_91;
reg [64:0] result_pipe_92;
reg [64:0] result_pipe_93;
reg [64:0] result_pipe_94;
reg [64:0] result_pipe_95;
reg [64:0] result_pipe_96;
reg [64:0] result_pipe_97;
reg [64:0] result_pipe_98;
reg [64:0] result_pipe_99;
reg [64:0] result_pipe_100;
reg [64:0] result_pipe_101;
reg [64:0] result_pipe_102;
reg [64:0] result_pipe_103;
reg [64:0] result_pipe_104;
reg [6