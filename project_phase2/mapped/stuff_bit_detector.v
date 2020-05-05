/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 30 22:40:58 2020
/////////////////////////////////////////////////////////////


module flex_stp_sr_stuffbit ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [5:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n10, n12, n14, n16, n18, n20, n1, n2, n3, n4, n5, n6;

  DFFSR \parallel_out_reg[5]  ( .D(n20), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n18), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n16), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n14), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n12), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n10), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n20) );
  MUX2X1 U3 ( .B(parallel_out[5]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n18) );
  MUX2X1 U5 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n16) );
  MUX2X1 U7 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n14) );
  MUX2X1 U9 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n12) );
  MUX2X1 U11 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n10) );
  MUX2X1 U13 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n6) );
endmodule


module stuff_bit_detector ( clk, n_rst, d_orig, shift_enable, stuff_bit_detect
 );
  input clk, n_rst, d_orig, shift_enable;
  output stuff_bit_detect;
  wire   state, next_stuff_bit_detect, n7, n8, n9;
  wire   [5:0] parallel_out;

  flex_stp_sr_stuffbit SB ( .clk(clk), .n_rst(n_rst), .shift_enable(
        shift_enable), .serial_in(d_orig), .parallel_out(parallel_out) );
  DFFSR state_reg ( .D(next_stuff_bit_detect), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state) );
  DFFSR stuff_bit_detect_reg ( .D(next_stuff_bit_detect), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(stuff_bit_detect) );
  MUX2X1 U10 ( .B(n7), .A(shift_enable), .S(state), .Y(next_stuff_bit_detect)
         );
  OR2X1 U11 ( .A(n8), .B(n9), .Y(n7) );
  NAND3X1 U12 ( .A(parallel_out[4]), .B(parallel_out[3]), .C(parallel_out[5]), 
        .Y(n9) );
  NAND3X1 U13 ( .A(parallel_out[1]), .B(parallel_out[0]), .C(parallel_out[2]), 
        .Y(n8) );
endmodule

