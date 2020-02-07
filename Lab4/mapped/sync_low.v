/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Feb  7 11:50:43 2020
/////////////////////////////////////////////////////////////


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   meta;

  DFFSR meta_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(meta) );
  DFFSR sync_out_reg ( .D(meta), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule

