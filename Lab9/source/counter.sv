// $Id: $
// File name:   counter.sv
// Created:     3/3/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Counter Unit that counts until 1000 samples have been processed

module counter(input wire clk, input wire n_rst, input wire cnt_up, input wire clear, output reg one_k_samples);

reg [9:0] count;

flex_counter C1 (.clk(clk), .n_rst(n_rst),.clear(clear), .count_enable(cnt_up), .rollover_val(10'd1000), .count_out(count), .rollover_flag(one_k_samples));

endmodule
