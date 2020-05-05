/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 30 22:43:10 2020
/////////////////////////////////////////////////////////////


module edge_detect ( clk, n_rst, d_plus, d_edge );
  input clk, n_rst, d_plus;
  output d_edge;
  wire   Q1, Q2, N1;
  assign d_edge = N1;

  DFFSR Q1_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(Q1) );
  DFFSR Q2_reg ( .D(Q1), .CLK(clk), .R(1'b1), .S(n_rst), .Q(Q2) );
  XOR2X1 U6 ( .A(Q2), .B(Q1), .Y(N1) );
endmodule

