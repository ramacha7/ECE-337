/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 30 22:39:48 2020
/////////////////////////////////////////////////////////////


module crc_checker ( clk, n_rst, shift_enable, start, data_in, crc_out );
  output [15:0] crc_out;
  input clk, n_rst, shift_enable, start, data_in;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, n21, n22, n23, n24;

  DFFSR \lfsr_reg[0]  ( .D(N6), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[0]) );
  DFFSR \lfsr_reg[1]  ( .D(N7), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[1]) );
  DFFSR \lfsr_reg[2]  ( .D(N8), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[2]) );
  DFFSR \lfsr_reg[3]  ( .D(N9), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[3]) );
  DFFSR \lfsr_reg[4]  ( .D(N10), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[4]) );
  DFFSR \lfsr_reg[5]  ( .D(N11), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[5]) );
  DFFSR \lfsr_reg[6]  ( .D(N12), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[6]) );
  DFFSR \lfsr_reg[7]  ( .D(N13), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[7]) );
  DFFSR \lfsr_reg[8]  ( .D(N14), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[8]) );
  DFFSR \lfsr_reg[9]  ( .D(N15), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[9]) );
  DFFSR \lfsr_reg[10]  ( .D(N16), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[10]) );
  DFFSR \lfsr_reg[11]  ( .D(N17), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[11]) );
  DFFSR \lfsr_reg[12]  ( .D(N18), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[12]) );
  DFFSR \lfsr_reg[13]  ( .D(N19), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[13]) );
  DFFSR \lfsr_reg[14]  ( .D(N20), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[14]) );
  DFFSR \lfsr_reg[15]  ( .D(N21), .CLK(shift_enable), .R(1'b1), .S(n_rst), .Q(
        crc_out[15]) );
  OR2X1 U39 ( .A(crc_out[2]), .B(n21), .Y(N9) );
  OR2X1 U40 ( .A(crc_out[1]), .B(n21), .Y(N8) );
  OR2X1 U41 ( .A(crc_out[0]), .B(n21), .Y(N7) );
  NAND2X1 U42 ( .A(n22), .B(start), .Y(N6) );
  OR2X1 U43 ( .A(crc_out[14]), .B(n21), .Y(N21) );
  OR2X1 U44 ( .A(crc_out[13]), .B(n21), .Y(N20) );
  OR2X1 U45 ( .A(crc_out[12]), .B(n21), .Y(N19) );
  NAND2X1 U46 ( .A(n23), .B(start), .Y(N18) );
  XOR2X1 U47 ( .A(n22), .B(crc_out[11]), .Y(n23) );
  OR2X1 U48 ( .A(crc_out[10]), .B(n21), .Y(N17) );
  OR2X1 U49 ( .A(crc_out[9]), .B(n21), .Y(N16) );
  OR2X1 U50 ( .A(crc_out[8]), .B(n21), .Y(N15) );
  OR2X1 U51 ( .A(crc_out[7]), .B(n21), .Y(N14) );
  OR2X1 U52 ( .A(crc_out[6]), .B(n21), .Y(N13) );
  OR2X1 U53 ( .A(crc_out[5]), .B(n21), .Y(N12) );
  NAND2X1 U54 ( .A(n24), .B(start), .Y(N11) );
  XOR2X1 U55 ( .A(n22), .B(crc_out[4]), .Y(n24) );
  XNOR2X1 U56 ( .A(data_in), .B(crc_out[15]), .Y(n22) );
  OR2X1 U57 ( .A(crc_out[3]), .B(n21), .Y(N10) );
  INVX1 U58 ( .A(start), .Y(n21) );
endmodule

