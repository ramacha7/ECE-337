/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 30 22:51:59 2020
/////////////////////////////////////////////////////////////


module first_flex_counter ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n41, n42, n43, n44, n45, n1, n2, n3, n4, n5, n6, n7, n8, n9, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;

  DFFSR \count_out_reg[0]  ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[2]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[1]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U7 ( .A(count_enable), .B(clear), .C(n1), .Y(n45) );
  INVX1 U9 ( .A(n2), .Y(n1) );
  OAI22X1 U10 ( .A(n3), .B(n4), .C(n5), .D(count_out[0]), .Y(n2) );
  INVX1 U11 ( .A(n6), .Y(n3) );
  OAI21X1 U12 ( .A(n7), .B(n5), .C(n6), .Y(n44) );
  XNOR2X1 U13 ( .A(count_out[0]), .B(count_out[1]), .Y(n7) );
  OAI21X1 U14 ( .A(n8), .B(n5), .C(n6), .Y(n43) );
  XNOR2X1 U15 ( .A(n9), .B(n15), .Y(n8) );
  NOR2X1 U16 ( .A(n16), .B(n5), .Y(n42) );
  NAND2X1 U17 ( .A(n6), .B(n4), .Y(n5) );
  NAND3X1 U18 ( .A(n17), .B(n18), .C(n19), .Y(n4) );
  AOI21X1 U19 ( .A(rollover_val[1]), .B(n20), .C(n21), .Y(n19) );
  XNOR2X1 U20 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n18) );
  XNOR2X1 U21 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n17) );
  XNOR2X1 U22 ( .A(count_out[3]), .B(n22), .Y(n16) );
  NOR2X1 U23 ( .A(n15), .B(n9), .Y(n22) );
  NAND2X1 U24 ( .A(count_out[0]), .B(count_out[1]), .Y(n9) );
  INVX1 U25 ( .A(count_out[2]), .Y(n15) );
  NOR2X1 U26 ( .A(n23), .B(n24), .Y(n41) );
  NAND2X1 U27 ( .A(n25), .B(n26), .Y(n24) );
  MUX2X1 U28 ( .B(n27), .A(n21), .S(n28), .Y(n26) );
  OAI21X1 U29 ( .A(rollover_val[1]), .B(n20), .C(n29), .Y(n21) );
  NOR2X1 U30 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n27) );
  MUX2X1 U31 ( .B(n30), .A(n31), .S(rollover_val[0]), .Y(n25) );
  INVX1 U32 ( .A(n32), .Y(n31) );
  AOI21X1 U33 ( .A(n20), .B(rollover_val[1]), .C(count_out[0]), .Y(n32) );
  OAI21X1 U34 ( .A(n33), .B(n20), .C(count_out[0]), .Y(n30) );
  NAND3X1 U35 ( .A(n34), .B(n35), .C(n6), .Y(n23) );
  NOR2X1 U36 ( .A(n36), .B(clear), .Y(n6) );
  INVX1 U37 ( .A(count_enable), .Y(n36) );
  OAI21X1 U38 ( .A(n29), .B(n20), .C(n33), .Y(n35) );
  INVX1 U39 ( .A(count_out[1]), .Y(n20) );
  XNOR2X1 U40 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n29) );
  XOR2X1 U41 ( .A(n37), .B(count_out[3]), .Y(n34) );
  OAI21X1 U42 ( .A(rollover_val[2]), .B(n28), .C(rollover_val[3]), .Y(n37) );
  INVX1 U43 ( .A(n33), .Y(n28) );
  NOR2X1 U44 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n33) );
endmodule


module second_flex_counter ( clk, n_rst, clear, count_enable, stuff_bit, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable, stuff_bit;
  output rollover_flag;
  wire   n59, n60, n61, n62, n63, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47;

  DFFSR \count_out_reg[0]  ( .D(n63), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[3]  ( .D(n60), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[1]  ( .D(n62), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n61), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR rollover_flag_reg ( .D(n59), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  MUX2X1 U8 ( .B(n1), .A(n2), .S(n3), .Y(n63) );
  OAI21X1 U9 ( .A(n4), .B(n1), .C(n5), .Y(n2) );
  MUX2X1 U10 ( .B(n6), .A(n7), .S(n8), .Y(n62) );
  NAND2X1 U11 ( .A(n9), .B(count_out[0]), .Y(n7) );
  INVX1 U12 ( .A(n10), .Y(n61) );
  MUX2X1 U13 ( .B(n11), .A(n12), .S(n18), .Y(n10) );
  MUX2X1 U14 ( .B(n19), .A(n20), .S(count_out[3]), .Y(n60) );
  AOI21X1 U15 ( .A(n9), .B(n18), .C(n11), .Y(n20) );
  OAI21X1 U16 ( .A(count_out[1]), .B(n21), .C(n6), .Y(n11) );
  INVX1 U17 ( .A(n22), .Y(n6) );
  OAI21X1 U18 ( .A(count_out[0]), .B(n21), .C(n3), .Y(n22) );
  INVX1 U19 ( .A(count_out[2]), .Y(n18) );
  NAND2X1 U20 ( .A(n12), .B(count_out[2]), .Y(n19) );
  INVX1 U21 ( .A(n23), .Y(n12) );
  NAND3X1 U22 ( .A(count_out[0]), .B(count_out[1]), .C(n9), .Y(n23) );
  INVX1 U23 ( .A(n21), .Y(n9) );
  NAND3X1 U24 ( .A(n24), .B(n5), .C(n3), .Y(n21) );
  AOI21X1 U25 ( .A(n25), .B(n5), .C(stuff_bit), .Y(n3) );
  OAI21X1 U26 ( .A(n26), .B(n27), .C(n28), .Y(n59) );
  OAI21X1 U27 ( .A(n29), .B(stuff_bit), .C(rollover_flag), .Y(n28) );
  NOR2X1 U28 ( .A(n4), .B(n30), .Y(n29) );
  NAND2X1 U29 ( .A(n5), .B(n25), .Y(n30) );
  INVX1 U30 ( .A(count_enable), .Y(n25) );
  INVX1 U31 ( .A(clear), .Y(n5) );
  INVX1 U32 ( .A(n24), .Y(n4) );
  NAND3X1 U33 ( .A(n31), .B(n32), .C(n33), .Y(n24) );
  AOI21X1 U34 ( .A(rollover_val[1]), .B(n8), .C(n34), .Y(n33) );
  XNOR2X1 U35 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n32) );
  XNOR2X1 U36 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n31) );
  NAND3X1 U37 ( .A(n35), .B(count_enable), .C(n36), .Y(n27) );
  MUX2X1 U38 ( .B(n37), .A(n38), .S(rollover_val[0]), .Y(n36) );
  OAI21X1 U39 ( .A(count_out[1]), .B(n39), .C(n1), .Y(n38) );
  INVX1 U40 ( .A(count_out[0]), .Y(n1) );
  INVX1 U41 ( .A(rollover_val[1]), .Y(n39) );
  OAI21X1 U42 ( .A(n40), .B(n8), .C(count_out[0]), .Y(n37) );
  MUX2X1 U43 ( .B(n41), .A(n34), .S(n42), .Y(n35) );
  OAI21X1 U44 ( .A(rollover_val[1]), .B(n8), .C(n43), .Y(n34) );
  NOR2X1 U45 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n41) );
  NAND3X1 U46 ( .A(n44), .B(n45), .C(n46), .Y(n26) );
  NOR2X1 U47 ( .A(stuff_bit), .B(clear), .Y(n46) );
  OAI21X1 U48 ( .A(n43), .B(n8), .C(n40), .Y(n45) );
  INVX1 U49 ( .A(count_out[1]), .Y(n8) );
  XNOR2X1 U50 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n43) );
  XOR2X1 U51 ( .A(n47), .B(count_out[3]), .Y(n44) );
  OAI21X1 U52 ( .A(rollover_val[2]), .B(n42), .C(rollover_val[3]), .Y(n47) );
  INVX1 U53 ( .A(n40), .Y(n42) );
  NOR2X1 U54 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n40) );
endmodule


module timer ( clk, n_rst, d_edge, rcving, clear, stuff_bit, shift_enable, 
        byte_received, count );
  output [3:0] count;
  input clk, n_rst, d_edge, rcving, clear, stuff_bit;
  output shift_enable, byte_received;


  first_flex_counter FC1 ( .clk(clk), .n_rst(n_rst), .clear(d_edge), 
        .count_enable(rcving), .rollover_val({1'b1, 1'b0, 1'b0, 1'b0}), 
        .rollover_flag(shift_enable) );
  second_flex_counter FC2 ( .clk(clk), .n_rst(n_rst), .clear(clear), 
        .count_enable(shift_enable), .stuff_bit(stuff_bit), .rollover_val({
        1'b1, 1'b0, 1'b0, 1'b0}), .count_out(count), .rollover_flag(
        byte_received) );
endmodule

