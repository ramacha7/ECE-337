// $Id: $mg117
// File name:   shift_register.sv
// Created:     4/21/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Design for Shift register

module shift_register(input wire clk, input wire n_rst, input reg shift_enable, input reg d_orig, output reg[7:0] rcv_data);

flex_stp_sr SR (.clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), .serial_in(d_orig), .parallel_out(rcv_data));
 
endmodule
