/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Feb 12 04:10:00 2020
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125;

  DFFSR \count_out_reg[0]  ( .D(n75), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n74), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n73), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n72), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  MUX2X1 U67 ( .B(n76), .A(n77), .S(n78), .Y(n75) );
  OAI21X1 U68 ( .A(n79), .B(n80), .C(n81), .Y(n77) );
  MUX2X1 U69 ( .B(n82), .A(n83), .S(n84), .Y(n80) );
  NAND3X1 U70 ( .A(n85), .B(n86), .C(n87), .Y(n82) );
  NOR2X1 U71 ( .A(count_out[1]), .B(n88), .Y(n87) );
  NOR2X1 U72 ( .A(count_out[0]), .B(n89), .Y(n79) );
  MUX2X1 U73 ( .B(n90), .A(n91), .S(n92), .Y(n74) );
  NAND2X1 U74 ( .A(n93), .B(count_out[0]), .Y(n91) );
  INVX1 U75 ( .A(n94), .Y(n73) );
  MUX2X1 U76 ( .B(n95), .A(n96), .S(n85), .Y(n94) );
  MUX2X1 U77 ( .B(n97), .A(n98), .S(n86), .Y(n72) );
  NAND2X1 U78 ( .A(n96), .B(count_out[2]), .Y(n98) );
  INVX1 U79 ( .A(n99), .Y(n96) );
  NAND3X1 U80 ( .A(count_out[1]), .B(count_out[0]), .C(n93), .Y(n99) );
  AOI21X1 U81 ( .A(n93), .B(n85), .C(n95), .Y(n97) );
  OAI21X1 U82 ( .A(count_out[1]), .B(n100), .C(n90), .Y(n95) );
  AOI21X1 U83 ( .A(n76), .B(n93), .C(n101), .Y(n90) );
  INVX1 U84 ( .A(count_out[2]), .Y(n85) );
  INVX1 U85 ( .A(n100), .Y(n93) );
  NAND3X1 U86 ( .A(n78), .B(n81), .C(n83), .Y(n100) );
  INVX1 U87 ( .A(n101), .Y(n78) );
  OAI21X1 U88 ( .A(n102), .B(n103), .C(n104), .Y(n71) );
  OAI21X1 U89 ( .A(n89), .B(rollover_flag), .C(n101), .Y(n104) );
  NOR2X1 U90 ( .A(count_enable), .B(clear), .Y(n101) );
  INVX1 U91 ( .A(n83), .Y(n89) );
  NAND2X1 U92 ( .A(n105), .B(n81), .Y(n103) );
  INVX1 U93 ( .A(clear), .Y(n81) );
  OAI22X1 U94 ( .A(n84), .B(n83), .C(n106), .D(n107), .Y(n105) );
  NAND2X1 U95 ( .A(n108), .B(n109), .Y(n107) );
  MUX2X1 U96 ( .B(n110), .A(n111), .S(n112), .Y(n109) );
  NOR2X1 U97 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n110) );
  MUX2X1 U98 ( .B(n113), .A(n114), .S(n88), .Y(n108) );
  INVX1 U99 ( .A(rollover_val[0]), .Y(n88) );
  OAI21X1 U100 ( .A(n115), .B(n92), .C(count_out[0]), .Y(n114) );
  OAI21X1 U101 ( .A(count_out[1]), .B(n116), .C(n76), .Y(n113) );
  INVX1 U102 ( .A(count_out[0]), .Y(n76) );
  OAI21X1 U103 ( .A(n117), .B(n112), .C(n118), .Y(n106) );
  XNOR2X1 U104 ( .A(n119), .B(n86), .Y(n118) );
  INVX1 U105 ( .A(count_out[3]), .Y(n86) );
  OAI21X1 U106 ( .A(rollover_val[2]), .B(n112), .C(rollover_val[3]), .Y(n119)
         );
  INVX1 U107 ( .A(n115), .Y(n112) );
  NOR2X1 U108 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n115) );
  NOR2X1 U109 ( .A(n120), .B(n92), .Y(n117) );
  NAND3X1 U110 ( .A(n121), .B(n122), .C(n123), .Y(n83) );
  AOI21X1 U111 ( .A(rollover_val[1]), .B(n92), .C(n111), .Y(n123) );
  OAI21X1 U112 ( .A(rollover_val[1]), .B(n92), .C(n120), .Y(n111) );
  XNOR2X1 U113 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n120) );
  INVX1 U114 ( .A(count_out[1]), .Y(n92) );
  XNOR2X1 U115 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n122) );
  XNOR2X1 U116 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n121) );
  NAND3X1 U117 ( .A(n124), .B(n125), .C(n116), .Y(n84) );
  INVX1 U118 ( .A(rollover_val[1]), .Y(n116) );
  INVX1 U119 ( .A(rollover_val[3]), .Y(n125) );
  INVX1 U120 ( .A(rollover_val[2]), .Y(n124) );
  INVX1 U121 ( .A(count_enable), .Y(n102) );
endmodule

