// $Id: $mg117
// File name:   timer.sv
// Created:     4/21/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Design for timer block made of two flex counters

module timer(input wire clk, input wire n_rst, input reg d_edge, input reg rcving, input reg clear, output reg shift_enable, output reg byte_received, output reg [3:0] count);

reg [3:0] count1;

first_flex_counter FC1 (.clk(clk), .n_rst(n_rst), .clear(d_edge), .count_enable(rcving), .rollover_val(4'b1000), .count_out(count1), .rollover_flag(shift_enable));

second_flex_counter FC2 (.clk(clk), .n_rst(n_rst), .clear(clear), .count_enable(shift_enable), .rollover_val(4'b1000), .count_out(count), .rollover_flag(byte_received));

endmodule
