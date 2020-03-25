// $Id: $mg117
// File name:   timer.sv
// Created:     2/25/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Timing Controller


module timer(input wire clk, input wire n_rst,input reg[3:0] data_size, input reg[13:0] bit_period, input wire enable_timer, output wire shift_enable, output wire packet_done);

    reg [13:0] count;
    reg clear;
    
    first_flex_counter C1 (.clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), .rollover_val(bit_period), .count_out(count), .rollover_flag(shift_enable));

    //second_flex_counter C2 (.clk(clk), .n_rst(n_rst), .clear(clear), .shift_strobe(shift_enable), .rollover_val(rollover_val), .packet_done(packet_done));

    second_flex_counter C2 (.clk(clk), .n_rst(n_rst), .clear(clear), .shift_strobe(shift_enable), .rollover_val(data_size + 2'd2), .packet_done(packet_done));






endmodule
