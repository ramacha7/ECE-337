/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 30 22:36:45 2020
/////////////////////////////////////////////////////////////


module eop_detect ( d_plus, d_minus, eop );
  input d_plus, d_minus;
  output eop;
  wire   N0;
  assign eop = N0;

  NOR2X1 U2 ( .A(d_plus), .B(d_minus), .Y(N0) );
endmodule

