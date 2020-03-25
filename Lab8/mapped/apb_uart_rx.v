/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Mar 25 01:03:08 2020
/////////////////////////////////////////////////////////////


module apb_slave ( clk, n_rst, rx_data, data_ready, overrun_error, 
        framing_error, psel, paddr, penable, pwrite, pwdata, data_read, prdata, 
        pslverr, data_size, bit_period );
  input [7:0] rx_data;
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   dr_reg, \next_ds_reg[1] , n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145;
  wire   [1:0] err_reg;
  wire   [7:0] next_prdata;
  wire   [13:0] next_bp_reg;

  DFFSR \bp_reg_reg[13]  ( .D(n135), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[13]) );
  DFFSR \bp_reg_reg[12]  ( .D(next_bp_reg[12]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[12]) );
  DFFSR \bp_reg_reg[11]  ( .D(n136), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[11]) );
  DFFSR \bp_reg_reg[10]  ( .D(n137), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[10]) );
  DFFSR \bp_reg_reg[9]  ( .D(n138), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[9]) );
  DFFSR \bp_reg_reg[8]  ( .D(next_bp_reg[8]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[8]) );
  DFFSR \bp_reg_reg[7]  ( .D(next_bp_reg[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[7]) );
  DFFSR \bp_reg_reg[6]  ( .D(next_bp_reg[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[6]) );
  DFFSR \bp_reg_reg[5]  ( .D(n139), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[5]) );
  DFFSR \bp_reg_reg[4]  ( .D(n140), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[4]) );
  DFFSR \bp_reg_reg[3]  ( .D(n141), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[3]) );
  DFFSR \bp_reg_reg[2]  ( .D(n142), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[2]) );
  DFFSR \bp_reg_reg[1]  ( .D(next_bp_reg[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[1]) );
  DFFSR \bp_reg_reg[0]  ( .D(next_bp_reg[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[0]) );
  DFFSR dr_reg_reg ( .D(data_ready), .CLK(clk), .R(n_rst), .S(1'b1), .Q(dr_reg) );
  DFFSR \err_reg_reg[1]  ( .D(n134), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        err_reg[1]) );
  DFFSR \err_reg_reg[0]  ( .D(n133), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        err_reg[0]) );
  DFFSR \ds_reg_reg[3]  ( .D(n143), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[3]) );
  DFFSR \ds_reg_reg[2]  ( .D(n144), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[2]) );
  DFFSR \ds_reg_reg[1]  ( .D(\next_ds_reg[1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_size[1]) );
  DFFSR \ds_reg_reg[0]  ( .D(n145), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[0]) );
  DFFSR \prdata_reg[7]  ( .D(next_prdata[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[7]) );
  DFFSR \prdata_reg[5]  ( .D(next_prdata[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[5]) );
  DFFSR \prdata_reg[6]  ( .D(next_prdata[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[6]) );
  DFFSR \prdata_reg[4]  ( .D(next_prdata[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[4]) );
  DFFSR \prdata_reg[3]  ( .D(next_prdata[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[3]) );
  DFFSR \prdata_reg[2]  ( .D(next_prdata[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[2]) );
  DFFSR \prdata_reg[1]  ( .D(next_prdata[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[1]) );
  DFFSR \prdata_reg[0]  ( .D(next_prdata[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[0]) );
  NOR2X1 U32 ( .A(n30), .B(n31), .Y(pslverr) );
  OR2X1 U33 ( .A(n32), .B(n33), .Y(n31) );
  INVX1 U34 ( .A(n34), .Y(next_prdata[7]) );
  AOI22X1 U35 ( .A(n35), .B(bit_period[7]), .C(n36), .D(rx_data[7]), .Y(n34)
         );
  OAI21X1 U36 ( .A(n37), .B(n38), .C(n39), .Y(next_prdata[6]) );
  AOI22X1 U37 ( .A(n40), .B(n41), .C(rx_data[6]), .D(n36), .Y(n39) );
  NOR2X1 U38 ( .A(n42), .B(n43), .Y(n40) );
  INVX1 U39 ( .A(bit_period[6]), .Y(n38) );
  NAND2X1 U40 ( .A(n44), .B(n45), .Y(next_prdata[5]) );
  AOI22X1 U41 ( .A(n46), .B(rx_data[6]), .C(rx_data[5]), .D(n36), .Y(n45) );
  AND2X1 U42 ( .A(n47), .B(n48), .Y(n36) );
  NOR2X1 U43 ( .A(n42), .B(n49), .Y(n46) );
  INVX1 U44 ( .A(n47), .Y(n42) );
  AOI22X1 U45 ( .A(bit_period[13]), .B(n50), .C(bit_period[5]), .D(n35), .Y(
        n44) );
  OAI21X1 U46 ( .A(n37), .B(n51), .C(n52), .Y(next_prdata[4]) );
  AOI22X1 U47 ( .A(n47), .B(n53), .C(bit_period[12]), .D(n50), .Y(n52) );
  OAI21X1 U48 ( .A(n43), .B(n54), .C(n55), .Y(n53) );
  AOI22X1 U49 ( .A(rx_data[4]), .B(n48), .C(rx_data[5]), .D(n41), .Y(n55) );
  INVX1 U50 ( .A(rx_data[7]), .Y(n43) );
  NAND2X1 U51 ( .A(n56), .B(n57), .Y(next_prdata[3]) );
  AOI22X1 U52 ( .A(data_size[3]), .B(n58), .C(n47), .D(n59), .Y(n57) );
  OAI21X1 U53 ( .A(n60), .B(n54), .C(n61), .Y(n59) );
  AOI22X1 U54 ( .A(rx_data[3]), .B(n48), .C(rx_data[4]), .D(n41), .Y(n61) );
  INVX1 U55 ( .A(rx_data[6]), .Y(n60) );
  AOI22X1 U56 ( .A(bit_period[11]), .B(n50), .C(bit_period[3]), .D(n35), .Y(
        n56) );
  NAND2X1 U57 ( .A(n62), .B(n63), .Y(next_prdata[2]) );
  AOI22X1 U58 ( .A(n58), .B(data_size[2]), .C(n47), .D(n64), .Y(n63) );
  OAI21X1 U59 ( .A(n65), .B(n54), .C(n66), .Y(n64) );
  AOI22X1 U60 ( .A(rx_data[2]), .B(n48), .C(rx_data[3]), .D(n41), .Y(n66) );
  INVX1 U61 ( .A(rx_data[5]), .Y(n65) );
  AOI22X1 U62 ( .A(bit_period[10]), .B(n50), .C(bit_period[2]), .D(n35), .Y(
        n62) );
  NAND2X1 U63 ( .A(n67), .B(n68), .Y(next_prdata[1]) );
  AOI21X1 U64 ( .A(n47), .B(n69), .C(n70), .Y(n68) );
  INVX1 U65 ( .A(n71), .Y(n70) );
  AOI22X1 U66 ( .A(data_size[1]), .B(n58), .C(n72), .D(err_reg[1]), .Y(n71) );
  OAI21X1 U67 ( .A(n73), .B(n54), .C(n74), .Y(n69) );
  AOI22X1 U68 ( .A(rx_data[1]), .B(n48), .C(rx_data[2]), .D(n41), .Y(n74) );
  INVX1 U69 ( .A(rx_data[4]), .Y(n73) );
  AOI22X1 U70 ( .A(bit_period[9]), .B(n50), .C(bit_period[1]), .D(n35), .Y(n67) );
  OR2X1 U71 ( .A(n75), .B(n76), .Y(next_prdata[0]) );
  OAI21X1 U72 ( .A(n37), .B(n77), .C(n78), .Y(n76) );
  AOI22X1 U73 ( .A(n47), .B(n79), .C(bit_period[8]), .D(n50), .Y(n78) );
  INVX1 U74 ( .A(n80), .Y(n50) );
  NAND3X1 U75 ( .A(n81), .B(n82), .C(n83), .Y(n80) );
  OAI21X1 U76 ( .A(n54), .B(n84), .C(n85), .Y(n79) );
  AOI22X1 U77 ( .A(rx_data[0]), .B(n48), .C(rx_data[1]), .D(n41), .Y(n85) );
  INVX1 U78 ( .A(n49), .Y(n41) );
  AND2X1 U79 ( .A(n54), .B(n49), .Y(n48) );
  NAND3X1 U80 ( .A(data_size[2]), .B(data_size[1]), .C(n86), .Y(n49) );
  NOR2X1 U81 ( .A(data_size[3]), .B(n87), .Y(n86) );
  INVX1 U82 ( .A(rx_data[3]), .Y(n84) );
  NAND3X1 U83 ( .A(data_size[2]), .B(data_size[0]), .C(n88), .Y(n54) );
  NOR2X1 U84 ( .A(data_size[3]), .B(data_size[1]), .Y(n88) );
  NOR2X1 U85 ( .A(n81), .B(n83), .Y(n47) );
  INVX1 U86 ( .A(n35), .Y(n37) );
  NOR2X1 U87 ( .A(n89), .B(n83), .Y(n35) );
  OAI21X1 U88 ( .A(n87), .B(n90), .C(n91), .Y(n75) );
  AOI22X1 U89 ( .A(n92), .B(n93), .C(err_reg[0]), .D(n72), .Y(n91) );
  INVX1 U90 ( .A(n94), .Y(n72) );
  NAND3X1 U91 ( .A(n95), .B(n89), .C(n83), .Y(n94) );
  NOR2X1 U92 ( .A(n82), .B(n83), .Y(n93) );
  INVX1 U93 ( .A(n96), .Y(n83) );
  OAI21X1 U94 ( .A(n97), .B(n98), .C(n99), .Y(n96) );
  NAND2X1 U95 ( .A(n100), .B(n101), .Y(n98) );
  INVX1 U96 ( .A(n89), .Y(n82) );
  AND2X1 U97 ( .A(dr_reg), .B(n81), .Y(n92) );
  INVX1 U98 ( .A(n58), .Y(n90) );
  NOR2X1 U99 ( .A(n89), .B(n81), .Y(n58) );
  INVX1 U100 ( .A(n95), .Y(n81) );
  OAI21X1 U101 ( .A(n102), .B(n97), .C(n99), .Y(n95) );
  INVX1 U102 ( .A(n103), .Y(n97) );
  AOI21X1 U103 ( .A(n104), .B(paddr[0]), .C(n33), .Y(n102) );
  NOR2X1 U104 ( .A(paddr[2]), .B(paddr[1]), .Y(n104) );
  OAI21X1 U105 ( .A(n33), .B(n32), .C(n103), .Y(n89) );
  INVX1 U106 ( .A(n105), .Y(n33) );
  INVX1 U107 ( .A(n106), .Y(\next_ds_reg[1] ) );
  MUX2X1 U108 ( .B(data_size[1]), .A(pwdata[1]), .S(n107), .Y(n106) );
  INVX1 U109 ( .A(n108), .Y(next_bp_reg[8]) );
  MUX2X1 U110 ( .B(pwdata[0]), .A(bit_period[8]), .S(n109), .Y(n108) );
  INVX1 U111 ( .A(n110), .Y(next_bp_reg[7]) );
  MUX2X1 U112 ( .B(pwdata[7]), .A(bit_period[7]), .S(n111), .Y(n110) );
  INVX1 U113 ( .A(n112), .Y(next_bp_reg[6]) );
  MUX2X1 U114 ( .B(pwdata[6]), .A(bit_period[6]), .S(n111), .Y(n112) );
  INVX1 U115 ( .A(n113), .Y(next_bp_reg[1]) );
  MUX2X1 U116 ( .B(pwdata[1]), .A(bit_period[1]), .S(n111), .Y(n113) );
  INVX1 U117 ( .A(n114), .Y(next_bp_reg[12]) );
  MUX2X1 U118 ( .B(pwdata[4]), .A(bit_period[12]), .S(n109), .Y(n114) );
  MUX2X1 U119 ( .B(n115), .A(n77), .S(n111), .Y(next_bp_reg[0]) );
  INVX1 U120 ( .A(bit_period[0]), .Y(n77) );
  INVX1 U121 ( .A(n116), .Y(n133) );
  MUX2X1 U122 ( .B(framing_error), .A(err_reg[0]), .S(n117), .Y(n116) );
  INVX1 U123 ( .A(n118), .Y(n134) );
  MUX2X1 U124 ( .B(overrun_error), .A(err_reg[1]), .S(n117), .Y(n118) );
  AND2X1 U125 ( .A(overrun_error), .B(framing_error), .Y(n117) );
  INVX1 U126 ( .A(n119), .Y(n135) );
  MUX2X1 U127 ( .B(pwdata[5]), .A(bit_period[13]), .S(n109), .Y(n119) );
  INVX1 U128 ( .A(n120), .Y(n136) );
  MUX2X1 U129 ( .B(pwdata[3]), .A(bit_period[11]), .S(n109), .Y(n120) );
  INVX1 U130 ( .A(n121), .Y(n137) );
  MUX2X1 U131 ( .B(pwdata[2]), .A(bit_period[10]), .S(n109), .Y(n121) );
  INVX1 U132 ( .A(n122), .Y(n138) );
  MUX2X1 U133 ( .B(pwdata[1]), .A(bit_period[9]), .S(n109), .Y(n122) );
  NAND3X1 U134 ( .A(paddr[0]), .B(n123), .C(n32), .Y(n109) );
  INVX1 U135 ( .A(n124), .Y(n139) );
  MUX2X1 U136 ( .B(pwdata[5]), .A(bit_period[5]), .S(n111), .Y(n124) );
  MUX2X1 U137 ( .B(n125), .A(n51), .S(n111), .Y(n140) );
  INVX1 U138 ( .A(bit_period[4]), .Y(n51) );
  INVX1 U139 ( .A(pwdata[4]), .Y(n125) );
  INVX1 U140 ( .A(n126), .Y(n141) );
  MUX2X1 U141 ( .B(pwdata[3]), .A(bit_period[3]), .S(n111), .Y(n126) );
  INVX1 U142 ( .A(n127), .Y(n142) );
  MUX2X1 U143 ( .B(pwdata[2]), .A(bit_period[2]), .S(n111), .Y(n127) );
  NAND3X1 U144 ( .A(n123), .B(n100), .C(n32), .Y(n111) );
  NOR2X1 U145 ( .A(n128), .B(paddr[2]), .Y(n32) );
  INVX1 U146 ( .A(n30), .Y(n123) );
  INVX1 U147 ( .A(n129), .Y(n143) );
  MUX2X1 U148 ( .B(data_size[3]), .A(pwdata[3]), .S(n107), .Y(n129) );
  INVX1 U149 ( .A(n130), .Y(n144) );
  MUX2X1 U150 ( .B(data_size[2]), .A(pwdata[2]), .S(n107), .Y(n130) );
  MUX2X1 U151 ( .B(n87), .A(n115), .S(n107), .Y(n145) );
  NOR2X1 U152 ( .A(n105), .B(n30), .Y(n107) );
  NAND3X1 U153 ( .A(psel), .B(penable), .C(pwrite), .Y(n30) );
  NAND3X1 U154 ( .A(n100), .B(n128), .C(paddr[2]), .Y(n105) );
  INVX1 U155 ( .A(paddr[1]), .Y(n128) );
  INVX1 U156 ( .A(paddr[0]), .Y(n100) );
  INVX1 U157 ( .A(pwdata[0]), .Y(n115) );
  INVX1 U158 ( .A(data_size[0]), .Y(n87) );
  INVX1 U159 ( .A(n99), .Y(data_read) );
  NAND3X1 U160 ( .A(n103), .B(paddr[1]), .C(n131), .Y(n99) );
  NOR2X1 U161 ( .A(paddr[0]), .B(n101), .Y(n131) );
  INVX1 U162 ( .A(paddr[2]), .Y(n101) );
  NOR2X1 U163 ( .A(n132), .B(pwrite), .Y(n103) );
  INVX1 U164 ( .A(psel), .Y(n132) );
endmodule


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
        sbc_clear, sbc_enable, load_buffer, enable_timer, data_size, 
        bit_period );
  input [3:0] data_size;
  input [13:0] bit_period;
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


module first_flex_counter_DW01_dec_0 ( A, SUM );
  input [14:0] A;
  output [14:0] SUM;
  wire   n2, n4, n6, n8, n10, n12, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33;

  INVX2 U1 ( .A(n29), .Y(SUM[13]) );
  INVX2 U2 ( .A(A[12]), .Y(n2) );
  INVX2 U3 ( .A(n32), .Y(SUM[11]) );
  INVX2 U4 ( .A(A[10]), .Y(n4) );
  INVX2 U5 ( .A(n15), .Y(SUM[9]) );
  INVX2 U6 ( .A(A[8]), .Y(n6) );
  INVX2 U7 ( .A(n19), .Y(SUM[7]) );
  INVX2 U8 ( .A(A[6]), .Y(n8) );
  INVX2 U9 ( .A(n22), .Y(SUM[5]) );
  INVX2 U10 ( .A(A[4]), .Y(n10) );
  INVX2 U11 ( .A(n25), .Y(SUM[3]) );
  INVX2 U12 ( .A(A[2]), .Y(n12) );
  INVX2 U13 ( .A(n28), .Y(SUM[1]) );
  INVX2 U14 ( .A(A[0]), .Y(SUM[0]) );
  AOI21X1 U15 ( .A(n16), .B(A[9]), .C(n17), .Y(n15) );
  OAI21X1 U16 ( .A(n18), .B(n6), .C(n16), .Y(SUM[8]) );
  AOI21X1 U17 ( .A(n20), .B(A[7]), .C(n18), .Y(n19) );
  OAI21X1 U18 ( .A(n21), .B(n8), .C(n20), .Y(SUM[6]) );
  AOI21X1 U19 ( .A(n23), .B(A[5]), .C(n21), .Y(n22) );
  OAI21X1 U20 ( .A(n24), .B(n10), .C(n23), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n26), .B(A[3]), .C(n24), .Y(n25) );
  OAI21X1 U22 ( .A(n27), .B(n12), .C(n26), .Y(SUM[2]) );
  AOI21X1 U23 ( .A(A[0]), .B(A[1]), .C(n27), .Y(n28) );
  AOI21X1 U24 ( .A(n30), .B(A[13]), .C(SUM[14]), .Y(n29) );
  NOR2X1 U25 ( .A(n30), .B(A[13]), .Y(SUM[14]) );
  OAI21X1 U26 ( .A(n31), .B(n2), .C(n30), .Y(SUM[12]) );
  NAND2X1 U27 ( .A(n31), .B(n2), .Y(n30) );
  AOI21X1 U28 ( .A(n33), .B(A[11]), .C(n31), .Y(n32) );
  NOR2X1 U29 ( .A(n33), .B(A[11]), .Y(n31) );
  OAI21X1 U30 ( .A(n17), .B(n4), .C(n33), .Y(SUM[10]) );
  NAND2X1 U31 ( .A(n17), .B(n4), .Y(n33) );
  NOR2X1 U32 ( .A(n16), .B(A[9]), .Y(n17) );
  NAND2X1 U33 ( .A(n18), .B(n6), .Y(n16) );
  NOR2X1 U34 ( .A(n20), .B(A[7]), .Y(n18) );
  NAND2X1 U35 ( .A(n21), .B(n8), .Y(n20) );
  NOR2X1 U36 ( .A(n23), .B(A[5]), .Y(n21) );
  NAND2X1 U37 ( .A(n24), .B(n10), .Y(n23) );
  NOR2X1 U38 ( .A(n26), .B(A[3]), .Y(n24) );
  NAND2X1 U39 ( .A(n27), .B(n12), .Y(n26) );
  NOR2X1 U40 ( .A(A[1]), .B(A[0]), .Y(n27) );
endmodule


module first_flex_counter ( clk, n_rst, enable_timer, rollover_val, count_out, 
        rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, enable_timer;
  output rollover_flag;
  wire   next_rollover_flag, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13,
         N14, N15, N16, N17, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n21, n22, n23, n24, n25, n26, n27,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115;
  wire   [13:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[13]  ( .D(next_count[13]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[13]) );
  DFFSR rollover_flag_reg ( .D(next_rollover_flag), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(rollover_flag) );
  DFFSR \count_out_reg[9]  ( .D(next_count[9]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[9]) );
  DFFSR \count_out_reg[8]  ( .D(next_count[8]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[8]) );
  DFFSR \count_out_reg[7]  ( .D(next_count[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[7]) );
  DFFSR \count_out_reg[6]  ( .D(next_count[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(next_count[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(next_count[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[12]  ( .D(next_count[12]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[12]) );
  DFFSR \count_out_reg[11]  ( .D(next_count[11]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[11]) );
  DFFSR \count_out_reg[10]  ( .D(next_count[10]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[10]) );
  first_flex_counter_DW01_dec_0 sub_36 ( .A({1'b0, rollover_val}), .SUM({N17, 
        N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3}) );
  BUFX2 U6 ( .A(n51), .Y(n1) );
  INVX2 U10 ( .A(enable_timer), .Y(n46) );
  NOR2X1 U21 ( .A(n2), .B(n3), .Y(next_count[9]) );
  XNOR2X1 U22 ( .A(n4), .B(n5), .Y(n3) );
  NOR2X1 U23 ( .A(n2), .B(n6), .Y(next_count[8]) );
  XNOR2X1 U24 ( .A(n7), .B(n8), .Y(n6) );
  NOR2X1 U25 ( .A(n2), .B(n9), .Y(next_count[7]) );
  XNOR2X1 U26 ( .A(n10), .B(n11), .Y(n9) );
  NOR2X1 U27 ( .A(n2), .B(n12), .Y(next_count[6]) );
  XNOR2X1 U28 ( .A(n13), .B(n14), .Y(n12) );
  NOR2X1 U29 ( .A(n2), .B(n15), .Y(next_count[5]) );
  XNOR2X1 U30 ( .A(n16), .B(n17), .Y(n15) );
  NOR2X1 U31 ( .A(n2), .B(n18), .Y(next_count[4]) );
  XNOR2X1 U32 ( .A(n19), .B(n21), .Y(n18) );
  NOR2X1 U33 ( .A(n2), .B(n22), .Y(next_count[3]) );
  XNOR2X1 U34 ( .A(n23), .B(n24), .Y(n22) );
  NOR2X1 U35 ( .A(n2), .B(n25), .Y(next_count[2]) );
  XNOR2X1 U36 ( .A(n26), .B(n27), .Y(n25) );
  NOR2X1 U37 ( .A(n2), .B(n43), .Y(next_count[1]) );
  XNOR2X1 U38 ( .A(n44), .B(n45), .Y(n43) );
  XNOR2X1 U39 ( .A(n46), .B(n47), .Y(n45) );
  NOR2X1 U40 ( .A(n2), .B(n48), .Y(next_count[13]) );
  XOR2X1 U41 ( .A(n49), .B(n50), .Y(n48) );
  AND2X1 U42 ( .A(n1), .B(count_out[13]), .Y(n50) );
  NAND2X1 U43 ( .A(n52), .B(n53), .Y(n49) );
  NOR2X1 U44 ( .A(n2), .B(n54), .Y(next_count[12]) );
  XNOR2X1 U45 ( .A(n52), .B(n53), .Y(n54) );
  INVX1 U46 ( .A(n55), .Y(n53) );
  AOI22X1 U47 ( .A(n46), .B(rollover_val[13]), .C(n1), .D(count_out[12]), .Y(
        n55) );
  NOR3X1 U48 ( .A(n56), .B(n57), .C(n58), .Y(n52) );
  NOR2X1 U49 ( .A(n2), .B(n59), .Y(next_count[11]) );
  XOR2X1 U50 ( .A(n56), .B(n60), .Y(n59) );
  NOR2X1 U51 ( .A(n57), .B(n58), .Y(n60) );
  AOI22X1 U52 ( .A(n46), .B(rollover_val[12]), .C(n1), .D(count_out[11]), .Y(
        n56) );
  NOR2X1 U53 ( .A(n2), .B(n61), .Y(next_count[10]) );
  XNOR2X1 U54 ( .A(n58), .B(n57), .Y(n61) );
  AOI22X1 U55 ( .A(n46), .B(rollover_val[11]), .C(n1), .D(count_out[10]), .Y(
        n57) );
  NAND2X1 U56 ( .A(n5), .B(n4), .Y(n58) );
  INVX1 U57 ( .A(n62), .Y(n4) );
  AOI22X1 U58 ( .A(n46), .B(rollover_val[10]), .C(n1), .D(count_out[9]), .Y(
        n62) );
  NOR2X1 U59 ( .A(n7), .B(n8), .Y(n5) );
  AOI22X1 U60 ( .A(n46), .B(rollover_val[9]), .C(n1), .D(count_out[8]), .Y(n8)
         );
  OR2X1 U61 ( .A(n11), .B(n10), .Y(n7) );
  AOI22X1 U62 ( .A(n46), .B(rollover_val[8]), .C(n1), .D(count_out[7]), .Y(n10) );
  OR2X1 U63 ( .A(n13), .B(n14), .Y(n11) );
  AOI22X1 U64 ( .A(n46), .B(rollover_val[7]), .C(n1), .D(count_out[6]), .Y(n14) );
  OR2X1 U65 ( .A(n17), .B(n16), .Y(n13) );
  AOI22X1 U66 ( .A(n46), .B(rollover_val[6]), .C(n1), .D(count_out[5]), .Y(n16) );
  OR2X1 U67 ( .A(n19), .B(n21), .Y(n17) );
  AOI22X1 U68 ( .A(n46), .B(rollover_val[5]), .C(n1), .D(count_out[4]), .Y(n21) );
  OR2X1 U69 ( .A(n24), .B(n23), .Y(n19) );
  AOI22X1 U70 ( .A(n46), .B(rollover_val[4]), .C(n1), .D(count_out[3]), .Y(n23) );
  NAND2X1 U71 ( .A(n26), .B(n27), .Y(n24) );
  OAI21X1 U72 ( .A(n47), .B(n63), .C(n64), .Y(n27) );
  OAI21X1 U73 ( .A(n44), .B(n65), .C(n46), .Y(n64) );
  INVX1 U74 ( .A(n63), .Y(n44) );
  AOI22X1 U75 ( .A(n46), .B(rollover_val[2]), .C(n1), .D(count_out[1]), .Y(n63) );
  INVX1 U76 ( .A(n66), .Y(n26) );
  AOI22X1 U77 ( .A(n46), .B(rollover_val[3]), .C(n1), .D(count_out[2]), .Y(n66) );
  NOR3X1 U78 ( .A(n46), .B(next_rollover_flag), .C(n67), .Y(n2) );
  OAI21X1 U79 ( .A(n67), .B(n68), .C(n65), .Y(next_count[0]) );
  INVX1 U80 ( .A(n47), .Y(n65) );
  AOI22X1 U81 ( .A(n46), .B(rollover_val[1]), .C(n1), .D(count_out[0]), .Y(n47) );
  NAND2X1 U82 ( .A(n68), .B(n69), .Y(n51) );
  INVX1 U83 ( .A(next_rollover_flag), .Y(n69) );
  NOR2X1 U84 ( .A(n46), .B(n70), .Y(next_rollover_flag) );
  NAND2X1 U85 ( .A(enable_timer), .B(n70), .Y(n68) );
  NAND2X1 U86 ( .A(n71), .B(n72), .Y(n70) );
  NOR2X1 U87 ( .A(n73), .B(n74), .Y(n72) );
  NAND3X1 U88 ( .A(n75), .B(n76), .C(n77), .Y(n74) );
  NOR2X1 U89 ( .A(n78), .B(n79), .Y(n77) );
  XOR2X1 U90 ( .A(count_out[7]), .B(N10), .Y(n79) );
  XOR2X1 U91 ( .A(count_out[2]), .B(N5), .Y(n78) );
  XNOR2X1 U92 ( .A(count_out[3]), .B(N6), .Y(n76) );
  XNOR2X1 U93 ( .A(count_out[4]), .B(N7), .Y(n75) );
  NAND3X1 U94 ( .A(n80), .B(n81), .C(n82), .Y(n73) );
  NOR2X1 U95 ( .A(N17), .B(n83), .Y(n82) );
  XOR2X1 U96 ( .A(count_out[13]), .B(N16), .Y(n83) );
  XNOR2X1 U97 ( .A(count_out[0]), .B(N3), .Y(n81) );
  XNOR2X1 U98 ( .A(count_out[1]), .B(N4), .Y(n80) );
  NOR2X1 U99 ( .A(n84), .B(n85), .Y(n71) );
  NAND3X1 U100 ( .A(n86), .B(n87), .C(n88), .Y(n85) );
  XNOR2X1 U101 ( .A(count_out[5]), .B(N8), .Y(n88) );
  XNOR2X1 U102 ( .A(count_out[6]), .B(N9), .Y(n87) );
  XNOR2X1 U103 ( .A(count_out[9]), .B(N12), .Y(n86) );
  NAND3X1 U104 ( .A(n89), .B(n90), .C(n91), .Y(n84) );
  NOR2X1 U105 ( .A(n92), .B(n93), .Y(n91) );
  XOR2X1 U106 ( .A(count_out[11]), .B(N14), .Y(n93) );
  XOR2X1 U107 ( .A(count_out[10]), .B(N13), .Y(n92) );
  XNOR2X1 U108 ( .A(count_out[12]), .B(N15), .Y(n90) );
  XNOR2X1 U109 ( .A(count_out[8]), .B(N11), .Y(n89) );
  NAND2X1 U110 ( .A(n94), .B(n95), .Y(n67) );
  NOR2X1 U111 ( .A(n96), .B(n97), .Y(n95) );
  NAND3X1 U112 ( .A(n98), .B(n99), .C(n100), .Y(n97) );
  XNOR2X1 U113 ( .A(count_out[11]), .B(rollover_val[11]), .Y(n100) );
  XNOR2X1 U114 ( .A(count_out[12]), .B(rollover_val[12]), .Y(n99) );
  XNOR2X1 U115 ( .A(count_out[10]), .B(rollover_val[10]), .Y(n98) );
  NAND3X1 U116 ( .A(n101), .B(n102), .C(n103), .Y(n96) );
  NOR2X1 U117 ( .A(n104), .B(n105), .Y(n103) );
  XOR2X1 U118 ( .A(rollover_val[7]), .B(count_out[7]), .Y(n105) );
  XOR2X1 U119 ( .A(rollover_val[6]), .B(count_out[6]), .Y(n104) );
  XNOR2X1 U120 ( .A(count_out[8]), .B(rollover_val[8]), .Y(n102) );
  XNOR2X1 U121 ( .A(count_out[9]), .B(rollover_val[9]), .Y(n101) );
  NOR2X1 U122 ( .A(n106), .B(n107), .Y(n94) );
  NAND3X1 U123 ( .A(n108), .B(n109), .C(n110), .Y(n107) );
  XNOR2X1 U124 ( .A(count_out[4]), .B(rollover_val[4]), .Y(n110) );
  XNOR2X1 U125 ( .A(count_out[5]), .B(rollover_val[5]), .Y(n109) );
  XNOR2X1 U126 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n108) );
  NAND3X1 U127 ( .A(n111), .B(n112), .C(n113), .Y(n106) );
  NOR2X1 U128 ( .A(n114), .B(n115), .Y(n113) );
  XOR2X1 U129 ( .A(rollover_val[13]), .B(count_out[13]), .Y(n115) );
  XOR2X1 U130 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n114) );
  XNOR2X1 U131 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n112) );
  XNOR2X1 U132 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n111) );
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


module timer ( clk, n_rst, data_size, bit_period, enable_timer, shift_enable, 
        packet_done );
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;
  wire   \_0_net_[3] , \_0_net_[2] , \_0_net_[0] , n1, n2;
  assign \_0_net_[0]  = data_size[0];

  first_flex_counter C1 ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), .rollover_val(bit_period), .rollover_flag(shift_enable) );
  second_flex_counter C2 ( .clk(clk), .n_rst(n_rst), .clear(1'b0), 
        .shift_strobe(shift_enable), .rollover_val({\_0_net_[3] , \_0_net_[2] , 
        n2, \_0_net_[0] }), .packet_done(packet_done) );
  XOR2X1 U3 ( .A(data_size[3]), .B(n1), .Y(\_0_net_[3] ) );
  AND2X1 U4 ( .A(data_size[1]), .B(data_size[2]), .Y(n1) );
  XNOR2X1 U5 ( .A(data_size[2]), .B(n2), .Y(\_0_net_[2] ) );
  INVX1 U6 ( .A(data_size[1]), .Y(n2) );
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


module rcv_block ( clk, n_rst, data_size, bit_period, serial_in, data_read, 
        rx_data, data_ready, overrun_error, framing_error );
  input [3:0] data_size;
  input [13:0] bit_period;
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
        .enable_timer(enable_timer), .data_size(data_size), .bit_period(
        bit_period) );
  timer A3 ( .clk(clk), .n_rst(n_rst), .data_size(data_size), .bit_period(
        bit_period), .enable_timer(enable_timer), .shift_enable(shift_enable), 
        .packet_done(packet_done) );
  sr_9bit A4 ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), .shift_strobe(
        shift_enable), .packet_data(data) );
  rx_data_buff A5 ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), 
        .packet_data(data[7:0]), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
  stop_bit_chk A7 ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(data[8]), .framing_error(
        framing_error) );
endmodule


module apb_uart_rx ( clk, n_rst, serial_in, psel, paddr, penable, pwrite, 
        pwdata, prdata, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_ready, overrun_error, framing_error, data_read;
  wire   [7:0] rx_data;
  wire   [3:0] data_size;
  wire   [13:0] bit_period;

  apb_slave A1 ( .clk(clk), .n_rst(n_rst), .rx_data(rx_data), .data_ready(
        data_ready), .overrun_error(overrun_error), .framing_error(
        framing_error), .psel(psel), .paddr(paddr), .penable(penable), 
        .pwrite(pwrite), .pwdata(pwdata), .data_read(data_read), .prdata(
        prdata), .pslverr(pslverr), .data_size(data_size), .bit_period(
        bit_period) );
  rcv_block A2 ( .clk(clk), .n_rst(n_rst), .data_size(data_size), .bit_period(
        bit_period), .serial_in(serial_in), .data_read(data_read), .rx_data(
        rx_data), .data_ready(data_ready), .overrun_error(overrun_error), 
        .framing_error(framing_error) );
endmodule

