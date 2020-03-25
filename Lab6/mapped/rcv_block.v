/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb 27 14:52:46 2020
/////////////////////////////////////////////////////////////


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected, 
        new_package_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected, new_package_detected;
  wire   start_bit_detected, old_sample, new_sample, sync_phase, n4;
  assign new_package_detected = start_bit_detected;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module rcu ( clk, n_rst, new_packet_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, new_packet_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n36, n37, n38, n39, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n40;
  wire   [2:0] state;
  wire   [2:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR enable_timer_reg ( .D(n39), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        enable_timer) );
  DFFSR sbc_clear_reg ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sbc_clear)
         );
  DFFSR sbc_enable_reg ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sbc_enable) );
  DFFSR load_buffer_reg ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        load_buffer) );
  OAI21X1 U10 ( .A(n8), .B(n9), .C(n10), .Y(next_state[2]) );
  NAND3X1 U11 ( .A(state[0]), .B(n11), .C(state[1]), .Y(n10) );
  OAI21X1 U12 ( .A(n12), .B(n13), .C(n14), .Y(next_state[1]) );
  AOI21X1 U13 ( .A(n15), .B(state[1]), .C(n16), .Y(n14) );
  INVX1 U14 ( .A(n17), .Y(n15) );
  INVX1 U15 ( .A(packet_done), .Y(n13) );
  OR2X1 U16 ( .A(n18), .B(n19), .Y(next_state[0]) );
  OAI22X1 U17 ( .A(n20), .B(n21), .C(packet_done), .D(n12), .Y(n19) );
  INVX1 U18 ( .A(new_packet_detected), .Y(n21) );
  OAI21X1 U19 ( .A(n22), .B(n17), .C(n23), .Y(n18) );
  OAI21X1 U20 ( .A(n20), .B(n24), .C(n25), .Y(n39) );
  NAND2X1 U21 ( .A(enable_timer), .B(n26), .Y(n25) );
  OAI21X1 U22 ( .A(n20), .B(n24), .C(n27), .Y(n38) );
  NAND2X1 U23 ( .A(sbc_clear), .B(n26), .Y(n27) );
  OAI21X1 U24 ( .A(n28), .B(n29), .C(n30), .Y(n37) );
  OAI21X1 U25 ( .A(n16), .B(n31), .C(n32), .Y(n30) );
  INVX1 U26 ( .A(n23), .Y(n16) );
  INVX1 U27 ( .A(sbc_enable), .Y(n29) );
  INVX1 U28 ( .A(n26), .Y(n28) );
  OAI21X1 U29 ( .A(n33), .B(n34), .C(n35), .Y(n36) );
  NAND2X1 U30 ( .A(load_buffer), .B(n26), .Y(n35) );
  NAND2X1 U31 ( .A(n32), .B(n17), .Y(n26) );
  OAI21X1 U32 ( .A(state[1]), .B(state[0]), .C(n40), .Y(n17) );
  AND2X1 U33 ( .A(n33), .B(n23), .Y(n40) );
  NAND3X1 U34 ( .A(n22), .B(n9), .C(state[1]), .Y(n23) );
  INVX1 U35 ( .A(state[0]), .Y(n22) );
  INVX1 U36 ( .A(n24), .Y(n32) );
  OAI22X1 U37 ( .A(new_packet_detected), .B(n20), .C(packet_done), .D(n12), 
        .Y(n24) );
  INVX1 U38 ( .A(n31), .Y(n12) );
  NOR2X1 U39 ( .A(n33), .B(state[1]), .Y(n31) );
  NAND2X1 U40 ( .A(n8), .B(n9), .Y(n20) );
  NOR2X1 U41 ( .A(state[1]), .B(state[0]), .Y(n8) );
  NAND2X1 U42 ( .A(state[1]), .B(n11), .Y(n34) );
  INVX1 U43 ( .A(framing_error), .Y(n11) );
  NAND2X1 U44 ( .A(state[0]), .B(n9), .Y(n33) );
  INVX1 U45 ( .A(state[2]), .Y(n9) );
endmodule


module first_flex_counter ( clk, n_rst, enable_timer, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, enable_timer;
  output rollover_flag;
  wire   next_rollover_flag, n1, n2, n3, n4, n5, n6, n7, n8, n9, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35;
  wire   [3:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR rollover_flag_reg ( .D(next_rollover_flag), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(rollover_flag) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  NOR2X1 U7 ( .A(n1), .B(n2), .Y(next_rollover_flag) );
  NAND2X1 U9 ( .A(n3), .B(n4), .Y(n2) );
  MUX2X1 U10 ( .B(n5), .A(n6), .S(n7), .Y(n4) );
  NOR2X1 U11 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n5) );
  MUX2X1 U12 ( .B(n8), .A(n9), .S(n15), .Y(n3) );
  INVX1 U13 ( .A(rollover_val[0]), .Y(n15) );
  OAI21X1 U14 ( .A(n16), .B(n17), .C(count_out[0]), .Y(n9) );
  OAI21X1 U15 ( .A(count_out[1]), .B(n18), .C(n19), .Y(n8) );
  INVX1 U16 ( .A(count_out[0]), .Y(n19) );
  INVX1 U17 ( .A(rollover_val[1]), .Y(n18) );
  NAND3X1 U18 ( .A(n20), .B(n21), .C(enable_timer), .Y(n1) );
  OAI21X1 U19 ( .A(n22), .B(n17), .C(n16), .Y(n21) );
  XOR2X1 U20 ( .A(n23), .B(count_out[3]), .Y(n20) );
  OAI21X1 U21 ( .A(rollover_val[2]), .B(n7), .C(rollover_val[3]), .Y(n23) );
  INVX1 U22 ( .A(n16), .Y(n7) );
  NOR2X1 U23 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n16) );
  OAI21X1 U24 ( .A(n24), .B(n25), .C(enable_timer), .Y(next_count[3]) );
  XNOR2X1 U25 ( .A(count_out[3]), .B(n26), .Y(n24) );
  NOR2X1 U26 ( .A(n27), .B(n28), .Y(n26) );
  NOR2X1 U27 ( .A(n29), .B(n25), .Y(next_count[2]) );
  XNOR2X1 U28 ( .A(n28), .B(n27), .Y(n29) );
  INVX1 U29 ( .A(count_out[2]), .Y(n27) );
  NAND2X1 U30 ( .A(count_out[0]), .B(count_out[1]), .Y(n28) );
  NOR2X1 U31 ( .A(n30), .B(n25), .Y(next_count[1]) );
  XNOR2X1 U32 ( .A(count_out[0]), .B(count_out[1]), .Y(n30) );
  OAI22X1 U33 ( .A(count_out[0]), .B(n25), .C(n31), .D(n32), .Y(next_count[0])
         );
  INVX1 U34 ( .A(enable_timer), .Y(n31) );
  NAND2X1 U35 ( .A(enable_timer), .B(n32), .Y(n25) );
  NAND3X1 U36 ( .A(n33), .B(n34), .C(n35), .Y(n32) );
  AOI21X1 U37 ( .A(rollover_val[1]), .B(n17), .C(n6), .Y(n35) );
  OAI21X1 U38 ( .A(rollover_val[1]), .B(n17), .C(n22), .Y(n6) );
  XNOR2X1 U39 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n22) );
  INVX1 U40 ( .A(count_out[1]), .Y(n17) );
  XNOR2X1 U41 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n34) );
  XNOR2X1 U42 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n33) );
endmodule


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n55, n56, n57, n58, n59, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  DFFSR \count_out_reg[0]  ( .D(n59), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[3]  ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(n57), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n58), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U8 ( .A(n1), .B(n2), .C(n3), .Y(n59) );
  OAI21X1 U9 ( .A(n4), .B(n1), .C(n5), .Y(n3) );
  INVX1 U10 ( .A(n6), .Y(n4) );
  MUX2X1 U11 ( .B(n7), .A(n8), .S(n9), .Y(n58) );
  NAND2X1 U12 ( .A(n10), .B(count_out[0]), .Y(n8) );
  INVX1 U13 ( .A(n11), .Y(n57) );
  MUX2X1 U14 ( .B(n12), .A(n18), .S(n19), .Y(n11) );
  MUX2X1 U15 ( .B(n20), .A(n21), .S(count_out[3]), .Y(n56) );
  AOI21X1 U16 ( .A(n10), .B(n19), .C(n12), .Y(n21) );
  OAI21X1 U17 ( .A(count_out[1]), .B(n22), .C(n7), .Y(n12) );
  AOI21X1 U18 ( .A(n1), .B(n10), .C(n23), .Y(n7) );
  INVX1 U19 ( .A(count_out[2]), .Y(n19) );
  NAND2X1 U20 ( .A(n18), .B(count_out[2]), .Y(n20) );
  INVX1 U21 ( .A(n24), .Y(n18) );
  NAND3X1 U22 ( .A(count_out[0]), .B(count_out[1]), .C(n10), .Y(n24) );
  INVX1 U23 ( .A(n22), .Y(n10) );
  NAND2X1 U24 ( .A(n5), .B(n6), .Y(n22) );
  OAI21X1 U25 ( .A(n25), .B(n26), .C(n27), .Y(n55) );
  NAND2X1 U26 ( .A(rollover_flag), .B(n23), .Y(n27) );
  INVX1 U27 ( .A(n2), .Y(n23) );
  NAND3X1 U28 ( .A(n28), .B(n29), .C(n6), .Y(n2) );
  NAND3X1 U29 ( .A(n30), .B(n31), .C(n32), .Y(n6) );
  AOI21X1 U30 ( .A(rollover_val[1]), .B(n9), .C(n33), .Y(n32) );
  XNOR2X1 U31 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n31) );
  XNOR2X1 U32 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n30) );
  INVX1 U33 ( .A(clear), .Y(n28) );
  NAND2X1 U34 ( .A(n34), .B(n35), .Y(n26) );
  MUX2X1 U35 ( .B(n36), .A(n33), .S(n37), .Y(n35) );
  OAI21X1 U36 ( .A(rollover_val[1]), .B(n9), .C(n38), .Y(n33) );
  NOR2X1 U37 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n36) );
  MUX2X1 U38 ( .B(n39), .A(n40), .S(rollover_val[0]), .Y(n34) );
  OAI21X1 U39 ( .A(count_out[1]), .B(n41), .C(n1), .Y(n40) );
  INVX1 U40 ( .A(count_out[0]), .Y(n1) );
  INVX1 U41 ( .A(rollover_val[1]), .Y(n41) );
  OAI21X1 U42 ( .A(n42), .B(n9), .C(count_out[0]), .Y(n39) );
  NAND3X1 U43 ( .A(n43), .B(n44), .C(n5), .Y(n25) );
  NOR2X1 U44 ( .A(n29), .B(clear), .Y(n5) );
  INVX1 U45 ( .A(count_enable), .Y(n29) );
  OAI21X1 U46 ( .A(n38), .B(n9), .C(n42), .Y(n44) );
  INVX1 U47 ( .A(count_out[1]), .Y(n9) );
  XNOR2X1 U48 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n38) );
  XOR2X1 U49 ( .A(n45), .B(count_out[3]), .Y(n43) );
  OAI21X1 U50 ( .A(rollover_val[2]), .B(n37), .C(rollover_val[3]), .Y(n45) );
  INVX1 U51 ( .A(n42), .Y(n37) );
  NOR2X1 U52 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n42) );
endmodule


module second_flex_counter ( clk, n_rst, clear, shift_strobe, rollover_val, 
        packet_done );
  input [3:0] rollover_val;
  input clk, n_rst, clear, shift_strobe;
  output packet_done;


  flex_counter CORE ( .clk(clk), .n_rst(n_rst), .clear(clear), .count_enable(
        shift_strobe), .rollover_val(rollover_val), .rollover_flag(packet_done) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_enable, packet_done );
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;


  first_flex_counter C1 ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), .rollover_flag(shift_enable) );
  second_flex_counter C2 ( .clk(clk), .n_rst(n_rst), .clear(1'b0), 
        .shift_strobe(shift_enable), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .packet_done(packet_done) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, serial_in, shift_strobe, packet_data );
  output [8:0] packet_data;
  input clk, n_rst, serial_in, shift_strobe;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 CORE ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out(
        packet_data) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   new_packet_detected, packet_done, sbc_clear, sbc_enable, load_buffer,
         enable_timer, shift_enable;
  wire   [8:0] data;

  start_bit_det A1 ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .start_bit_detected(new_packet_detected) );
  rcu A2 ( .clk(clk), .n_rst(n_rst), .new_packet_detected(new_packet_detected), 
        .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), 
        .enable_timer(enable_timer) );
  timer A3 ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .shift_enable(shift_enable), .packet_done(packet_done) );
  sr_9bit A4 ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), .shift_strobe(
        shift_enable), .packet_data(data) );
  rx_data_buff A5 ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), 
        .packet_data(data[7:0]), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
  stop_bit_chk A7 ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(data[8]), .framing_error(
        framing_error) );
endmodule

