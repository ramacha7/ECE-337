// $Id: $mg117
// File name:   usb_receiver.sv
// Created:     4/21/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Main File for USB Receiver Design

module usb_receiver(input wire clk, input wire n_rst, input reg d_plus, input reg d_minus, input reg r_enable, output reg [7:0] r_data, output reg empty, output reg full, output reg rcving, output reg r_error, output logic[3:0] PID, output reg[15:0] crc_out);

reg d_plus_sync;
reg d_minus_sync;
reg d_edge;
reg eop;
reg shift_enable;
reg d_orig;
reg clear;
reg byte_received;
reg [7:0] rcv_data;
reg [3:0] count;
reg w_enable;
reg [7:0] w_data;
reg stuff_bit;
reg shift_sr;
reg start;

always_comb begin
    shift_sr = (shift_enable & (!stuff_bit));
end

sync_high SH (.clk(clk), .n_rst(n_rst), .async_in(d_plus), .sync_out(d_plus_sync));

sync_low SL (.clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(d_minus_sync));

edge_detect ED (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), .d_edge(d_edge));

eop_detect EOP (.d_plus(d_plus_sync), .d_minus(d_minus_sync), .eop(eop));

decode DEC (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), .shift_enable(shift_enable), .eop(eop), .d_orig(d_orig));

stuff_bit_detector SBD (.clk(clk), .n_rst(n_rst), .d_orig(d_orig), .shift_enable(shift_enable), .stuff_bit_detect(stuff_bit));

timer TIM (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .rcving(rcving), .clear(clear), .stuff_bit(stuff_bit), .shift_enable(shift_enable), .byte_received(byte_received), .count(count));

shift_register SR (.clk(clk), .n_rst(n_rst), .shift_enable(shift_sr), .d_orig(d_orig), .rcv_data(rcv_data));

rcu RCU (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .eop(eop), .shift_enable(shift_enable), .rcv_data(rcv_data), .byte_received(byte_received), .count(count), .rcving(rcving), .w_enable(w_enable), .r_error(r_error), .clear(clear), .PID(PID), .start(start));

rx_fifo RX (.clk(clk), .n_rst(n_rst), .r_enable(r_enable), .w_enable(w_enable), .w_data(rcv_data), .r_data(r_data), .empty(empty), .full(full));

crc_checker CRC (.clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), .start(start), .data_in(d_orig), .crc_out(crc_out));

endmodule
