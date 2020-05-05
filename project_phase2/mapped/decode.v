/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 30 21:57:40 2020
/////////////////////////////////////////////////////////////


module decode ( clk, n_rst, d_plus, shift_enable, eop, d_orig );
  input clk, n_rst, d_plus, shift_enable, eop;
  output d_orig;
  wire   Q1, Q2, Q1next, n6, n7, n8, n9;

  DFFSR Q1_reg ( .D(Q1next), .CLK(clk), .R(1'b1), .S(n_rst), .Q(Q1) );
  DFFSR Q2_reg ( .D(n6), .CLK(clk), .R(1'b1), .S(n_rst), .Q(Q2) );
  MUX2X1 U11 ( .B(n7), .A(n8), .S(shift_enable), .Y(n6) );
  NOR2X1 U12 ( .A(Q1), .B(eop), .Y(n8) );
  XOR2X1 U13 ( .A(Q1), .B(n7), .Y(d_orig) );
  INVX1 U14 ( .A(Q2), .Y(n7) );
  INVX1 U15 ( .A(n9), .Y(Q1next) );
  AOI21X1 U16 ( .A(shift_enable), .B(eop), .C(d_plus), .Y(n9) );
endmodule

