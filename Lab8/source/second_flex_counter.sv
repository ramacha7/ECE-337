// $Id: $mg117
// File name:   second_flex_counter.sv
// Created:     2/25/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Second Flex Counter

module second_flex_counter
(
  input wire clk,
  input wire n_rst,
  input wire clear,
  input wire shift_strobe,
  input wire[3:0] rollover_val,
  output reg packet_done
);

  reg [3:0] count;
  flex_counter CORE(.clk(clk),.n_rst(n_rst),.clear(clear),.count_enable(shift_strobe),.rollover_val(rollover_val),.count_out(count),.rollover_flag(packet_done));

endmodule
