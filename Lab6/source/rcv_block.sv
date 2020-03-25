// $Id: $mg117
// File name:   rcv_block.sv
// Created:     2/25/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: UART Receiver Main file


module rcv_block(input wire clk, input wire n_rst, input wire serial_in, input wire data_read, output reg [7:0] rx_data, output reg data_ready, output reg overrun_error, output reg framing_error);

    reg [8:0] data;
    reg new_packet_detected;
    
    reg packet_done;
    
    reg sbc_clear;
    reg sbc_enable;
    reg load_buffer;
    reg enable_timer;
    reg shift_enable;
    reg new_package;

    start_bit_det A1 (.clk(clk), .n_rst(n_rst), .serial_in(serial_in), .start_bit_detected(new_packet_detected),.new_package_detected(new_package));

    rcu A2 (.clk(clk), .n_rst(n_rst), .new_packet_detected(new_packet_detected), .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), .enable_timer(enable_timer));
    
    timer A3 (.clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), .shift_enable(shift_enable), .packet_done(packet_done));

    sr_9bit A4 (.clk(clk), .n_rst(n_rst), .shift_strobe(shift_enable), .serial_in(serial_in), .packet_data(data));

    rx_data_buff A5 (.clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), .packet_data(data[7:0]), .data_read(data_read), .rx_data(rx_data), .data_ready(data_ready), .overrun_error(overrun_error));

    stop_bit_chk A7 (.clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), .sbc_enable(sbc_enable), .stop_bit(data[8]), .framing_error(framing_error));

endmodule
