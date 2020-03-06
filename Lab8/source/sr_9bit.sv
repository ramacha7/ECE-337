// $Id: $
// File name:   stp_sr_4_msb.sv
// Created:     9/14/2018
// Author:      Tim Pritchett
// Lab Section: 9999
// Version:     1.0  Initial Design Entry
// Description: 4-bit MSB Serial to Parallel shift register 
//              (Defaults for Flex StP SR)

module sr_9bit
(
  input wire clk,
  input wire n_rst,
  input wire serial_in,
  input wire shift_strobe,
  output wire [8:0] packet_data
);

flex_stp_sr #(9,0) CORE (.clk(clk),.n_rst(n_rst),.serial_in(serial_in),.shift_enable(shift_strobe),.parallel_out(packet_data));

endmodule
