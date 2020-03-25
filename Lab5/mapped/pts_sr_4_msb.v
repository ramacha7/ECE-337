/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Feb 14 11:59:27 2020
/////////////////////////////////////////////////////////////


module flex_pts_sr ( clk, n_rst, shift_enable, load_enable, parallel_in, 
        serial_out );
  input [3:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n17, n18, n19, n20, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [2:0] q;

  DFFSR \q_reg[0]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(q[0]) );
  DFFSR \q_reg[1]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(q[1]) );
  DFFSR \q_reg[2]  ( .D(n18), .CLK(clk), .R(1'b1), .S(n_rst), .Q(q[2]) );
  DFFSR \q_reg[3]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(serial_out)
         );
  NAND2X1 U7 ( .A(n5), .B(n6), .Y(n20) );
  MUX2X1 U8 ( .B(parallel_in[0]), .A(q[0]), .S(n7), .Y(n5) );
  OAI21X1 U9 ( .A(n7), .B(n8), .C(n9), .Y(n19) );
  AOI22X1 U10 ( .A(q[1]), .B(n10), .C(n11), .D(q[0]), .Y(n9) );
  INVX1 U11 ( .A(parallel_in[1]), .Y(n8) );
  OAI21X1 U12 ( .A(n7), .B(n12), .C(n13), .Y(n18) );
  AOI22X1 U13 ( .A(q[2]), .B(n10), .C(n11), .D(q[1]), .Y(n13) );
  INVX1 U14 ( .A(parallel_in[2]), .Y(n12) );
  OAI21X1 U15 ( .A(n7), .B(n14), .C(n15), .Y(n17) );
  AOI22X1 U16 ( .A(serial_out), .B(n10), .C(q[2]), .D(n11), .Y(n15) );
  NOR2X1 U17 ( .A(n11), .B(load_enable), .Y(n10) );
  INVX1 U18 ( .A(n6), .Y(n11) );
  NAND2X1 U19 ( .A(shift_enable), .B(n7), .Y(n6) );
  INVX1 U20 ( .A(parallel_in[3]), .Y(n14) );
  INVX1 U21 ( .A(load_enable), .Y(n7) );
endmodule


module pts_sr_4_msb ( clk, n_rst, shift_enable, load_enable, parallel_in, 
        serial_out );
  input [3:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;


  flex_pts_sr CORE ( .clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), 
        .load_enable(load_enable), .parallel_in(parallel_in), .serial_out(
        serial_out) );
endmodule

