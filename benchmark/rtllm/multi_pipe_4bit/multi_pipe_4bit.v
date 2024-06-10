 module multi_pipe_4bit(
									clk,
									rst_n,
									mul_a,
									mul_b,
									mul_out
									);
//parameter size = 4;
input clk;
input rst_n;
input [3:0] mul_a;
input [3:0] mul_b;
output [7:0] mul_out;
reg [7:0] mul_out;
reg [7:0] partial_prod_0;
reg [7:0] partial_prod_1;
reg [7:0] partial_prod_2;
reg [7:0] partial_prod_3;
reg [7:0] partial_prod_4;
reg [7:0] partial_prod_5;
reg [7:0] partial_prod_6;
reg [7:0] partial_prod_7;
reg [7:0] partial_prod_8;
reg [7:0] partial_prod_9;
reg [7:0] partial_prod_10;
reg [7:0] partial_prod_11;
reg [7:0] partial_prod_12;
reg [7:0] partial_prod_13;
reg [7:0] partial_prod_14;
reg [7:0] partial_prod_15;
reg [7:0] partial_prod_16;
reg [7:0] partial_prod_17;
reg [7:0] partial_prod_18;
reg [7:0] partial_prod_19;
reg [7:0] partial_prod_20;
reg [7:0] partial_prod_21;
reg [7:0] partial_prod_22;
reg [7:0] partial_prod_23;
reg [7:0] partial_prod_24;
reg [7:0] partial_prod_25;
reg [7:0] partial_prod_26;
reg [7:0] partial_prod_27;
reg [7:0] partial_prod_28;
reg [7:0] partial_prod_29;
reg [7:0] partial_prod_30;
reg [7:0] partial_prod_31;
reg [7:0] partial_prod_32;
reg [7:0] partial_prod_33;
reg [7:0] partial_prod_34;
reg [7:0] partial_prod_35;
reg [7:0] partial_prod_36;
reg [7:0] partial_prod_37;
reg [7:0] partial_prod_38;
reg [7:0] partial_prod_39;
reg [7:0] partial_prod_40;
reg [7:0] partial_prod_41;
reg [7:0] partial_prod_42;
reg [7:0] partial_prod_43;
reg [7:0] partial_prod_44;
reg [7:0] partial_prod_45;
reg [7:0] partial_prod_46;
reg [7:0] partial_prod_47;
reg [7:0] partial_prod_48;
reg [7:0] partial_prod_49;
reg [7:0] partial_prod_50;
reg [7:0] partial_prod_51;
reg [7:0] partial_prod_52;
reg [7:0] partial_prod_53;
reg [7:0] partial_prod_54;
reg [7:0] partial_prod_55;
reg [7:0] partial_prod_56;
reg [7:0] partial_prod_57;
reg [7:0] partial_prod_58;
reg [7:0] partial_prod_59;
reg [7:0] partial_prod_60;
reg [7:0] partial_prod_61;
reg [7:0] partial_prod_62;
reg [7:0] partial_prod_63;
reg [7:0] partial_prod_64;
reg [7:0] partial_prod_65;
reg [7:0] partial_prod_66;
reg [7:0] partial_prod_67;
reg [7:0] partial_prod_68;
reg [7:0] partial_prod_69;
reg [7:0] partial_prod_70;
reg [7:0] partial_prod_71;
reg [7:0] partial_prod_72;
reg [7:0] partial_prod_73;
reg [7:0] partial_prod_74;
reg [7:0] partial_prod_75;
reg [7:0] partial_prod_76;
reg [7:0] partial_prod_77;
reg [7:0] partial_prod_78;
reg [7:0] partial_prod_79;
reg [7:0] partial_prod_80;
reg [7:0] partial_prod_81;
reg [7:0] partial_prod_82;
reg [7:0] partial_prod_83;
reg [7:0] partial_prod_84;
reg [7:0] partial_prod_85;
reg [7:0] partial_prod_86;
reg [7:0] partial_prod_87;
reg [7:0] partial_prod_88;
reg [7:0] partial_prod_89;
reg [7:0] partial_prod_90;
reg [7:0] partial_prod_91;
reg [7:0] partial_prod_92;
reg [7:0] partial_prod_93;
reg [7:0] partial_prod_94;
reg [7:0] partial_prod_