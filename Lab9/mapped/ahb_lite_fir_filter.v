/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Apr  4 20:10:11 2020
/////////////////////////////////////////////////////////////


module dr_controller ( clk, n_rst, dr, modwait, data_ready );
  input clk, n_rst, dr, modwait;
  output data_ready;
  wire   n26, n27, n28, n29, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21;
  wire   [2:0] state;

  DFFSR \state_reg[0]  ( .D(n29), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[2]  ( .D(n27), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  DFFSR \state_reg[1]  ( .D(n28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR data_ready_reg ( .D(n26), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  OAI22X1 U7 ( .A(n5), .B(n6), .C(state[2]), .D(n7), .Y(n29) );
  MUX2X1 U8 ( .B(n8), .A(n9), .S(n6), .Y(n7) );
  OR2X1 U9 ( .A(dr), .B(state[1]), .Y(n9) );
  NOR2X1 U10 ( .A(state[1]), .B(n10), .Y(n8) );
  OAI21X1 U11 ( .A(n5), .B(n11), .C(n12), .Y(n28) );
  OAI22X1 U12 ( .A(n6), .B(n11), .C(n13), .D(n14), .Y(n27) );
  INVX1 U13 ( .A(n15), .Y(n13) );
  OAI21X1 U14 ( .A(state[2]), .B(n11), .C(n16), .Y(n26) );
  INVX1 U15 ( .A(n17), .Y(n16) );
  OAI21X1 U16 ( .A(n18), .B(n5), .C(n12), .Y(n17) );
  NAND2X1 U17 ( .A(n19), .B(n14), .Y(n12) );
  MUX2X1 U18 ( .B(n20), .A(n11), .S(n6), .Y(n19) );
  NAND2X1 U19 ( .A(n10), .B(n11), .Y(n20) );
  INVX1 U20 ( .A(modwait), .Y(n10) );
  MUX2X1 U21 ( .B(n15), .A(n21), .S(n14), .Y(n5) );
  INVX1 U22 ( .A(state[2]), .Y(n14) );
  NOR2X1 U23 ( .A(dr), .B(n15), .Y(n21) );
  NAND2X1 U24 ( .A(n11), .B(n6), .Y(n15) );
  INVX1 U25 ( .A(state[0]), .Y(n6) );
  INVX1 U26 ( .A(data_ready), .Y(n18) );
  INVX1 U27 ( .A(state[1]), .Y(n11) );
endmodule


module ahb_lite_slave ( clk, n_rst, set, sample_data, data_ready, 
        new_coefficient_set, coefficient_num, fir_coefficient, modwait, 
        fir_out, err, hsel, haddr, hsize, htrans, hwrite, hwdata, hrdata, 
        hresp );
  input [1:0] set;
  output [15:0] sample_data;
  input [1:0] coefficient_num;
  output [15:0] fir_coefficient;
  input [15:0] fir_out;
  input [3:0] haddr;
  input [1:0] htrans;
  input [15:0] hwdata;
  output [15:0] hrdata;
  input clk, n_rst, modwait, err, hsel, hsize, hwrite;
  output data_ready, new_coefficient_set, hresp;
  wire   dr, N222, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n614, n615, n616, n617, n618, n619, n620,
         n621, n622, n623, n624, n625, n626, n627, n628, n629, n630, n631,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580;
  wire   [7:1] new_coeff_set;
  wire   [15:0] F1_coeff;
  wire   [15:0] F2_coeff;
  wire   [15:0] F3_coeff;
  wire   [15:0] F0_coeff;
  wire   [15:0] res;
  wire   [4:0] rs;
  wire   [15:0] status;
  wire   [10:0] ws;
  wire   [4:0] next_rs;
  wire   [10:0] next_ws;

  DFFSR \ws_reg[10]  ( .D(next_ws[10]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ws[10]) );
  DFFSR \ws_reg[9]  ( .D(next_ws[9]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ws[9]) );
  DFFSR \ws_reg[8]  ( .D(next_ws[8]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ws[8]) );
  DFFSR \ws_reg[7]  ( .D(next_ws[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ws[7]) );
  DFFSR \ws_reg[6]  ( .D(next_ws[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ws[6]) );
  DFFSR \ws_reg[5]  ( .D(next_ws[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ws[5]) );
  DFFSR \ws_reg[4]  ( .D(next_ws[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ws[4]) );
  DFFSR \ws_reg[3]  ( .D(next_ws[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ws[3]) );
  DFFSR \ws_reg[2]  ( .D(next_ws[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ws[2]) );
  DFFSR \ws_reg[1]  ( .D(next_ws[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ws[1]) );
  DFFSR \ws_reg[0]  ( .D(next_ws[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ws[0]) );
  DFFSR \res_reg[15]  ( .D(fir_out[15]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[15]) );
  DFFSR \res_reg[14]  ( .D(fir_out[14]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[14]) );
  DFFSR \res_reg[13]  ( .D(fir_out[13]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[13]) );
  DFFSR \res_reg[12]  ( .D(fir_out[12]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[12]) );
  DFFSR \res_reg[11]  ( .D(fir_out[11]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[11]) );
  DFFSR \res_reg[10]  ( .D(fir_out[10]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[10]) );
  DFFSR \res_reg[9]  ( .D(fir_out[9]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[9]) );
  DFFSR \res_reg[8]  ( .D(fir_out[8]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[8]) );
  DFFSR \res_reg[7]  ( .D(fir_out[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[7]) );
  DFFSR \res_reg[6]  ( .D(fir_out[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[6]) );
  DFFSR \res_reg[5]  ( .D(fir_out[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[5]) );
  DFFSR \res_reg[4]  ( .D(fir_out[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[4]) );
  DFFSR \res_reg[3]  ( .D(fir_out[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[3]) );
  DFFSR \res_reg[2]  ( .D(fir_out[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[2]) );
  DFFSR \res_reg[1]  ( .D(fir_out[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[1]) );
  DFFSR \res_reg[0]  ( .D(fir_out[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        res[0]) );
  DFFSR \rs_reg[4]  ( .D(n580), .CLK(clk), .R(n_rst), .S(1'b1), .Q(rs[4]) );
  DFFSR \rs_reg[3]  ( .D(next_rs[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(rs[3]) );
  DFFSR \rs_reg[2]  ( .D(n579), .CLK(clk), .R(n_rst), .S(1'b1), .Q(rs[2]) );
  DFFSR \rs_reg[1]  ( .D(next_rs[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(rs[1]) );
  DFFSR \rs_reg[0]  ( .D(next_rs[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(rs[0]) );
  DFFSR \status_reg[8]  ( .D(err), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        status[8]) );
  DFFSR \status_reg[0]  ( .D(N222), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        status[0]) );
  DFFSR \sample_data_reg_reg[15]  ( .D(n554), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[15]) );
  DFFSR \sample_data_reg_reg[14]  ( .D(n553), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[14]) );
  DFFSR \sample_data_reg_reg[13]  ( .D(n552), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[13]) );
  DFFSR \sample_data_reg_reg[12]  ( .D(n551), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[12]) );
  DFFSR \sample_data_reg_reg[11]  ( .D(n550), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[11]) );
  DFFSR \sample_data_reg_reg[10]  ( .D(n549), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[10]) );
  DFFSR \sample_data_reg_reg[9]  ( .D(n548), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[9]) );
  DFFSR \sample_data_reg_reg[8]  ( .D(n547), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[8]) );
  DFFSR \sample_data_reg_reg[7]  ( .D(n562), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[7]) );
  DFFSR \sample_data_reg_reg[6]  ( .D(n561), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[6]) );
  DFFSR \sample_data_reg_reg[5]  ( .D(n560), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[5]) );
  DFFSR \sample_data_reg_reg[4]  ( .D(n559), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[4]) );
  DFFSR \sample_data_reg_reg[3]  ( .D(n558), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[3]) );
  DFFSR \sample_data_reg_reg[2]  ( .D(n557), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[2]) );
  DFFSR \sample_data_reg_reg[1]  ( .D(n556), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[1]) );
  DFFSR \sample_data_reg_reg[0]  ( .D(n555), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[0]) );
  DFFSR \F0_coeff_reg[15]  ( .D(n570), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[15]) );
  DFFSR \F0_coeff_reg[14]  ( .D(n569), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[14]) );
  DFFSR \F0_coeff_reg[13]  ( .D(n568), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[13]) );
  DFFSR \F0_coeff_reg[12]  ( .D(n567), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[12]) );
  DFFSR \F0_coeff_reg[11]  ( .D(n566), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[11]) );
  DFFSR \F0_coeff_reg[10]  ( .D(n565), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[10]) );
  DFFSR \F0_coeff_reg[9]  ( .D(n564), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[9]) );
  DFFSR \F0_coeff_reg[8]  ( .D(n563), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[8]) );
  DFFSR \F0_coeff_reg[7]  ( .D(n624), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[7]) );
  DFFSR \F0_coeff_reg[6]  ( .D(n625), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[6]) );
  DFFSR \F0_coeff_reg[5]  ( .D(n626), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[5]) );
  DFFSR \F0_coeff_reg[4]  ( .D(n627), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[4]) );
  DFFSR \F0_coeff_reg[3]  ( .D(n628), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[3]) );
  DFFSR \F0_coeff_reg[2]  ( .D(n629), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[2]) );
  DFFSR \F0_coeff_reg[1]  ( .D(n630), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[1]) );
  DFFSR \F0_coeff_reg[0]  ( .D(n631), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F0_coeff[0]) );
  DFFSR \F1_coeff_reg[15]  ( .D(n578), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[15]) );
  DFFSR \F1_coeff_reg[14]  ( .D(n577), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[14]) );
  DFFSR \F1_coeff_reg[13]  ( .D(n576), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[13]) );
  DFFSR \F1_coeff_reg[12]  ( .D(n575), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[12]) );
  DFFSR \F1_coeff_reg[11]  ( .D(n574), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[11]) );
  DFFSR \F1_coeff_reg[10]  ( .D(n573), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[10]) );
  DFFSR \F1_coeff_reg[9]  ( .D(n572), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[9]) );
  DFFSR \F1_coeff_reg[8]  ( .D(n571), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[8]) );
  DFFSR \F1_coeff_reg[7]  ( .D(n616), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[7]) );
  DFFSR \F1_coeff_reg[6]  ( .D(n617), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[6]) );
  DFFSR \F1_coeff_reg[5]  ( .D(n618), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[5]) );
  DFFSR \F1_coeff_reg[4]  ( .D(n619), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[4]) );
  DFFSR \F1_coeff_reg[3]  ( .D(n620), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[3]) );
  DFFSR \F1_coeff_reg[2]  ( .D(n621), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[2]) );
  DFFSR \F1_coeff_reg[1]  ( .D(n622), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[1]) );
  DFFSR \F1_coeff_reg[0]  ( .D(n623), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F1_coeff[0]) );
  DFFSR \F2_coeff_reg[15]  ( .D(n530), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[15]) );
  DFFSR \F2_coeff_reg[14]  ( .D(n529), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[14]) );
  DFFSR \F2_coeff_reg[13]  ( .D(n528), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[13]) );
  DFFSR \F2_coeff_reg[12]  ( .D(n527), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[12]) );
  DFFSR \F2_coeff_reg[11]  ( .D(n526), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[11]) );
  DFFSR \F2_coeff_reg[10]  ( .D(n525), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[10]) );
  DFFSR \F2_coeff_reg[9]  ( .D(n524), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[9]) );
  DFFSR \F2_coeff_reg[8]  ( .D(n523), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[8]) );
  DFFSR \F2_coeff_reg[7]  ( .D(n608), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[7]) );
  DFFSR \F2_coeff_reg[6]  ( .D(n609), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[6]) );
  DFFSR \F2_coeff_reg[5]  ( .D(n610), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[5]) );
  DFFSR \F2_coeff_reg[4]  ( .D(n611), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[4]) );
  DFFSR \F2_coeff_reg[3]  ( .D(n612), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[3]) );
  DFFSR \F2_coeff_reg[2]  ( .D(n613), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[2]) );
  DFFSR \F2_coeff_reg[1]  ( .D(n614), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[1]) );
  DFFSR \F2_coeff_reg[0]  ( .D(n615), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F2_coeff[0]) );
  DFFSR \F3_coeff_reg[15]  ( .D(n538), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[15]) );
  DFFSR \F3_coeff_reg[14]  ( .D(n537), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[14]) );
  DFFSR \F3_coeff_reg[13]  ( .D(n536), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[13]) );
  DFFSR \F3_coeff_reg[12]  ( .D(n535), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[12]) );
  DFFSR \F3_coeff_reg[11]  ( .D(n534), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[11]) );
  DFFSR \F3_coeff_reg[10]  ( .D(n533), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[10]) );
  DFFSR \F3_coeff_reg[9]  ( .D(n532), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[9]) );
  DFFSR \F3_coeff_reg[8]  ( .D(n531), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[8]) );
  DFFSR \F3_coeff_reg[7]  ( .D(n546), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[7]) );
  DFFSR \F3_coeff_reg[6]  ( .D(n545), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[6]) );
  DFFSR \F3_coeff_reg[5]  ( .D(n544), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[5]) );
  DFFSR \F3_coeff_reg[4]  ( .D(n543), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[4]) );
  DFFSR \F3_coeff_reg[3]  ( .D(n542), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[3]) );
  DFFSR \F3_coeff_reg[2]  ( .D(n541), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[2]) );
  DFFSR \F3_coeff_reg[1]  ( .D(n540), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[1]) );
  DFFSR \F3_coeff_reg[0]  ( .D(n539), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        F3_coeff[0]) );
  DFFSR \new_coeff_set_reg[7]  ( .D(n600), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        new_coeff_set[7]) );
  DFFSR \new_coeff_set_reg[6]  ( .D(n601), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        new_coeff_set[6]) );
  DFFSR \new_coeff_set_reg[5]  ( .D(n602), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        new_coeff_set[5]) );
  DFFSR \new_coeff_set_reg[4]  ( .D(n603), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        new_coeff_set[4]) );
  DFFSR \new_coeff_set_reg[3]  ( .D(n604), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        new_coeff_set[3]) );
  DFFSR \new_coeff_set_reg[2]  ( .D(n605), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        new_coeff_set[2]) );
  DFFSR \new_coeff_set_reg[1]  ( .D(n606), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        new_coeff_set[1]) );
  DFFSR \new_coeff_set_reg[0]  ( .D(n607), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        new_coefficient_set) );
  dr_controller DR ( .clk(clk), .n_rst(n_rst), .dr(dr), .modwait(modwait), 
        .data_ready(data_ready) );
  BUFX2 U92 ( .A(n485), .Y(n123) );
  BUFX2 U93 ( .A(n483), .Y(n124) );
  BUFX2 U94 ( .A(n486), .Y(n125) );
  BUFX2 U95 ( .A(n484), .Y(n126) );
  OAI22X1 U96 ( .A(n127), .B(n128), .C(n129), .D(n130), .Y(next_ws[9]) );
  OAI21X1 U97 ( .A(n127), .B(n128), .C(n131), .Y(next_ws[8]) );
  NAND3X1 U98 ( .A(n132), .B(n133), .C(n134), .Y(n131) );
  OAI21X1 U100 ( .A(n135), .B(n127), .C(n136), .Y(next_ws[7]) );
  NAND3X1 U101 ( .A(n132), .B(haddr[3]), .C(n137), .Y(n136) );
  OAI22X1 U102 ( .A(n129), .B(n138), .C(n135), .D(n127), .Y(next_ws[6]) );
  OAI21X1 U103 ( .A(n127), .B(n139), .C(n140), .Y(next_ws[5]) );
  NAND3X1 U104 ( .A(n132), .B(n141), .C(n142), .Y(n140) );
  OAI21X1 U105 ( .A(n127), .B(n139), .C(n143), .Y(next_ws[4]) );
  NAND3X1 U106 ( .A(n134), .B(n132), .C(n142), .Y(n143) );
  OAI22X1 U139 ( .A(n129), .B(n144), .C(n145), .D(n127), .Y(next_ws[3]) );
  OAI22X1 U140 ( .A(n129), .B(n146), .C(n145), .D(n127), .Y(next_ws[2]) );
  NOR2X1 U141 ( .A(n129), .B(n147), .Y(next_ws[10]) );
  OAI22X1 U142 ( .A(n129), .B(n148), .C(n149), .D(n127), .Y(next_ws[0]) );
  AOI21X1 U143 ( .A(n150), .B(n151), .C(n152), .Y(next_rs[3]) );
  INVX1 U144 ( .A(n153), .Y(n151) );
  OAI21X1 U145 ( .A(n147), .B(n154), .C(n155), .Y(n153) );
  AOI21X1 U146 ( .A(n156), .B(n157), .C(n152), .Y(next_rs[1]) );
  INVX1 U147 ( .A(n158), .Y(n157) );
  AOI21X1 U148 ( .A(n159), .B(n160), .C(n161), .Y(n156) );
  INVX1 U149 ( .A(n162), .Y(n161) );
  OAI21X1 U150 ( .A(n141), .B(n163), .C(n164), .Y(n162) );
  NAND3X1 U151 ( .A(n165), .B(n166), .C(n149), .Y(n160) );
  AND2X1 U152 ( .A(n167), .B(n168), .Y(next_rs[0]) );
  OAI21X1 U153 ( .A(n169), .B(n154), .C(n170), .Y(n168) );
  INVX1 U154 ( .A(n171), .Y(n170) );
  MUX2X1 U155 ( .B(n172), .A(n173), .S(n174), .Y(n523) );
  INVX1 U156 ( .A(F2_coeff[8]), .Y(n173) );
  MUX2X1 U157 ( .B(n175), .A(n176), .S(n174), .Y(n524) );
  MUX2X1 U158 ( .B(n177), .A(n178), .S(n174), .Y(n525) );
  MUX2X1 U159 ( .B(n179), .A(n180), .S(n174), .Y(n526) );
  MUX2X1 U160 ( .B(n181), .A(n182), .S(n174), .Y(n527) );
  MUX2X1 U161 ( .B(n183), .A(n184), .S(n174), .Y(n528) );
  MUX2X1 U162 ( .B(n185), .A(n186), .S(n174), .Y(n529) );
  MUX2X1 U163 ( .B(n187), .A(n188), .S(n174), .Y(n530) );
  NAND3X1 U164 ( .A(n189), .B(n190), .C(ws[7]), .Y(n174) );
  MUX2X1 U165 ( .B(n172), .A(n191), .S(n192), .Y(n531) );
  MUX2X1 U166 ( .B(n175), .A(n193), .S(n192), .Y(n532) );
  INVX1 U167 ( .A(F3_coeff[9]), .Y(n193) );
  MUX2X1 U168 ( .B(n177), .A(n194), .S(n192), .Y(n533) );
  INVX1 U169 ( .A(F3_coeff[10]), .Y(n194) );
  MUX2X1 U170 ( .B(n179), .A(n195), .S(n192), .Y(n534) );
  INVX1 U171 ( .A(F3_coeff[11]), .Y(n195) );
  MUX2X1 U172 ( .B(n181), .A(n196), .S(n192), .Y(n535) );
  INVX1 U173 ( .A(F3_coeff[12]), .Y(n196) );
  MUX2X1 U174 ( .B(n183), .A(n197), .S(n192), .Y(n536) );
  INVX1 U175 ( .A(F3_coeff[13]), .Y(n197) );
  MUX2X1 U176 ( .B(n185), .A(n198), .S(n192), .Y(n537) );
  INVX1 U177 ( .A(F3_coeff[14]), .Y(n198) );
  MUX2X1 U178 ( .B(n187), .A(n199), .S(n192), .Y(n538) );
  NAND3X1 U179 ( .A(n200), .B(n201), .C(ws[9]), .Y(n192) );
  INVX1 U180 ( .A(F3_coeff[15]), .Y(n199) );
  MUX2X1 U181 ( .B(n202), .A(n203), .S(n204), .Y(n539) );
  INVX1 U182 ( .A(F3_coeff[0]), .Y(n203) );
  MUX2X1 U183 ( .B(n205), .A(n206), .S(n204), .Y(n540) );
  MUX2X1 U184 ( .B(n207), .A(n208), .S(n204), .Y(n541) );
  MUX2X1 U185 ( .B(n209), .A(n210), .S(n204), .Y(n542) );
  MUX2X1 U186 ( .B(n211), .A(n212), .S(n204), .Y(n543) );
  MUX2X1 U187 ( .B(n213), .A(n214), .S(n204), .Y(n544) );
  MUX2X1 U188 ( .B(n215), .A(n216), .S(n204), .Y(n545) );
  MUX2X1 U189 ( .B(n217), .A(n218), .S(n204), .Y(n546) );
  NAND3X1 U190 ( .A(n200), .B(n201), .C(ws[8]), .Y(n204) );
  MUX2X1 U191 ( .B(n219), .A(n172), .S(n220), .Y(n547) );
  INVX1 U192 ( .A(sample_data[8]), .Y(n219) );
  MUX2X1 U193 ( .B(n221), .A(n175), .S(n220), .Y(n548) );
  INVX1 U194 ( .A(sample_data[9]), .Y(n221) );
  MUX2X1 U195 ( .B(n222), .A(n177), .S(n220), .Y(n549) );
  INVX1 U196 ( .A(sample_data[10]), .Y(n222) );
  MUX2X1 U197 ( .B(n223), .A(n179), .S(n220), .Y(n550) );
  INVX1 U198 ( .A(sample_data[11]), .Y(n223) );
  MUX2X1 U199 ( .B(n224), .A(n181), .S(n220), .Y(n551) );
  INVX1 U200 ( .A(sample_data[12]), .Y(n224) );
  MUX2X1 U201 ( .B(n225), .A(n183), .S(n220), .Y(n552) );
  INVX1 U202 ( .A(sample_data[13]), .Y(n225) );
  MUX2X1 U203 ( .B(n226), .A(n185), .S(n220), .Y(n553) );
  INVX1 U204 ( .A(sample_data[14]), .Y(n226) );
  MUX2X1 U205 ( .B(n227), .A(n187), .S(n220), .Y(n554) );
  AND2X1 U206 ( .A(ws[1]), .B(n228), .Y(n220) );
  INVX1 U207 ( .A(sample_data[15]), .Y(n227) );
  MUX2X1 U208 ( .B(n229), .A(n202), .S(n230), .Y(n555) );
  INVX1 U209 ( .A(sample_data[0]), .Y(n229) );
  MUX2X1 U210 ( .B(n231), .A(n205), .S(n230), .Y(n556) );
  INVX1 U211 ( .A(sample_data[1]), .Y(n231) );
  MUX2X1 U212 ( .B(n232), .A(n207), .S(n230), .Y(n557) );
  INVX1 U213 ( .A(sample_data[2]), .Y(n232) );
  MUX2X1 U214 ( .B(n233), .A(n209), .S(n230), .Y(n558) );
  INVX1 U215 ( .A(sample_data[3]), .Y(n233) );
  MUX2X1 U216 ( .B(n234), .A(n211), .S(n230), .Y(n559) );
  INVX1 U217 ( .A(sample_data[4]), .Y(n234) );
  MUX2X1 U218 ( .B(n235), .A(n213), .S(n230), .Y(n560) );
  INVX1 U219 ( .A(sample_data[5]), .Y(n235) );
  MUX2X1 U220 ( .B(n236), .A(n215), .S(n230), .Y(n561) );
  INVX1 U221 ( .A(sample_data[6]), .Y(n236) );
  MUX2X1 U222 ( .B(n237), .A(n217), .S(n230), .Y(n562) );
  AND2X1 U223 ( .A(ws[0]), .B(n228), .Y(n230) );
  NOR3X1 U224 ( .A(ws[2]), .B(ws[3]), .C(n238), .Y(n228) );
  INVX1 U225 ( .A(sample_data[7]), .Y(n237) );
  MUX2X1 U226 ( .B(n239), .A(n172), .S(n240), .Y(n563) );
  MUX2X1 U227 ( .B(n241), .A(n175), .S(n240), .Y(n564) );
  INVX1 U228 ( .A(F0_coeff[9]), .Y(n241) );
  MUX2X1 U229 ( .B(n242), .A(n177), .S(n240), .Y(n565) );
  INVX1 U230 ( .A(F0_coeff[10]), .Y(n242) );
  MUX2X1 U231 ( .B(n243), .A(n179), .S(n240), .Y(n566) );
  INVX1 U232 ( .A(F0_coeff[11]), .Y(n243) );
  MUX2X1 U233 ( .B(n244), .A(n181), .S(n240), .Y(n567) );
  INVX1 U234 ( .A(F0_coeff[12]), .Y(n244) );
  MUX2X1 U235 ( .B(n245), .A(n183), .S(n240), .Y(n568) );
  INVX1 U236 ( .A(F0_coeff[13]), .Y(n245) );
  MUX2X1 U237 ( .B(n246), .A(n185), .S(n240), .Y(n569) );
  INVX1 U238 ( .A(F0_coeff[14]), .Y(n246) );
  MUX2X1 U239 ( .B(n247), .A(n187), .S(n240), .Y(n570) );
  AND2X1 U240 ( .A(ws[3]), .B(n248), .Y(n240) );
  INVX1 U241 ( .A(F0_coeff[15]), .Y(n247) );
  MUX2X1 U242 ( .B(n172), .A(n249), .S(n250), .Y(n571) );
  INVX1 U243 ( .A(F1_coeff[8]), .Y(n249) );
  INVX1 U244 ( .A(hwdata[8]), .Y(n172) );
  MUX2X1 U245 ( .B(n175), .A(n251), .S(n250), .Y(n572) );
  INVX1 U246 ( .A(hwdata[9]), .Y(n175) );
  MUX2X1 U247 ( .B(n177), .A(n252), .S(n250), .Y(n573) );
  INVX1 U248 ( .A(hwdata[10]), .Y(n177) );
  MUX2X1 U249 ( .B(n179), .A(n253), .S(n250), .Y(n574) );
  INVX1 U250 ( .A(hwdata[11]), .Y(n179) );
  MUX2X1 U251 ( .B(n181), .A(n254), .S(n250), .Y(n575) );
  INVX1 U252 ( .A(hwdata[12]), .Y(n181) );
  MUX2X1 U253 ( .B(n183), .A(n255), .S(n250), .Y(n576) );
  INVX1 U254 ( .A(hwdata[13]), .Y(n183) );
  MUX2X1 U255 ( .B(n185), .A(n256), .S(n250), .Y(n577) );
  INVX1 U256 ( .A(hwdata[14]), .Y(n185) );
  MUX2X1 U257 ( .B(n187), .A(n257), .S(n250), .Y(n578) );
  NAND3X1 U258 ( .A(n258), .B(n259), .C(ws[5]), .Y(n250) );
  INVX1 U259 ( .A(hwdata[15]), .Y(n187) );
  INVX1 U260 ( .A(n260), .Y(n579) );
  OAI21X1 U261 ( .A(n158), .B(n261), .C(n167), .Y(n260) );
  OAI21X1 U262 ( .A(n262), .B(n263), .C(n264), .Y(n261) );
  OAI21X1 U263 ( .A(n265), .B(n266), .C(n159), .Y(n264) );
  INVX1 U264 ( .A(n139), .Y(n265) );
  AOI21X1 U265 ( .A(n134), .B(n133), .C(n267), .Y(n262) );
  NAND2X1 U266 ( .A(n148), .B(n165), .Y(n267) );
  OAI21X1 U267 ( .A(n268), .B(n263), .C(n269), .Y(n158) );
  OAI21X1 U268 ( .A(n270), .B(n271), .C(n159), .Y(n269) );
  INVX1 U269 ( .A(n154), .Y(n159) );
  NAND2X1 U270 ( .A(hsize), .B(n272), .Y(n154) );
  INVX1 U271 ( .A(hwrite), .Y(n272) );
  INVX1 U272 ( .A(n128), .Y(n270) );
  NOR2X1 U273 ( .A(n273), .B(n274), .Y(n268) );
  NAND2X1 U274 ( .A(n147), .B(n275), .Y(n274) );
  NAND2X1 U275 ( .A(n146), .B(n130), .Y(n273) );
  INVX1 U276 ( .A(n276), .Y(n580) );
  OAI21X1 U277 ( .A(n171), .B(n277), .C(n167), .Y(n276) );
  NAND2X1 U278 ( .A(n150), .B(n278), .Y(n277) );
  OAI21X1 U279 ( .A(n137), .B(n141), .C(n164), .Y(n278) );
  AOI21X1 U280 ( .A(n142), .B(n164), .C(n279), .Y(n150) );
  AOI21X1 U281 ( .A(n130), .B(n144), .C(n263), .Y(n279) );
  NAND2X1 U282 ( .A(n141), .B(n133), .Y(n130) );
  OAI21X1 U283 ( .A(n280), .B(n263), .C(n155), .Y(n171) );
  OAI21X1 U284 ( .A(n281), .B(n282), .C(n164), .Y(n155) );
  NOR2X1 U285 ( .A(n283), .B(n284), .Y(n282) );
  INVX1 U286 ( .A(n147), .Y(n281) );
  INVX1 U287 ( .A(n164), .Y(n263) );
  NOR2X1 U288 ( .A(hwrite), .B(hsize), .Y(n164) );
  NOR2X1 U289 ( .A(n285), .B(n286), .Y(n280) );
  NAND2X1 U290 ( .A(n166), .B(n284), .Y(n286) );
  INVX1 U291 ( .A(n134), .Y(n284) );
  INVX1 U292 ( .A(n146), .Y(n285) );
  MUX2X1 U293 ( .B(n287), .A(n202), .S(n288), .Y(n631) );
  INVX1 U294 ( .A(F0_coeff[0]), .Y(n287) );
  MUX2X1 U295 ( .B(n289), .A(n205), .S(n288), .Y(n630) );
  INVX1 U296 ( .A(F0_coeff[1]), .Y(n289) );
  MUX2X1 U297 ( .B(n290), .A(n207), .S(n288), .Y(n629) );
  INVX1 U298 ( .A(F0_coeff[2]), .Y(n290) );
  MUX2X1 U299 ( .B(n291), .A(n209), .S(n288), .Y(n628) );
  INVX1 U300 ( .A(F0_coeff[3]), .Y(n291) );
  MUX2X1 U301 ( .B(n292), .A(n211), .S(n288), .Y(n627) );
  INVX1 U302 ( .A(F0_coeff[4]), .Y(n292) );
  MUX2X1 U303 ( .B(n293), .A(n213), .S(n288), .Y(n626) );
  INVX1 U304 ( .A(F0_coeff[5]), .Y(n293) );
  MUX2X1 U305 ( .B(n294), .A(n215), .S(n288), .Y(n625) );
  INVX1 U306 ( .A(F0_coeff[6]), .Y(n294) );
  MUX2X1 U307 ( .B(n295), .A(n217), .S(n288), .Y(n624) );
  AND2X1 U308 ( .A(ws[2]), .B(n248), .Y(n288) );
  NOR3X1 U309 ( .A(ws[0]), .B(ws[1]), .C(n238), .Y(n248) );
  NAND3X1 U310 ( .A(n296), .B(n297), .C(n258), .Y(n238) );
  INVX1 U311 ( .A(F0_coeff[7]), .Y(n295) );
  MUX2X1 U312 ( .B(n202), .A(n298), .S(n299), .Y(n623) );
  MUX2X1 U313 ( .B(n205), .A(n300), .S(n299), .Y(n622) );
  INVX1 U314 ( .A(F1_coeff[1]), .Y(n300) );
  MUX2X1 U315 ( .B(n207), .A(n301), .S(n299), .Y(n621) );
  INVX1 U316 ( .A(F1_coeff[2]), .Y(n301) );
  MUX2X1 U317 ( .B(n209), .A(n302), .S(n299), .Y(n620) );
  INVX1 U318 ( .A(F1_coeff[3]), .Y(n302) );
  MUX2X1 U319 ( .B(n211), .A(n303), .S(n299), .Y(n619) );
  INVX1 U320 ( .A(F1_coeff[4]), .Y(n303) );
  MUX2X1 U321 ( .B(n213), .A(n304), .S(n299), .Y(n618) );
  INVX1 U322 ( .A(F1_coeff[5]), .Y(n304) );
  MUX2X1 U323 ( .B(n215), .A(n305), .S(n299), .Y(n617) );
  INVX1 U324 ( .A(F1_coeff[6]), .Y(n305) );
  MUX2X1 U325 ( .B(n217), .A(n306), .S(n299), .Y(n616) );
  NAND3X1 U326 ( .A(n258), .B(n259), .C(ws[4]), .Y(n299) );
  INVX1 U327 ( .A(n307), .Y(n258) );
  NAND3X1 U328 ( .A(n308), .B(n309), .C(n200), .Y(n307) );
  NOR3X1 U329 ( .A(ws[6]), .B(ws[7]), .C(ws[10]), .Y(n200) );
  INVX1 U330 ( .A(F1_coeff[7]), .Y(n306) );
  MUX2X1 U331 ( .B(n202), .A(n310), .S(n311), .Y(n615) );
  MUX2X1 U332 ( .B(n205), .A(n312), .S(n311), .Y(n614) );
  INVX1 U333 ( .A(F2_coeff[1]), .Y(n312) );
  MUX2X1 U334 ( .B(n207), .A(n313), .S(n311), .Y(n613) );
  INVX1 U335 ( .A(F2_coeff[2]), .Y(n313) );
  MUX2X1 U336 ( .B(n209), .A(n314), .S(n311), .Y(n612) );
  INVX1 U337 ( .A(F2_coeff[3]), .Y(n314) );
  MUX2X1 U338 ( .B(n211), .A(n315), .S(n311), .Y(n611) );
  INVX1 U339 ( .A(F2_coeff[4]), .Y(n315) );
  MUX2X1 U340 ( .B(n213), .A(n316), .S(n311), .Y(n610) );
  INVX1 U341 ( .A(F2_coeff[5]), .Y(n316) );
  MUX2X1 U342 ( .B(n215), .A(n317), .S(n311), .Y(n609) );
  INVX1 U343 ( .A(F2_coeff[6]), .Y(n317) );
  MUX2X1 U344 ( .B(n217), .A(n318), .S(n311), .Y(n608) );
  NAND3X1 U345 ( .A(n189), .B(n190), .C(ws[6]), .Y(n311) );
  INVX1 U346 ( .A(ws[10]), .Y(n190) );
  INVX1 U347 ( .A(F2_coeff[7]), .Y(n318) );
  OAI22X1 U348 ( .A(n319), .B(n320), .C(n202), .D(n321), .Y(n607) );
  INVX1 U349 ( .A(hwdata[0]), .Y(n202) );
  OAI22X1 U350 ( .A(n319), .B(n322), .C(n205), .D(n321), .Y(n606) );
  INVX1 U351 ( .A(hwdata[1]), .Y(n205) );
  INVX1 U352 ( .A(new_coeff_set[1]), .Y(n322) );
  OAI22X1 U353 ( .A(n319), .B(n323), .C(n207), .D(n321), .Y(n605) );
  INVX1 U354 ( .A(hwdata[2]), .Y(n207) );
  INVX1 U355 ( .A(new_coeff_set[2]), .Y(n323) );
  OAI22X1 U356 ( .A(n319), .B(n324), .C(n209), .D(n321), .Y(n604) );
  INVX1 U357 ( .A(hwdata[3]), .Y(n209) );
  INVX1 U358 ( .A(new_coeff_set[3]), .Y(n324) );
  OAI22X1 U359 ( .A(n319), .B(n325), .C(n211), .D(n321), .Y(n603) );
  INVX1 U360 ( .A(hwdata[4]), .Y(n211) );
  INVX1 U361 ( .A(new_coeff_set[4]), .Y(n325) );
  OAI22X1 U362 ( .A(n319), .B(n326), .C(n213), .D(n321), .Y(n602) );
  INVX1 U363 ( .A(hwdata[5]), .Y(n213) );
  INVX1 U364 ( .A(new_coeff_set[5]), .Y(n326) );
  OAI22X1 U365 ( .A(n319), .B(n327), .C(n215), .D(n321), .Y(n601) );
  INVX1 U366 ( .A(hwdata[6]), .Y(n215) );
  INVX1 U367 ( .A(new_coeff_set[6]), .Y(n327) );
  OAI22X1 U368 ( .A(n319), .B(n328), .C(n217), .D(n321), .Y(n600) );
  OAI21X1 U369 ( .A(set[1]), .B(set[0]), .C(n329), .Y(n321) );
  INVX1 U370 ( .A(n330), .Y(n329) );
  INVX1 U371 ( .A(hwdata[7]), .Y(n217) );
  INVX1 U372 ( .A(new_coeff_set[7]), .Y(n328) );
  OAI21X1 U373 ( .A(set[1]), .B(set[0]), .C(n330), .Y(n319) );
  NAND3X1 U374 ( .A(ws[10]), .B(n189), .C(n331), .Y(n330) );
  NOR2X1 U375 ( .A(ws[7]), .B(ws[6]), .Y(n331) );
  INVX1 U376 ( .A(n332), .Y(n189) );
  NAND3X1 U377 ( .A(n308), .B(n309), .C(n201), .Y(n332) );
  INVX1 U378 ( .A(n333), .Y(n201) );
  NAND3X1 U379 ( .A(n296), .B(n297), .C(n259), .Y(n333) );
  NOR3X1 U380 ( .A(ws[0]), .B(ws[1]), .C(n334), .Y(n259) );
  OR2X1 U381 ( .A(ws[3]), .B(ws[2]), .Y(n334) );
  INVX1 U382 ( .A(ws[5]), .Y(n297) );
  INVX1 U383 ( .A(ws[4]), .Y(n296) );
  INVX1 U384 ( .A(ws[9]), .Y(n309) );
  INVX1 U385 ( .A(ws[8]), .Y(n308) );
  NOR2X1 U386 ( .A(n335), .B(n336), .Y(hresp) );
  NAND3X1 U387 ( .A(n135), .B(n337), .C(n145), .Y(n336) );
  INVX1 U388 ( .A(n266), .Y(n145) );
  NAND2X1 U389 ( .A(n146), .B(n144), .Y(n266) );
  NAND2X1 U390 ( .A(n338), .B(n339), .Y(n144) );
  NAND2X1 U391 ( .A(n338), .B(n340), .Y(n146) );
  OAI21X1 U392 ( .A(n129), .B(n341), .C(n342), .Y(n337) );
  NAND3X1 U393 ( .A(n169), .B(n167), .C(n343), .Y(n342) );
  NOR2X1 U394 ( .A(n163), .B(n137), .Y(n343) );
  INVX1 U395 ( .A(n165), .Y(n137) );
  INVX1 U396 ( .A(n166), .Y(n163) );
  NAND2X1 U397 ( .A(n340), .B(n344), .Y(n166) );
  INVX1 U398 ( .A(n271), .Y(n135) );
  OAI21X1 U399 ( .A(n283), .B(n165), .C(n138), .Y(n271) );
  NAND2X1 U400 ( .A(n142), .B(n340), .Y(n138) );
  NAND2X1 U401 ( .A(n339), .B(n344), .Y(n165) );
  AND2X1 U402 ( .A(haddr[1]), .B(haddr[0]), .Y(n339) );
  NAND3X1 U403 ( .A(n139), .B(n128), .C(n147), .Y(n335) );
  NAND2X1 U404 ( .A(n340), .B(n133), .Y(n147) );
  AND2X1 U405 ( .A(haddr[1]), .B(n345), .Y(n340) );
  NAND2X1 U406 ( .A(n133), .B(n346), .Y(n128) );
  NOR2X1 U407 ( .A(n283), .B(n344), .Y(n133) );
  NAND2X1 U408 ( .A(n142), .B(n346), .Y(n139) );
  INVX1 U409 ( .A(n169), .Y(n346) );
  NOR2X1 U410 ( .A(n141), .B(n134), .Y(n169) );
  NOR2X1 U411 ( .A(n283), .B(haddr[2]), .Y(n142) );
  INVX1 U412 ( .A(haddr[3]), .Y(n283) );
  OR2X1 U413 ( .A(n347), .B(n348), .Y(hrdata[9]) );
  OAI21X1 U414 ( .A(n349), .B(n176), .C(n350), .Y(n348) );
  AOI22X1 U415 ( .A(n351), .B(F0_coeff[9]), .C(n352), .D(F3_coeff[9]), .Y(n350) );
  INVX1 U416 ( .A(F2_coeff[9]), .Y(n176) );
  OAI21X1 U417 ( .A(n353), .B(n251), .C(n354), .Y(n347) );
  AOI22X1 U418 ( .A(res[9]), .B(n355), .C(sample_data[9]), .D(n356), .Y(n354)
         );
  INVX1 U419 ( .A(F1_coeff[9]), .Y(n251) );
  NAND3X1 U420 ( .A(n357), .B(n358), .C(n359), .Y(hrdata[8]) );
  AOI21X1 U421 ( .A(F2_coeff[8]), .B(n360), .C(n361), .Y(n359) );
  OAI22X1 U422 ( .A(n191), .B(n362), .C(n239), .D(n363), .Y(n361) );
  INVX1 U423 ( .A(F0_coeff[8]), .Y(n239) );
  INVX1 U424 ( .A(F3_coeff[8]), .Y(n191) );
  AOI22X1 U425 ( .A(n364), .B(status[8]), .C(res[8]), .D(n355), .Y(n358) );
  NOR2X1 U426 ( .A(rs[2]), .B(n365), .Y(n364) );
  AOI22X1 U427 ( .A(n366), .B(n367), .C(n368), .D(rs[4]), .Y(n365) );
  AOI22X1 U428 ( .A(sample_data[8]), .B(n356), .C(F1_coeff[8]), .D(n369), .Y(
        n357) );
  INVX1 U429 ( .A(n353), .Y(n369) );
  NAND3X1 U430 ( .A(n370), .B(n371), .C(n372), .Y(hrdata[7]) );
  AOI21X1 U431 ( .A(sample_data[7]), .B(n373), .C(n374), .Y(n372) );
  OAI21X1 U432 ( .A(n375), .B(n218), .C(n376), .Y(n374) );
  NAND2X1 U433 ( .A(res[7]), .B(n377), .Y(n376) );
  INVX1 U434 ( .A(F3_coeff[7]), .Y(n218) );
  AOI22X1 U435 ( .A(n378), .B(F1_coeff[7]), .C(F2_coeff[7]), .D(n379), .Y(n371) );
  AOI22X1 U436 ( .A(n380), .B(new_coeff_set[7]), .C(n381), .D(F0_coeff[7]), 
        .Y(n370) );
  NAND3X1 U437 ( .A(n382), .B(n383), .C(n384), .Y(hrdata[6]) );
  AOI21X1 U438 ( .A(sample_data[6]), .B(n373), .C(n385), .Y(n384) );
  OAI21X1 U439 ( .A(n375), .B(n216), .C(n386), .Y(n385) );
  NAND2X1 U440 ( .A(res[6]), .B(n377), .Y(n386) );
  INVX1 U441 ( .A(F3_coeff[6]), .Y(n216) );
  AOI22X1 U442 ( .A(n378), .B(F1_coeff[6]), .C(F2_coeff[6]), .D(n379), .Y(n383) );
  AOI22X1 U443 ( .A(n380), .B(new_coeff_set[6]), .C(n381), .D(F0_coeff[6]), 
        .Y(n382) );
  NAND3X1 U444 ( .A(n387), .B(n388), .C(n389), .Y(hrdata[5]) );
  AOI21X1 U445 ( .A(sample_data[5]), .B(n373), .C(n390), .Y(n389) );
  OAI21X1 U446 ( .A(n375), .B(n214), .C(n391), .Y(n390) );
  NAND2X1 U447 ( .A(res[5]), .B(n377), .Y(n391) );
  INVX1 U448 ( .A(F3_coeff[5]), .Y(n214) );
  AOI22X1 U449 ( .A(n378), .B(F1_coeff[5]), .C(F2_coeff[5]), .D(n379), .Y(n388) );
  AOI22X1 U450 ( .A(n380), .B(new_coeff_set[5]), .C(n381), .D(F0_coeff[5]), 
        .Y(n387) );
  NAND3X1 U451 ( .A(n392), .B(n393), .C(n394), .Y(hrdata[4]) );
  AOI21X1 U452 ( .A(sample_data[4]), .B(n373), .C(n395), .Y(n394) );
  OAI21X1 U453 ( .A(n375), .B(n212), .C(n396), .Y(n395) );
  NAND2X1 U454 ( .A(res[4]), .B(n377), .Y(n396) );
  INVX1 U455 ( .A(F3_coeff[4]), .Y(n212) );
  AOI22X1 U456 ( .A(n378), .B(F1_coeff[4]), .C(F2_coeff[4]), .D(n379), .Y(n393) );
  AOI22X1 U457 ( .A(n380), .B(new_coeff_set[4]), .C(n381), .D(F0_coeff[4]), 
        .Y(n392) );
  NAND3X1 U458 ( .A(n397), .B(n398), .C(n399), .Y(hrdata[3]) );
  AOI21X1 U459 ( .A(sample_data[3]), .B(n373), .C(n400), .Y(n399) );
  OAI21X1 U460 ( .A(n375), .B(n210), .C(n401), .Y(n400) );
  NAND2X1 U461 ( .A(res[3]), .B(n377), .Y(n401) );
  INVX1 U462 ( .A(F3_coeff[3]), .Y(n210) );
  AOI22X1 U463 ( .A(n378), .B(F1_coeff[3]), .C(F2_coeff[3]), .D(n379), .Y(n398) );
  AOI22X1 U464 ( .A(n380), .B(new_coeff_set[3]), .C(n381), .D(F0_coeff[3]), 
        .Y(n397) );
  NAND3X1 U465 ( .A(n402), .B(n403), .C(n404), .Y(hrdata[2]) );
  AOI21X1 U466 ( .A(sample_data[2]), .B(n373), .C(n405), .Y(n404) );
  OAI21X1 U467 ( .A(n375), .B(n208), .C(n406), .Y(n405) );
  NAND2X1 U468 ( .A(res[2]), .B(n377), .Y(n406) );
  INVX1 U469 ( .A(F3_coeff[2]), .Y(n208) );
  AOI22X1 U470 ( .A(n378), .B(F1_coeff[2]), .C(F2_coeff[2]), .D(n379), .Y(n403) );
  AOI22X1 U471 ( .A(n380), .B(new_coeff_set[2]), .C(n381), .D(F0_coeff[2]), 
        .Y(n402) );
  NAND3X1 U472 ( .A(n407), .B(n408), .C(n409), .Y(hrdata[1]) );
  AOI21X1 U473 ( .A(sample_data[1]), .B(n373), .C(n410), .Y(n409) );
  OAI21X1 U474 ( .A(n375), .B(n206), .C(n411), .Y(n410) );
  NAND2X1 U475 ( .A(res[1]), .B(n377), .Y(n411) );
  INVX1 U476 ( .A(F3_coeff[1]), .Y(n206) );
  INVX1 U477 ( .A(n412), .Y(n375) );
  AOI22X1 U478 ( .A(n378), .B(F1_coeff[1]), .C(F2_coeff[1]), .D(n379), .Y(n408) );
  INVX1 U479 ( .A(n413), .Y(n378) );
  AOI22X1 U480 ( .A(n380), .B(new_coeff_set[1]), .C(n381), .D(F0_coeff[1]), 
        .Y(n407) );
  INVX1 U481 ( .A(n414), .Y(n380) );
  OR2X1 U482 ( .A(n415), .B(n416), .Y(hrdata[15]) );
  OAI21X1 U483 ( .A(n349), .B(n188), .C(n417), .Y(n416) );
  AOI22X1 U484 ( .A(n351), .B(F0_coeff[15]), .C(n352), .D(F3_coeff[15]), .Y(
        n417) );
  INVX1 U485 ( .A(F2_coeff[15]), .Y(n188) );
  OAI21X1 U486 ( .A(n353), .B(n257), .C(n418), .Y(n415) );
  AOI22X1 U487 ( .A(res[15]), .B(n355), .C(sample_data[15]), .D(n356), .Y(n418) );
  INVX1 U488 ( .A(F1_coeff[15]), .Y(n257) );
  OR2X1 U489 ( .A(n419), .B(n420), .Y(hrdata[14]) );
  OAI21X1 U490 ( .A(n349), .B(n186), .C(n421), .Y(n420) );
  AOI22X1 U491 ( .A(n351), .B(F0_coeff[14]), .C(n352), .D(F3_coeff[14]), .Y(
        n421) );
  INVX1 U492 ( .A(F2_coeff[14]), .Y(n186) );
  OAI21X1 U493 ( .A(n353), .B(n256), .C(n422), .Y(n419) );
  AOI22X1 U494 ( .A(res[14]), .B(n355), .C(sample_data[14]), .D(n356), .Y(n422) );
  INVX1 U495 ( .A(F1_coeff[14]), .Y(n256) );
  OR2X1 U496 ( .A(n423), .B(n424), .Y(hrdata[13]) );
  OAI21X1 U497 ( .A(n349), .B(n184), .C(n425), .Y(n424) );
  AOI22X1 U498 ( .A(n351), .B(F0_coeff[13]), .C(n352), .D(F3_coeff[13]), .Y(
        n425) );
  INVX1 U499 ( .A(F2_coeff[13]), .Y(n184) );
  OAI21X1 U500 ( .A(n353), .B(n255), .C(n426), .Y(n423) );
  AOI22X1 U501 ( .A(res[13]), .B(n355), .C(sample_data[13]), .D(n356), .Y(n426) );
  INVX1 U502 ( .A(F1_coeff[13]), .Y(n255) );
  OR2X1 U503 ( .A(n427), .B(n428), .Y(hrdata[12]) );
  OAI21X1 U504 ( .A(n349), .B(n182), .C(n429), .Y(n428) );
  AOI22X1 U505 ( .A(n351), .B(F0_coeff[12]), .C(n352), .D(F3_coeff[12]), .Y(
        n429) );
  INVX1 U506 ( .A(F2_coeff[12]), .Y(n182) );
  OAI21X1 U507 ( .A(n353), .B(n254), .C(n430), .Y(n427) );
  AOI22X1 U508 ( .A(res[12]), .B(n355), .C(sample_data[12]), .D(n356), .Y(n430) );
  INVX1 U509 ( .A(F1_coeff[12]), .Y(n254) );
  OR2X1 U510 ( .A(n431), .B(n432), .Y(hrdata[11]) );
  OAI21X1 U511 ( .A(n349), .B(n180), .C(n433), .Y(n432) );
  AOI22X1 U512 ( .A(n351), .B(F0_coeff[11]), .C(n352), .D(F3_coeff[11]), .Y(
        n433) );
  INVX1 U513 ( .A(F2_coeff[11]), .Y(n180) );
  OAI21X1 U514 ( .A(n353), .B(n253), .C(n434), .Y(n431) );
  AOI22X1 U515 ( .A(res[11]), .B(n355), .C(sample_data[11]), .D(n356), .Y(n434) );
  INVX1 U516 ( .A(F1_coeff[11]), .Y(n253) );
  OR2X1 U517 ( .A(n435), .B(n436), .Y(hrdata[10]) );
  OAI21X1 U518 ( .A(n349), .B(n178), .C(n437), .Y(n436) );
  AOI22X1 U519 ( .A(n351), .B(F0_coeff[10]), .C(n352), .D(F3_coeff[10]), .Y(
        n437) );
  INVX1 U520 ( .A(n362), .Y(n352) );
  NAND3X1 U521 ( .A(rs[2]), .B(n438), .C(rs[1]), .Y(n362) );
  OAI21X1 U522 ( .A(n439), .B(n440), .C(n441), .Y(n438) );
  NAND2X1 U523 ( .A(rs[4]), .B(n442), .Y(n440) );
  INVX1 U524 ( .A(n363), .Y(n351) );
  NAND3X1 U525 ( .A(n442), .B(n367), .C(n443), .Y(n363) );
  INVX1 U526 ( .A(F2_coeff[10]), .Y(n178) );
  INVX1 U527 ( .A(n360), .Y(n349) );
  OAI21X1 U528 ( .A(n439), .B(n444), .C(n445), .Y(n360) );
  NAND2X1 U529 ( .A(n446), .B(n442), .Y(n444) );
  OAI21X1 U530 ( .A(n353), .B(n252), .C(n447), .Y(n435) );
  AOI22X1 U531 ( .A(res[10]), .B(n355), .C(sample_data[10]), .D(n356), .Y(n447) );
  OAI21X1 U532 ( .A(n448), .B(n449), .C(n450), .Y(n356) );
  OAI21X1 U533 ( .A(n451), .B(n452), .C(n453), .Y(n355) );
  NAND2X1 U534 ( .A(n442), .B(n439), .Y(n452) );
  INVX1 U535 ( .A(F1_coeff[10]), .Y(n252) );
  MUX2X1 U536 ( .B(n454), .A(n455), .S(rs[1]), .Y(n353) );
  NOR2X1 U537 ( .A(rs[0]), .B(n456), .Y(n455) );
  NOR2X1 U538 ( .A(n457), .B(n441), .Y(n454) );
  NAND3X1 U539 ( .A(n458), .B(n459), .C(n460), .Y(hrdata[0]) );
  NOR2X1 U540 ( .A(n461), .B(n462), .Y(n460) );
  OAI22X1 U541 ( .A(n320), .B(n414), .C(n463), .D(n310), .Y(n462) );
  INVX1 U542 ( .A(F2_coeff[0]), .Y(n310) );
  INVX1 U543 ( .A(n379), .Y(n463) );
  OAI21X1 U544 ( .A(n456), .B(n464), .C(n445), .Y(n379) );
  NAND2X1 U545 ( .A(n465), .B(n368), .Y(n445) );
  NAND3X1 U546 ( .A(n466), .B(rs[3]), .C(n467), .Y(n414) );
  AOI21X1 U547 ( .A(rs[4]), .B(n442), .C(n465), .Y(n467) );
  INVX1 U548 ( .A(n468), .Y(n465) );
  MUX2X1 U549 ( .B(rs[0]), .A(n457), .S(rs[1]), .Y(n466) );
  INVX1 U550 ( .A(new_coefficient_set), .Y(n320) );
  OAI21X1 U551 ( .A(n298), .B(n413), .C(n469), .Y(n461) );
  NAND3X1 U552 ( .A(status[0]), .B(n470), .C(n471), .Y(n469) );
  NOR2X1 U553 ( .A(rs[2]), .B(rs[1]), .Y(n471) );
  NAND3X1 U554 ( .A(n443), .B(n367), .C(rs[0]), .Y(n413) );
  OAI21X1 U555 ( .A(rs[3]), .B(n468), .C(n456), .Y(n443) );
  NAND3X1 U556 ( .A(rs[4]), .B(n457), .C(rs[3]), .Y(n456) );
  NAND2X1 U557 ( .A(rs[2]), .B(n472), .Y(n468) );
  INVX1 U558 ( .A(F1_coeff[0]), .Y(n298) );
  AOI22X1 U559 ( .A(n381), .B(F0_coeff[0]), .C(res[0]), .D(n377), .Y(n459) );
  OAI21X1 U560 ( .A(n473), .B(n474), .C(n453), .Y(n377) );
  NAND3X1 U561 ( .A(n457), .B(n472), .C(n368), .Y(n453) );
  INVX1 U562 ( .A(n449), .Y(n368) );
  NAND3X1 U563 ( .A(n442), .B(n439), .C(rs[1]), .Y(n449) );
  NAND2X1 U564 ( .A(n470), .B(rs[1]), .Y(n474) );
  NAND2X1 U565 ( .A(rs[4]), .B(n457), .Y(n473) );
  INVX1 U566 ( .A(n475), .Y(n381) );
  NAND3X1 U567 ( .A(rs[2]), .B(n439), .C(n476), .Y(n475) );
  MUX2X1 U568 ( .B(n477), .A(n464), .S(rs[4]), .Y(n476) );
  NAND2X1 U569 ( .A(rs[0]), .B(rs[1]), .Y(n464) );
  NAND2X1 U570 ( .A(n442), .B(n367), .Y(n477) );
  INVX1 U571 ( .A(rs[1]), .Y(n367) );
  INVX1 U572 ( .A(rs[0]), .Y(n442) );
  AOI22X1 U573 ( .A(F3_coeff[0]), .B(n412), .C(sample_data[0]), .D(n373), .Y(
        n458) );
  OAI21X1 U574 ( .A(n451), .B(n478), .C(n450), .Y(n373) );
  NAND3X1 U575 ( .A(rs[1]), .B(n457), .C(n366), .Y(n450) );
  INVX1 U576 ( .A(n441), .Y(n366) );
  INVX1 U577 ( .A(rs[2]), .Y(n457) );
  INVX1 U578 ( .A(n446), .Y(n451) );
  OAI21X1 U579 ( .A(n441), .B(n479), .C(n480), .Y(n412) );
  NAND3X1 U580 ( .A(rs[0]), .B(n446), .C(rs[3]), .Y(n480) );
  NOR2X1 U581 ( .A(n448), .B(rs[1]), .Y(n446) );
  NAND2X1 U582 ( .A(rs[4]), .B(rs[2]), .Y(n448) );
  NAND2X1 U583 ( .A(rs[1]), .B(rs[2]), .Y(n479) );
  NAND2X1 U584 ( .A(n470), .B(n472), .Y(n441) );
  INVX1 U585 ( .A(rs[4]), .Y(n472) );
  INVX1 U586 ( .A(n478), .Y(n470) );
  NAND2X1 U587 ( .A(rs[0]), .B(n439), .Y(n478) );
  INVX1 U588 ( .A(rs[3]), .Y(n439) );
  NAND2X1 U589 ( .A(n481), .B(n482), .Y(fir_coefficient[9]) );
  AOI22X1 U590 ( .A(n124), .B(F3_coeff[9]), .C(n126), .D(F0_coeff[9]), .Y(n482) );
  AOI22X1 U591 ( .A(n123), .B(F1_coeff[9]), .C(n125), .D(F2_coeff[9]), .Y(n481) );
  NAND2X1 U592 ( .A(n487), .B(n488), .Y(fir_coefficient[8]) );
  AOI22X1 U593 ( .A(n124), .B(F3_coeff[8]), .C(n126), .D(F0_coeff[8]), .Y(n488) );
  AOI22X1 U594 ( .A(n123), .B(F1_coeff[8]), .C(n125), .D(F2_coeff[8]), .Y(n487) );
  NAND2X1 U595 ( .A(n489), .B(n490), .Y(fir_coefficient[7]) );
  AOI22X1 U596 ( .A(n124), .B(F3_coeff[7]), .C(n126), .D(F0_coeff[7]), .Y(n490) );
  AOI22X1 U597 ( .A(n123), .B(F1_coeff[7]), .C(n125), .D(F2_coeff[7]), .Y(n489) );
  NAND2X1 U598 ( .A(n491), .B(n492), .Y(fir_coefficient[6]) );
  AOI22X1 U599 ( .A(n124), .B(F3_coeff[6]), .C(n126), .D(F0_coeff[6]), .Y(n492) );
  AOI22X1 U600 ( .A(n123), .B(F1_coeff[6]), .C(n125), .D(F2_coeff[6]), .Y(n491) );
  NAND2X1 U601 ( .A(n493), .B(n494), .Y(fir_coefficient[5]) );
  AOI22X1 U602 ( .A(n124), .B(F3_coeff[5]), .C(n126), .D(F0_coeff[5]), .Y(n494) );
  AOI22X1 U603 ( .A(n123), .B(F1_coeff[5]), .C(n125), .D(F2_coeff[5]), .Y(n493) );
  NAND2X1 U604 ( .A(n495), .B(n496), .Y(fir_coefficient[4]) );
  AOI22X1 U605 ( .A(n124), .B(F3_coeff[4]), .C(n126), .D(F0_coeff[4]), .Y(n496) );
  AOI22X1 U606 ( .A(n123), .B(F1_coeff[4]), .C(n125), .D(F2_coeff[4]), .Y(n495) );
  NAND2X1 U607 ( .A(n497), .B(n498), .Y(fir_coefficient[3]) );
  AOI22X1 U608 ( .A(n124), .B(F3_coeff[3]), .C(n126), .D(F0_coeff[3]), .Y(n498) );
  AOI22X1 U609 ( .A(n123), .B(F1_coeff[3]), .C(n125), .D(F2_coeff[3]), .Y(n497) );
  NAND2X1 U610 ( .A(n499), .B(n500), .Y(fir_coefficient[2]) );
  AOI22X1 U611 ( .A(n124), .B(F3_coeff[2]), .C(n126), .D(F0_coeff[2]), .Y(n500) );
  AOI22X1 U612 ( .A(n123), .B(F1_coeff[2]), .C(n125), .D(F2_coeff[2]), .Y(n499) );
  NAND2X1 U613 ( .A(n501), .B(n502), .Y(fir_coefficient[1]) );
  AOI22X1 U614 ( .A(n124), .B(F3_coeff[1]), .C(n126), .D(F0_coeff[1]), .Y(n502) );
  AOI22X1 U615 ( .A(n123), .B(F1_coeff[1]), .C(n125), .D(F2_coeff[1]), .Y(n501) );
  NAND2X1 U616 ( .A(n503), .B(n504), .Y(fir_coefficient[15]) );
  AOI22X1 U617 ( .A(n124), .B(F3_coeff[15]), .C(n126), .D(F0_coeff[15]), .Y(
        n504) );
  AOI22X1 U618 ( .A(n123), .B(F1_coeff[15]), .C(n125), .D(F2_coeff[15]), .Y(
        n503) );
  NAND2X1 U619 ( .A(n505), .B(n506), .Y(fir_coefficient[14]) );
  AOI22X1 U620 ( .A(n124), .B(F3_coeff[14]), .C(n126), .D(F0_coeff[14]), .Y(
        n506) );
  AOI22X1 U621 ( .A(n123), .B(F1_coeff[14]), .C(n125), .D(F2_coeff[14]), .Y(
        n505) );
  NAND2X1 U622 ( .A(n507), .B(n508), .Y(fir_coefficient[13]) );
  AOI22X1 U623 ( .A(n124), .B(F3_coeff[13]), .C(n126), .D(F0_coeff[13]), .Y(
        n508) );
  AOI22X1 U624 ( .A(n123), .B(F1_coeff[13]), .C(n125), .D(F2_coeff[13]), .Y(
        n507) );
  NAND2X1 U625 ( .A(n509), .B(n510), .Y(fir_coefficient[12]) );
  AOI22X1 U626 ( .A(n124), .B(F3_coeff[12]), .C(n126), .D(F0_coeff[12]), .Y(
        n510) );
  AOI22X1 U627 ( .A(n123), .B(F1_coeff[12]), .C(n125), .D(F2_coeff[12]), .Y(
        n509) );
  NAND2X1 U628 ( .A(n511), .B(n512), .Y(fir_coefficient[11]) );
  AOI22X1 U629 ( .A(n124), .B(F3_coeff[11]), .C(n126), .D(F0_coeff[11]), .Y(
        n512) );
  AOI22X1 U630 ( .A(n123), .B(F1_coeff[11]), .C(n125), .D(F2_coeff[11]), .Y(
        n511) );
  NAND2X1 U631 ( .A(n513), .B(n514), .Y(fir_coefficient[10]) );
  AOI22X1 U632 ( .A(n124), .B(F3_coeff[10]), .C(n126), .D(F0_coeff[10]), .Y(
        n514) );
  AOI22X1 U633 ( .A(n123), .B(F1_coeff[10]), .C(n125), .D(F2_coeff[10]), .Y(
        n513) );
  NAND2X1 U634 ( .A(n515), .B(n516), .Y(fir_coefficient[0]) );
  AOI22X1 U635 ( .A(n124), .B(F3_coeff[0]), .C(n126), .D(F0_coeff[0]), .Y(n516) );
  NOR2X1 U636 ( .A(coefficient_num[0]), .B(coefficient_num[1]), .Y(n484) );
  NOR2X1 U637 ( .A(n517), .B(n518), .Y(n483) );
  AOI22X1 U638 ( .A(n123), .B(F1_coeff[0]), .C(n125), .D(F2_coeff[0]), .Y(n515) );
  NOR2X1 U639 ( .A(n517), .B(coefficient_num[0]), .Y(n486) );
  INVX1 U640 ( .A(coefficient_num[1]), .Y(n517) );
  NOR2X1 U641 ( .A(n518), .B(coefficient_num[1]), .Y(n485) );
  INVX1 U642 ( .A(coefficient_num[0]), .Y(n518) );
  OAI21X1 U643 ( .A(n129), .B(n148), .C(n519), .Y(dr) );
  INVX1 U644 ( .A(next_ws[1]), .Y(n519) );
  OAI22X1 U645 ( .A(n129), .B(n275), .C(n149), .D(n127), .Y(next_ws[1]) );
  NAND2X1 U646 ( .A(hsize), .B(n132), .Y(n127) );
  INVX1 U647 ( .A(n129), .Y(n132) );
  INVX1 U648 ( .A(n341), .Y(n149) );
  NAND2X1 U649 ( .A(n148), .B(n275), .Y(n341) );
  NAND2X1 U650 ( .A(n338), .B(n141), .Y(n275) );
  NOR2X1 U651 ( .A(n345), .B(haddr[1]), .Y(n141) );
  INVX1 U652 ( .A(haddr[0]), .Y(n345) );
  NAND2X1 U653 ( .A(n338), .B(n134), .Y(n148) );
  NOR2X1 U654 ( .A(haddr[0]), .B(haddr[1]), .Y(n134) );
  NOR2X1 U655 ( .A(n344), .B(haddr[3]), .Y(n338) );
  INVX1 U656 ( .A(haddr[2]), .Y(n344) );
  NAND2X1 U657 ( .A(hwrite), .B(n167), .Y(n129) );
  INVX1 U658 ( .A(n152), .Y(n167) );
  NAND3X1 U659 ( .A(hsel), .B(n520), .C(htrans[1]), .Y(n152) );
  INVX1 U660 ( .A(htrans[0]), .Y(n520) );
  NOR2X1 U661 ( .A(err), .B(n521), .Y(N222) );
  AOI21X1 U662 ( .A(set[0]), .B(n522), .C(modwait), .Y(n521) );
  INVX1 U663 ( .A(set[1]), .Y(n522) );
endmodule


module coefficient_loader ( clk, n_reset, new_coefficient_set, modwait, 
        load_coeff, coefficient_num, set );
  output [1:0] coefficient_num;
  output [1:0] set;
  input clk, n_reset, new_coefficient_set, modwait;
  output load_coeff;
  wire   next_lc, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62;
  wire   [3:0] state;
  wire   [3:0] next_state;
  wire   [1:0] next_coeff_num;
  wire   [1:0] next_set;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[3]) );
  DFFSR \set_reg[1]  ( .D(next_set[1]), .CLK(clk), .R(1'b1), .S(n_reset), .Q(
        set[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \set_reg[0]  ( .D(next_set[0]), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        set[0]) );
  DFFSR \coefficient_num_reg[1]  ( .D(next_coeff_num[1]), .CLK(clk), .R(
        n_reset), .S(1'b1), .Q(coefficient_num[1]) );
  DFFSR \coefficient_num_reg[0]  ( .D(next_coeff_num[0]), .CLK(clk), .R(
        n_reset), .S(1'b1), .Q(coefficient_num[0]) );
  DFFSR load_coeff_reg ( .D(next_lc), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        load_coeff) );
  OAI22X1 U3 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(next_state[3]) );
  NAND3X1 U4 ( .A(n5), .B(n6), .C(n7), .Y(next_state[2]) );
  AOI21X1 U5 ( .A(n8), .B(state[2]), .C(n9), .Y(n7) );
  OR2X1 U6 ( .A(n10), .B(n20), .Y(next_state[1]) );
  OAI21X1 U7 ( .A(n21), .B(n22), .C(n23), .Y(n20) );
  OAI21X1 U8 ( .A(n24), .B(n25), .C(n26), .Y(n10) );
  OAI21X1 U9 ( .A(modwait), .B(n27), .C(n28), .Y(next_state[0]) );
  MUX2X1 U10 ( .B(n29), .A(n8), .S(state[0]), .Y(n28) );
  NOR2X1 U11 ( .A(n25), .B(n30), .Y(n29) );
  INVX1 U12 ( .A(n31), .Y(n27) );
  OAI21X1 U13 ( .A(n32), .B(n33), .C(n34), .Y(next_set[1]) );
  OAI21X1 U23 ( .A(n3), .B(set[1]), .C(state[3]), .Y(n34) );
  INVX1 U24 ( .A(n33), .Y(n3) );
  INVX1 U25 ( .A(n30), .Y(n32) );
  MUX2X1 U26 ( .B(n35), .A(n36), .S(state[3]), .Y(next_set[0]) );
  NAND2X1 U27 ( .A(set[0]), .B(n33), .Y(n36) );
  NAND2X1 U28 ( .A(n1), .B(n2), .Y(n33) );
  MUX2X1 U29 ( .B(n37), .A(n1), .S(n38), .Y(n35) );
  NAND2X1 U30 ( .A(n1), .B(n30), .Y(n37) );
  AND2X1 U31 ( .A(n39), .B(n40), .Y(n1) );
  XOR2X1 U32 ( .A(n21), .B(state[0]), .Y(n39) );
  NOR2X1 U33 ( .A(n41), .B(n42), .Y(next_lc) );
  MUX2X1 U34 ( .B(n24), .A(n43), .S(state[3]), .Y(n42) );
  NAND2X1 U35 ( .A(n44), .B(n24), .Y(n43) );
  MUX2X1 U36 ( .B(n45), .A(load_coeff), .S(state[3]), .Y(n41) );
  AOI21X1 U37 ( .A(n44), .B(n30), .C(modwait), .Y(n45) );
  NAND2X1 U38 ( .A(new_coefficient_set), .B(n46), .Y(n30) );
  NAND2X1 U39 ( .A(n47), .B(n48), .Y(next_coeff_num[1]) );
  AOI21X1 U40 ( .A(coefficient_num[1]), .B(n8), .C(n49), .Y(n48) );
  INVX1 U41 ( .A(n50), .Y(n49) );
  INVX1 U42 ( .A(n51), .Y(n47) );
  OAI21X1 U43 ( .A(n5), .B(modwait), .C(n23), .Y(n51) );
  INVX1 U44 ( .A(n9), .Y(n23) );
  NAND2X1 U45 ( .A(n52), .B(n53), .Y(n9) );
  NAND3X1 U46 ( .A(n54), .B(n26), .C(n55), .Y(next_coeff_num[0]) );
  AOI21X1 U47 ( .A(coefficient_num[0]), .B(n8), .C(n56), .Y(n55) );
  MUX2X1 U48 ( .B(n5), .A(n53), .S(n46), .Y(n56) );
  INVX1 U49 ( .A(modwait), .Y(n46) );
  INVX1 U50 ( .A(n22), .Y(n8) );
  NAND3X1 U51 ( .A(n57), .B(n50), .C(n58), .Y(n22) );
  NOR2X1 U52 ( .A(n31), .B(n59), .Y(n58) );
  OAI21X1 U53 ( .A(state[0]), .B(n60), .C(n52), .Y(n59) );
  NAND3X1 U54 ( .A(state[0]), .B(n21), .C(n61), .Y(n52) );
  NAND3X1 U55 ( .A(n26), .B(n5), .C(n53), .Y(n31) );
  NAND3X1 U56 ( .A(state[1]), .B(n24), .C(n61), .Y(n53) );
  NAND3X1 U57 ( .A(n24), .B(n21), .C(n61), .Y(n5) );
  INVX1 U58 ( .A(state[0]), .Y(n24) );
  AND2X1 U59 ( .A(n25), .B(n6), .Y(n57) );
  NAND2X1 U60 ( .A(n44), .B(n4), .Y(n25) );
  INVX1 U61 ( .A(n60), .Y(n44) );
  NAND2X1 U62 ( .A(n21), .B(n40), .Y(n60) );
  NAND3X1 U63 ( .A(n40), .B(n4), .C(n62), .Y(n26) );
  NOR2X1 U64 ( .A(state[0]), .B(n21), .Y(n62) );
  INVX1 U65 ( .A(state[1]), .Y(n21) );
  AND2X1 U66 ( .A(n6), .B(n50), .Y(n54) );
  NAND2X1 U67 ( .A(n61), .B(n38), .Y(n50) );
  NOR2X1 U68 ( .A(n40), .B(state[3]), .Y(n61) );
  NAND3X1 U69 ( .A(n40), .B(n4), .C(n38), .Y(n6) );
  INVX1 U70 ( .A(n2), .Y(n38) );
  NAND2X1 U71 ( .A(state[1]), .B(state[0]), .Y(n2) );
  INVX1 U72 ( .A(state[3]), .Y(n4) );
  INVX1 U73 ( .A(state[2]), .Y(n40) );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   n173, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n24,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172;
  wire   [4:0] state;
  assign src1[3] = 1'b0;

  DFFSR \state_reg[0]  ( .D(n172), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[4]  ( .D(n205), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4]) );
  DFFSR \state_reg[3]  ( .D(n171), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3]) );
  DFFSR \state_reg[2]  ( .D(n203), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(n204), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR err_reg ( .D(n202), .CLK(clk), .R(n_rst), .S(1'b1), .Q(err) );
  DFFSR cnt_up_reg ( .D(n201), .CLK(clk), .R(n_rst), .S(1'b1), .Q(cnt_up) );
  DFFSR clear_reg ( .D(n200), .CLK(clk), .R(n_rst), .S(1'b1), .Q(clear) );
  DFFSR modwait_reg ( .D(n199), .CLK(clk), .R(n_rst), .S(1'b1), .Q(modwait) );
  DFFSR \op_reg[2]  ( .D(n196), .CLK(clk), .R(n_rst), .S(1'b1), .Q(op[2]) );
  DFFSR \op_reg[1]  ( .D(n197), .CLK(clk), .R(n_rst), .S(1'b1), .Q(op[1]) );
  DFFSR \op_reg[0]  ( .D(n198), .CLK(clk), .R(n_rst), .S(1'b1), .Q(op[0]) );
  DFFSR \src1_reg[2]  ( .D(n193), .CLK(clk), .R(n_rst), .S(1'b1), .Q(src1[2])
         );
  DFFSR \src1_reg[1]  ( .D(n194), .CLK(clk), .R(n_rst), .S(1'b1), .Q(src1[1])
         );
  DFFSR \src1_reg[0]  ( .D(n195), .CLK(clk), .R(n_rst), .S(1'b1), .Q(src1[0])
         );
  DFFSR \src2_reg[3]  ( .D(n189), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n173) );
  DFFSR \src2_reg[2]  ( .D(n190), .CLK(clk), .R(n_rst), .S(1'b1), .Q(src2[2])
         );
  DFFSR \src2_reg[1]  ( .D(n191), .CLK(clk), .R(n_rst), .S(1'b1), .Q(src2[1])
         );
  DFFSR \src2_reg[0]  ( .D(n192), .CLK(clk), .R(n_rst), .S(1'b1), .Q(src2[0])
         );
  DFFSR \dest_reg[3]  ( .D(n185), .CLK(clk), .R(n_rst), .S(1'b1), .Q(dest[3])
         );
  DFFSR \dest_reg[2]  ( .D(n186), .CLK(clk), .R(n_rst), .S(1'b1), .Q(dest[2])
         );
  DFFSR \dest_reg[1]  ( .D(n187), .CLK(clk), .R(n_rst), .S(1'b1), .Q(dest[1])
         );
  DFFSR \dest_reg[0]  ( .D(n188), .CLK(clk), .R(n_rst), .S(1'b1), .Q(dest[0])
         );
  INVX1 U27 ( .A(n173), .Y(n24) );
  INVX2 U28 ( .A(n24), .Y(src2[3]) );
  INVX1 U29 ( .A(n26), .Y(n171) );
  OAI21X1 U30 ( .A(n27), .B(n28), .C(n29), .Y(n26) );
  NAND3X1 U31 ( .A(n30), .B(n31), .C(n32), .Y(n28) );
  OAI21X1 U32 ( .A(lc), .B(n33), .C(n34), .Y(n27) );
  AOI22X1 U33 ( .A(n35), .B(state[3]), .C(n36), .D(dr), .Y(n34) );
  INVX1 U34 ( .A(n37), .Y(n172) );
  OAI21X1 U35 ( .A(n38), .B(n39), .C(n29), .Y(n37) );
  OAI21X1 U36 ( .A(n40), .B(n41), .C(n42), .Y(n39) );
  NAND3X1 U37 ( .A(n42), .B(n41), .C(n43), .Y(n205) );
  NOR2X1 U38 ( .A(n44), .B(n45), .Y(n43) );
  NAND3X1 U39 ( .A(n46), .B(n47), .C(n48), .Y(n204) );
  NOR2X1 U40 ( .A(n49), .B(n50), .Y(n48) );
  OAI21X1 U41 ( .A(n51), .B(n52), .C(n53), .Y(n50) );
  OAI22X1 U42 ( .A(n54), .B(n40), .C(n55), .D(n56), .Y(n49) );
  AND2X1 U43 ( .A(n57), .B(n58), .Y(n47) );
  AOI21X1 U44 ( .A(n35), .B(state[1]), .C(n59), .Y(n46) );
  INVX1 U45 ( .A(n41), .Y(n35) );
  NAND3X1 U46 ( .A(n60), .B(n61), .C(n62), .Y(n203) );
  NOR2X1 U47 ( .A(n63), .B(n64), .Y(n62) );
  OAI21X1 U48 ( .A(n55), .B(n58), .C(n53), .Y(n64) );
  INVX1 U49 ( .A(n65), .Y(n53) );
  NAND3X1 U50 ( .A(n66), .B(n31), .C(n67), .Y(n65) );
  AOI21X1 U51 ( .A(n68), .B(overflow), .C(n69), .Y(n67) );
  OAI21X1 U52 ( .A(n70), .B(n71), .C(n72), .Y(n69) );
  OAI22X1 U53 ( .A(n73), .B(n41), .C(n52), .D(n71), .Y(n63) );
  NOR2X1 U54 ( .A(n74), .B(n75), .Y(n61) );
  NOR2X1 U55 ( .A(n76), .B(n77), .Y(n60) );
  NAND2X1 U56 ( .A(n78), .B(n66), .Y(n202) );
  INVX1 U57 ( .A(n45), .Y(n66) );
  OAI21X1 U58 ( .A(dr), .B(n79), .C(n80), .Y(n45) );
  NAND3X1 U59 ( .A(n81), .B(n82), .C(overflow), .Y(n80) );
  AOI22X1 U60 ( .A(n83), .B(n84), .C(n36), .D(n85), .Y(n79) );
  AOI22X1 U61 ( .A(err), .B(n86), .C(overflow), .D(n44), .Y(n78) );
  OAI21X1 U62 ( .A(n87), .B(n88), .C(n89), .Y(n201) );
  INVX1 U63 ( .A(cnt_up), .Y(n88) );
  OAI21X1 U64 ( .A(n90), .B(n72), .C(n91), .Y(n200) );
  NAND2X1 U65 ( .A(clear), .B(n86), .Y(n91) );
  OAI21X1 U66 ( .A(n87), .B(n92), .C(n93), .Y(n199) );
  OAI21X1 U67 ( .A(n94), .B(n95), .C(n29), .Y(n93) );
  NAND2X1 U68 ( .A(n96), .B(n97), .Y(n95) );
  NAND2X1 U69 ( .A(n30), .B(n42), .Y(n94) );
  INVX1 U70 ( .A(modwait), .Y(n92) );
  OAI21X1 U71 ( .A(n87), .B(n98), .C(n99), .Y(n198) );
  OAI21X1 U72 ( .A(n100), .B(n38), .C(n29), .Y(n99) );
  OAI21X1 U73 ( .A(n33), .B(n85), .C(n97), .Y(n38) );
  INVX1 U74 ( .A(n101), .Y(n97) );
  NAND3X1 U75 ( .A(n32), .B(n102), .C(n103), .Y(n101) );
  AOI21X1 U76 ( .A(n83), .B(n104), .C(n105), .Y(n103) );
  NAND2X1 U77 ( .A(n106), .B(n57), .Y(n105) );
  NAND3X1 U78 ( .A(state[1]), .B(n40), .C(n107), .Y(n57) );
  INVX1 U79 ( .A(op[0]), .Y(n98) );
  OAI21X1 U80 ( .A(n87), .B(n108), .C(n109), .Y(n197) );
  OAI21X1 U81 ( .A(n110), .B(n111), .C(n29), .Y(n109) );
  INVX1 U82 ( .A(n102), .Y(n110) );
  INVX1 U83 ( .A(op[1]), .Y(n108) );
  NAND3X1 U84 ( .A(n89), .B(n112), .C(n113), .Y(n196) );
  AOI21X1 U85 ( .A(op[2]), .B(n86), .C(n114), .Y(n113) );
  NAND3X1 U86 ( .A(n115), .B(n116), .C(n32), .Y(n195) );
  INVX1 U87 ( .A(n117), .Y(n32) );
  NAND3X1 U88 ( .A(n118), .B(n119), .C(n89), .Y(n117) );
  OAI21X1 U89 ( .A(n77), .B(n68), .C(n55), .Y(n116) );
  INVX1 U90 ( .A(n120), .Y(n68) );
  NAND2X1 U91 ( .A(src1[0]), .B(n86), .Y(n115) );
  NAND3X1 U92 ( .A(n118), .B(n121), .C(n122), .Y(n194) );
  AOI22X1 U93 ( .A(n123), .B(n55), .C(src1[1]), .D(n86), .Y(n122) );
  NAND2X1 U94 ( .A(n120), .B(n58), .Y(n123) );
  NAND3X1 U95 ( .A(n124), .B(n125), .C(n126), .Y(n193) );
  AOI21X1 U96 ( .A(src1[2]), .B(n86), .C(n127), .Y(n126) );
  NAND3X1 U97 ( .A(n89), .B(n125), .C(n128), .Y(n192) );
  AOI22X1 U98 ( .A(src2[0]), .B(n86), .C(n129), .D(n55), .Y(n128) );
  INVX1 U99 ( .A(n58), .Y(n129) );
  NAND3X1 U100 ( .A(n83), .B(n84), .C(dr), .Y(n89) );
  NAND2X1 U101 ( .A(n130), .B(n131), .Y(n191) );
  AOI22X1 U102 ( .A(src2[1]), .B(n86), .C(n77), .D(n55), .Y(n130) );
  INVX1 U103 ( .A(n56), .Y(n77) );
  OAI21X1 U104 ( .A(n87), .B(n132), .C(n131), .Y(n190) );
  INVX1 U105 ( .A(n114), .Y(n131) );
  INVX1 U106 ( .A(src2[2]), .Y(n132) );
  OAI21X1 U107 ( .A(n87), .B(n24), .C(n112), .Y(n189) );
  OAI21X1 U108 ( .A(n87), .B(n133), .C(n134), .Y(n188) );
  OAI21X1 U109 ( .A(n135), .B(n136), .C(n29), .Y(n134) );
  OAI21X1 U110 ( .A(n51), .B(n70), .C(n30), .Y(n136) );
  INVX1 U111 ( .A(n100), .Y(n30) );
  NAND2X1 U112 ( .A(n137), .B(n33), .Y(n135) );
  INVX1 U113 ( .A(dest[0]), .Y(n133) );
  OAI21X1 U114 ( .A(n87), .B(n138), .C(n139), .Y(n187) );
  OAI21X1 U115 ( .A(n140), .B(n141), .C(n29), .Y(n139) );
  OAI21X1 U116 ( .A(n33), .B(n85), .C(n142), .Y(n141) );
  NOR2X1 U117 ( .A(n76), .B(n59), .Y(n142) );
  INVX1 U118 ( .A(n118), .Y(n59) );
  INVX1 U119 ( .A(n124), .Y(n76) );
  NAND3X1 U120 ( .A(n106), .B(n112), .C(n143), .Y(n140) );
  NOR2X1 U121 ( .A(n144), .B(n145), .Y(n143) );
  NAND3X1 U122 ( .A(n36), .B(n146), .C(lc), .Y(n106) );
  INVX1 U123 ( .A(dr), .Y(n146) );
  INVX1 U124 ( .A(dest[1]), .Y(n138) );
  OAI21X1 U125 ( .A(n87), .B(n147), .C(n148), .Y(n186) );
  OAI21X1 U126 ( .A(n127), .B(n111), .C(n29), .Y(n148) );
  NAND2X1 U127 ( .A(n96), .B(n137), .Y(n111) );
  OAI21X1 U128 ( .A(lc), .B(dr), .C(n36), .Y(n137) );
  INVX1 U129 ( .A(n149), .Y(n36) );
  INVX1 U130 ( .A(n150), .Y(n96) );
  NAND3X1 U131 ( .A(n33), .B(n112), .C(n125), .Y(n150) );
  NAND2X1 U132 ( .A(n44), .B(n55), .Y(n112) );
  INVX1 U133 ( .A(overflow), .Y(n55) );
  INVX1 U134 ( .A(n119), .Y(n127) );
  INVX1 U135 ( .A(dest[2]), .Y(n147) );
  INVX1 U136 ( .A(n86), .Y(n87) );
  OAI21X1 U137 ( .A(n102), .B(n90), .C(n151), .Y(n185) );
  NAND2X1 U138 ( .A(dest[3]), .B(n86), .Y(n151) );
  NAND2X1 U139 ( .A(n41), .B(n29), .Y(n86) );
  NAND3X1 U140 ( .A(n152), .B(n153), .C(n154), .Y(n41) );
  NOR2X1 U141 ( .A(n155), .B(n156), .Y(n154) );
  NAND2X1 U142 ( .A(n118), .B(n119), .Y(n156) );
  NAND2X1 U143 ( .A(n83), .B(n75), .Y(n119) );
  NAND2X1 U144 ( .A(n157), .B(n83), .Y(n118) );
  NAND3X1 U145 ( .A(n54), .B(n158), .C(n149), .Y(n155) );
  NAND3X1 U146 ( .A(state[4]), .B(n159), .C(n160), .Y(n149) );
  NOR2X1 U147 ( .A(n161), .B(n73), .Y(n160) );
  NOR2X1 U148 ( .A(n114), .B(n162), .Y(n153) );
  NAND2X1 U149 ( .A(n102), .B(n163), .Y(n162) );
  OAI21X1 U150 ( .A(n82), .B(n164), .C(n81), .Y(n163) );
  INVX1 U151 ( .A(n71), .Y(n81) );
  NAND2X1 U152 ( .A(state[0]), .B(n165), .Y(n71) );
  INVX1 U153 ( .A(n166), .Y(n82) );
  NAND2X1 U154 ( .A(n42), .B(n31), .Y(n114) );
  AOI21X1 U155 ( .A(n104), .B(n83), .C(n145), .Y(n31) );
  INVX1 U156 ( .A(n125), .Y(n145) );
  NAND2X1 U157 ( .A(n75), .B(n167), .Y(n125) );
  INVX1 U158 ( .A(n70), .Y(n75) );
  NOR2X1 U159 ( .A(n165), .B(state[0]), .Y(n83) );
  AOI21X1 U160 ( .A(n40), .B(n107), .C(n74), .Y(n42) );
  NOR2X1 U161 ( .A(n166), .B(n51), .Y(n74) );
  NAND3X1 U162 ( .A(state[2]), .B(n161), .C(state[4]), .Y(n166) );
  NOR2X1 U163 ( .A(n100), .B(n44), .Y(n152) );
  NAND3X1 U164 ( .A(n58), .B(n120), .C(n56), .Y(n44) );
  NAND3X1 U165 ( .A(state[0]), .B(state[1]), .C(n107), .Y(n56) );
  NAND2X1 U166 ( .A(n167), .B(n104), .Y(n120) );
  NAND3X1 U167 ( .A(state[0]), .B(n161), .C(n107), .Y(n58) );
  INVX1 U168 ( .A(n168), .Y(n107) );
  NAND3X1 U169 ( .A(n73), .B(n165), .C(state[4]), .Y(n168) );
  NAND2X1 U170 ( .A(n124), .B(n121), .Y(n100) );
  NAND2X1 U171 ( .A(n167), .B(n84), .Y(n121) );
  NAND2X1 U172 ( .A(n157), .B(n167), .Y(n124) );
  NOR2X1 U173 ( .A(n165), .B(n40), .Y(n167) );
  INVX1 U174 ( .A(n52), .Y(n157) );
  INVX1 U175 ( .A(n29), .Y(n90) );
  NAND2X1 U176 ( .A(n85), .B(n169), .Y(n29) );
  OAI21X1 U177 ( .A(dr), .B(n33), .C(n102), .Y(n169) );
  NAND2X1 U178 ( .A(n84), .B(n159), .Y(n33) );
  INVX1 U179 ( .A(n54), .Y(n84) );
  NAND3X1 U180 ( .A(n73), .B(n170), .C(n161), .Y(n54) );
  INVX1 U181 ( .A(lc), .Y(n85) );
  AOI21X1 U182 ( .A(n164), .B(n159), .C(n144), .Y(n102) );
  INVX1 U183 ( .A(n72), .Y(n144) );
  NAND2X1 U184 ( .A(n104), .B(n159), .Y(n72) );
  INVX1 U185 ( .A(n158), .Y(n104) );
  NAND3X1 U186 ( .A(state[1]), .B(n170), .C(state[2]), .Y(n158) );
  INVX1 U187 ( .A(n51), .Y(n159) );
  NAND2X1 U188 ( .A(n40), .B(n165), .Y(n51) );
  INVX1 U189 ( .A(state[3]), .Y(n165) );
  INVX1 U190 ( .A(state[0]), .Y(n40) );
  NAND2X1 U191 ( .A(n70), .B(n52), .Y(n164) );
  NAND3X1 U192 ( .A(n73), .B(n170), .C(state[1]), .Y(n52) );
  INVX1 U193 ( .A(state[2]), .Y(n73) );
  NAND3X1 U194 ( .A(n161), .B(n170), .C(state[2]), .Y(n70) );
  INVX1 U195 ( .A(state[4]), .Y(n170) );
  INVX1 U196 ( .A(state[1]), .Y(n161) );
endmodule


module flex_counter_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n102, n103, n104, n105, n106, n107;

  DFFSR \count_out_reg[0]  ( .D(n101), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[9]  ( .D(n92), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[1]  ( .D(n100), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n99), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n98), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n97), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n96), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n95), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n94), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n93), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR rollover_flag_reg ( .D(n91), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter_DW01_inc_0 r320 ( .A(count_out), .SUM({N32, N31, N30, N29, N28, 
        N27, N26, N25, N24, N23}) );
  OAI21X1 U9 ( .A(n1), .B(n2), .C(n3), .Y(n99) );
  NAND2X1 U15 ( .A(N25), .B(n4), .Y(n3) );
  OAI21X1 U16 ( .A(n5), .B(n2), .C(n6), .Y(n98) );
  NAND2X1 U17 ( .A(N26), .B(n4), .Y(n6) );
  OAI21X1 U18 ( .A(n7), .B(n2), .C(n8), .Y(n97) );
  NAND2X1 U19 ( .A(N27), .B(n4), .Y(n8) );
  INVX1 U20 ( .A(count_out[4]), .Y(n7) );
  OAI21X1 U21 ( .A(n9), .B(n2), .C(n10), .Y(n96) );
  NAND2X1 U22 ( .A(N28), .B(n4), .Y(n10) );
  OAI21X1 U23 ( .A(n11), .B(n2), .C(n12), .Y(n95) );
  NAND2X1 U24 ( .A(N29), .B(n4), .Y(n12) );
  OAI21X1 U25 ( .A(n24), .B(n2), .C(n25), .Y(n94) );
  NAND2X1 U26 ( .A(N30), .B(n4), .Y(n25) );
  OAI21X1 U27 ( .A(n26), .B(n2), .C(n27), .Y(n93) );
  NAND2X1 U28 ( .A(N31), .B(n4), .Y(n27) );
  INVX1 U29 ( .A(count_out[8]), .Y(n26) );
  OAI21X1 U30 ( .A(n28), .B(n2), .C(n29), .Y(n92) );
  NAND2X1 U31 ( .A(N32), .B(n4), .Y(n29) );
  OAI21X1 U32 ( .A(n30), .B(n31), .C(n32), .Y(n91) );
  OAI21X1 U33 ( .A(n33), .B(rollover_flag), .C(n34), .Y(n32) );
  INVX1 U34 ( .A(n35), .Y(n33) );
  OR2X1 U35 ( .A(n36), .B(n37), .Y(n31) );
  NAND3X1 U36 ( .A(n38), .B(n39), .C(n40), .Y(n37) );
  MUX2X1 U37 ( .B(n41), .A(n42), .S(n43), .Y(n40) );
  NAND2X1 U38 ( .A(count_out[1]), .B(n44), .Y(n42) );
  XOR2X1 U39 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n44) );
  XOR2X1 U40 ( .A(n45), .B(n46), .Y(n39) );
  MUX2X1 U41 ( .B(n47), .A(n48), .S(rollover_val[0]), .Y(n38) );
  OAI21X1 U42 ( .A(count_out[1]), .B(n49), .C(n50), .Y(n48) );
  OAI21X1 U43 ( .A(n43), .B(n51), .C(count_out[0]), .Y(n47) );
  NAND3X1 U44 ( .A(n52), .B(count_enable), .C(n53), .Y(n36) );
  XOR2X1 U45 ( .A(n54), .B(n55), .Y(n53) );
  XOR2X1 U46 ( .A(n56), .B(n57), .Y(n52) );
  NAND3X1 U47 ( .A(n58), .B(n59), .C(n60), .Y(n30) );
  NOR2X1 U48 ( .A(n61), .B(n62), .Y(n60) );
  OAI21X1 U49 ( .A(n54), .B(n63), .C(n64), .Y(n62) );
  OR2X1 U50 ( .A(rollover_val[8]), .B(rollover_val[9]), .Y(n63) );
  XOR2X1 U51 ( .A(n65), .B(count_out[5]), .Y(n61) );
  NAND2X1 U52 ( .A(n66), .B(n67), .Y(n65) );
  OAI21X1 U53 ( .A(rollover_val[4]), .B(n56), .C(rollover_val[5]), .Y(n66) );
  XOR2X1 U54 ( .A(n24), .B(n68), .Y(n59) );
  NAND2X1 U55 ( .A(n69), .B(n54), .Y(n68) );
  OAI21X1 U56 ( .A(rollover_val[6]), .B(n67), .C(rollover_val[7]), .Y(n69) );
  INVX1 U57 ( .A(n46), .Y(n67) );
  NOR2X1 U58 ( .A(n70), .B(n71), .Y(n58) );
  XOR2X1 U59 ( .A(n28), .B(n72), .Y(n71) );
  OAI21X1 U60 ( .A(rollover_val[8]), .B(n54), .C(rollover_val[9]), .Y(n72) );
  NAND3X1 U61 ( .A(n73), .B(n74), .C(n46), .Y(n54) );
  NOR3X1 U62 ( .A(rollover_val[4]), .B(rollover_val[5]), .C(n56), .Y(n46) );
  INVX1 U63 ( .A(rollover_val[7]), .Y(n74) );
  INVX1 U64 ( .A(rollover_val[6]), .Y(n73) );
  XOR2X1 U65 ( .A(n75), .B(count_out[3]), .Y(n70) );
  NAND2X1 U66 ( .A(n76), .B(n56), .Y(n75) );
  NAND3X1 U67 ( .A(n77), .B(n78), .C(n43), .Y(n56) );
  INVX1 U68 ( .A(rollover_val[3]), .Y(n78) );
  INVX1 U69 ( .A(rollover_val[2]), .Y(n77) );
  OAI21X1 U70 ( .A(rollover_val[2]), .B(n79), .C(rollover_val[3]), .Y(n76) );
  INVX1 U71 ( .A(n43), .Y(n79) );
  NOR2X1 U72 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n43) );
  OAI21X1 U73 ( .A(n80), .B(n81), .C(n82), .Y(n101) );
  MUX2X1 U74 ( .B(n83), .A(count_out[0]), .S(n34), .Y(n82) );
  NOR2X1 U75 ( .A(clear), .B(n35), .Y(n83) );
  INVX1 U76 ( .A(N23), .Y(n81) );
  OAI21X1 U77 ( .A(n51), .B(n2), .C(n84), .Y(n100) );
  NAND2X1 U78 ( .A(N24), .B(n4), .Y(n84) );
  INVX1 U79 ( .A(n80), .Y(n4) );
  NAND3X1 U80 ( .A(n2), .B(n64), .C(n35), .Y(n80) );
  NAND3X1 U81 ( .A(n85), .B(n86), .C(n87), .Y(n35) );
  NOR2X1 U82 ( .A(n88), .B(n89), .Y(n87) );
  NAND2X1 U83 ( .A(n90), .B(n102), .Y(n89) );
  XOR2X1 U84 ( .A(n24), .B(rollover_val[7]), .Y(n102) );
  INVX1 U85 ( .A(count_out[7]), .Y(n24) );
  XOR2X1 U86 ( .A(n28), .B(rollover_val[9]), .Y(n90) );
  INVX1 U87 ( .A(count_out[9]), .Y(n28) );
  NAND3X1 U88 ( .A(n103), .B(n104), .C(n105), .Y(n88) );
  XOR2X1 U89 ( .A(n5), .B(rollover_val[3]), .Y(n105) );
  INVX1 U90 ( .A(count_out[3]), .Y(n5) );
  XOR2X1 U91 ( .A(n9), .B(rollover_val[5]), .Y(n104) );
  INVX1 U92 ( .A(count_out[5]), .Y(n9) );
  XOR2X1 U93 ( .A(rollover_val[0]), .B(n50), .Y(n103) );
  INVX1 U94 ( .A(count_out[0]), .Y(n50) );
  NOR2X1 U95 ( .A(n55), .B(n106), .Y(n86) );
  OAI21X1 U96 ( .A(count_out[1]), .B(n49), .C(n45), .Y(n106) );
  XOR2X1 U97 ( .A(n11), .B(rollover_val[6]), .Y(n45) );
  INVX1 U98 ( .A(count_out[6]), .Y(n11) );
  INVX1 U99 ( .A(rollover_val[1]), .Y(n49) );
  XOR2X1 U100 ( .A(count_out[8]), .B(rollover_val[8]), .Y(n55) );
  NOR2X1 U101 ( .A(n41), .B(n57), .Y(n85) );
  XOR2X1 U102 ( .A(count_out[4]), .B(rollover_val[4]), .Y(n57) );
  OAI21X1 U103 ( .A(rollover_val[1]), .B(n51), .C(n107), .Y(n41) );
  XOR2X1 U104 ( .A(n1), .B(rollover_val[2]), .Y(n107) );
  INVX1 U105 ( .A(count_out[2]), .Y(n1) );
  INVX1 U106 ( .A(clear), .Y(n64) );
  INVX1 U107 ( .A(n34), .Y(n2) );
  NOR2X1 U108 ( .A(clear), .B(count_enable), .Y(n34) );
  INVX1 U109 ( .A(count_out[1]), .Y(n51) );
endmodule


module counter ( clk, n_rst, cnt_up, clear, one_k_samples );
  input clk, n_rst, cnt_up, clear;
  output one_k_samples;


  flex_counter C1 ( .clk(clk), .n_rst(n_rst), .clear(clear), .count_enable(
        cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 
        1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n1, n2, n3, n4, n5;

  NAND3X1 U3 ( .A(n1), .B(n2), .C(n3), .Y(w_en) );
  INVX1 U4 ( .A(op[1]), .Y(n1) );
  NOR2X1 U5 ( .A(w_data_sel[1]), .B(n3), .Y(w_data_sel[0]) );
  NAND2X1 U6 ( .A(op[1]), .B(n2), .Y(w_data_sel[1]) );
  INVX1 U7 ( .A(op[2]), .Y(n2) );
  MUX2X1 U8 ( .B(n4), .A(n5), .S(op[1]), .Y(alu_op[1]) );
  NAND2X1 U9 ( .A(op[2]), .B(op[0]), .Y(n4) );
  INVX1 U10 ( .A(n5), .Y(alu_op[0]) );
  NAND2X1 U11 ( .A(op[2]), .B(n3), .Y(n5) );
  INVX1 U12 ( .A(op[0]), .Y(n3) );
endmodule


module alu_DW01_add_0 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [17:1] carry;

  FAX1 U1_17 ( .A(A[17]), .B(B[17]), .C(carry[17]), .YS(SUM[17]) );
  FAX1 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .YC(carry[17]), .YS(
        SUM[16]) );
  FAX1 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .YC(carry[16]), .YS(
        SUM[15]) );
  FAX1 U1_14 ( .A(A[14]), .B(B[14]), .C(carry[14]), .YC(carry[15]), .YS(
        SUM[14]) );
  FAX1 U1_13 ( .A(A[13]), .B(B[13]), .C(carry[13]), .YC(carry[14]), .YS(
        SUM[13]) );
  FAX1 U1_12 ( .A(A[12]), .B(B[12]), .C(carry[12]), .YC(carry[13]), .YS(
        SUM[12]) );
  FAX1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .YC(carry[12]), .YS(
        SUM[11]) );
  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YC(carry[11]), .YS(
        SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module alu_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [18:0] carry;

  FAX1 U2_17 ( .A(A[17]), .B(n1), .C(carry[17]), .YS(DIFF[17]) );
  FAX1 U2_16 ( .A(A[16]), .B(n1), .C(carry[16]), .YC(carry[17]), .YS(DIFF[16])
         );
  FAX1 U2_15 ( .A(A[15]), .B(n2), .C(carry[15]), .YC(carry[16]), .YS(DIFF[15])
         );
  FAX1 U2_14 ( .A(A[14]), .B(n3), .C(carry[14]), .YC(carry[15]), .YS(DIFF[14])
         );
  FAX1 U2_13 ( .A(A[13]), .B(n4), .C(carry[13]), .YC(carry[14]), .YS(DIFF[13])
         );
  FAX1 U2_12 ( .A(A[12]), .B(n5), .C(carry[12]), .YC(carry[13]), .YS(DIFF[12])
         );
  FAX1 U2_11 ( .A(A[11]), .B(n6), .C(carry[11]), .YC(carry[12]), .YS(DIFF[11])
         );
  FAX1 U2_10 ( .A(A[10]), .B(n7), .C(carry[10]), .YC(carry[11]), .YS(DIFF[10])
         );
  FAX1 U2_9 ( .A(A[9]), .B(n8), .C(carry[9]), .YC(carry[10]), .YS(DIFF[9]) );
  FAX1 U2_8 ( .A(A[8]), .B(n9), .C(carry[8]), .YC(carry[9]), .YS(DIFF[8]) );
  FAX1 U2_7 ( .A(A[7]), .B(n10), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n11), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n12), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n13), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n14), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n15), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n16), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n17), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n17), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(B[17]), .Y(n1) );
  INVX2 U4 ( .A(B[15]), .Y(n2) );
  INVX2 U5 ( .A(B[14]), .Y(n3) );
  INVX2 U6 ( .A(B[13]), .Y(n4) );
  INVX2 U7 ( .A(B[12]), .Y(n5) );
  INVX2 U8 ( .A(B[11]), .Y(n6) );
  INVX2 U9 ( .A(B[10]), .Y(n7) );
  INVX2 U10 ( .A(B[9]), .Y(n8) );
  INVX2 U11 ( .A(B[8]), .Y(n9) );
  INVX2 U12 ( .A(B[7]), .Y(n10) );
  INVX2 U13 ( .A(B[6]), .Y(n11) );
  INVX2 U14 ( .A(B[5]), .Y(n12) );
  INVX2 U15 ( .A(B[4]), .Y(n13) );
  INVX2 U16 ( .A(B[3]), .Y(n14) );
  INVX2 U17 ( .A(B[2]), .Y(n15) );
  INVX2 U18 ( .A(B[1]), .Y(n16) );
  INVX2 U19 ( .A(B[0]), .Y(n17) );
endmodule


module alu_DW_mult_uns_1 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n3, n4, n5, n7, n8, n9, n11, n12, n13, n15, n16, n17, n19, n20,
         n21, n23, n25, n27, n29, n31, n33, n35, n37, n39, n41, n43, n45, n47,
         n49, n51, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n86, n87, n88, n89, n91, n92, n94, n95,
         n96, n97, n98, n99, n100, n101, n103, n104, n105, n106, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n121,
         n122, n123, n124, n125, n126, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n678, n679, n680, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703,
         n704, n705, n706, n707, n708, n709, n710, n711, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n740, n741, n742, n743, n744, n745, n746, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n803,
         n804, n805, n806, n807, n815, n816, n817, n818, n819, n836, n837,
         n838, n839, n840, n841, n890, n891, n892, n893, n894, n895, n896,
         n897, n898, n899, n900, n901, n902, n903, n904, n905, n906;

  XOR2X1 U53 ( .A(n54), .B(n53), .Y(product[46]) );
  XOR2X1 U54 ( .A(n86), .B(n901), .Y(n53) );
  FAX1 U55 ( .A(n87), .B(n88), .C(n55), .YC(n54), .YS(product[45]) );
  FAX1 U56 ( .A(n89), .B(n91), .C(n56), .YC(n55), .YS(product[44]) );
  FAX1 U57 ( .A(n94), .B(n92), .C(n57), .YC(n56), .YS(product[43]) );
  FAX1 U58 ( .A(n95), .B(n98), .C(n58), .YC(n57), .YS(product[42]) );
  FAX1 U59 ( .A(n99), .B(n103), .C(n59), .YC(n58), .YS(product[41]) );
  FAX1 U60 ( .A(n108), .B(n104), .C(n60), .YC(n59), .YS(product[40]) );
  FAX1 U61 ( .A(n109), .B(n114), .C(n61), .YC(n60), .YS(product[39]) );
  FAX1 U62 ( .A(n115), .B(n121), .C(n62), .YC(n61), .YS(product[38]) );
  FAX1 U63 ( .A(n128), .B(n122), .C(n63), .YC(n62), .YS(product[37]) );
  FAX1 U64 ( .A(n129), .B(n136), .C(n64), .YC(n63), .YS(product[36]) );
  FAX1 U65 ( .A(n137), .B(n144), .C(n65), .YC(n64), .YS(product[35]) );
  FAX1 U66 ( .A(n152), .B(n145), .C(n66), .YC(n65), .YS(product[34]) );
  FAX1 U67 ( .A(n160), .B(n153), .C(n67), .YC(n66), .YS(product[33]) );
  FAX1 U68 ( .A(n555), .B(n161), .C(n68), .YC(n67), .YS(product[32]) );
  FAX1 U69 ( .A(n169), .B(n556), .C(n69), .YC(n68), .YS(product[31]) );
  FAX1 U70 ( .A(n177), .B(n557), .C(n70), .YC(n69), .YS(product[30]) );
  FAX1 U71 ( .A(n185), .B(n558), .C(n71), .YC(n70) );
  FAX1 U72 ( .A(n193), .B(n559), .C(n72), .YC(n71) );
  FAX1 U73 ( .A(n201), .B(n560), .C(n73), .YC(n72) );
  FAX1 U74 ( .A(n209), .B(n561), .C(n74), .YC(n73) );
  FAX1 U75 ( .A(n215), .B(n562), .C(n75), .YC(n74) );
  FAX1 U76 ( .A(n221), .B(n563), .C(n76), .YC(n75) );
  FAX1 U77 ( .A(n227), .B(n564), .C(n77), .YC(n76) );
  FAX1 U78 ( .A(n231), .B(n565), .C(n78), .YC(n77) );
  FAX1 U79 ( .A(n235), .B(n566), .C(n79), .YC(n78) );
  FAX1 U80 ( .A(n239), .B(n567), .C(n80), .YC(n79) );
  FAX1 U81 ( .A(n241), .B(n568), .C(n81), .YC(n80) );
  FAX1 U82 ( .A(n243), .B(n569), .C(n82), .YC(n81) );
  HAX1 U83 ( .A(n570), .B(n83), .YC(n82) );
  HAX1 U84 ( .A(n571), .B(n84), .YC(n83) );
  HAX1 U85 ( .A(n1), .B(n572), .YC(n84) );
  FAX1 U87 ( .A(n478), .B(n246), .C(n250), .YC(n86), .YS(n87) );
  FAX1 U88 ( .A(n248), .B(n249), .C(n479), .YC(n88), .YS(n89) );
  FAX1 U90 ( .A(n249), .B(n96), .C(n480), .YC(n91), .YS(n92) );
  FAX1 U92 ( .A(n97), .B(n481), .C(n100), .YC(n94), .YS(n95) );
  FAX1 U93 ( .A(n497), .B(n254), .C(n252), .YC(n96), .YS(n97) );
  FAX1 U94 ( .A(n482), .B(n101), .C(n498), .YC(n98), .YS(n99) );
  FAX1 U95 ( .A(n256), .B(n253), .C(n105), .YC(n100), .YS(n101) );
  FAX1 U97 ( .A(n110), .B(n106), .C(n499), .YC(n103), .YS(n104) );
  FAX1 U98 ( .A(n255), .B(n112), .C(n483), .YC(n105), .YS(n106) );
  FAX1 U100 ( .A(n111), .B(n500), .C(n116), .YC(n108), .YS(n109) );
  FAX1 U101 ( .A(n113), .B(n118), .C(n484), .YC(n110), .YS(n111) );
  FAX1 U102 ( .A(n516), .B(n258), .C(n262), .YC(n112), .YS(n113) );
  FAX1 U103 ( .A(n501), .B(n117), .C(n517), .YC(n114), .YS(n115) );
  FAX1 U104 ( .A(n125), .B(n119), .C(n123), .YC(n116), .YS(n117) );
  FAX1 U105 ( .A(n260), .B(n261), .C(n485), .YC(n118), .YS(n119) );
  FAX1 U107 ( .A(n130), .B(n124), .C(n518), .YC(n121), .YS(n122) );
  FAX1 U108 ( .A(n132), .B(n126), .C(n502), .YC(n123), .YS(n124) );
  FAX1 U109 ( .A(n261), .B(n134), .C(n486), .YC(n125), .YS(n126) );
  FAX1 U111 ( .A(n131), .B(n519), .C(n138), .YC(n128), .YS(n129) );
  FAX1 U112 ( .A(n133), .B(n140), .C(n503), .YC(n130), .YS(n131) );
  FAX1 U113 ( .A(n135), .B(n142), .C(n487), .YC(n132), .YS(n133) );
  FAX1 U114 ( .A(n535), .B(n554), .C(n264), .YC(n134), .YS(n135) );
  FAX1 U115 ( .A(n520), .B(n139), .C(n536), .YC(n136), .YS(n137) );
  FAX1 U116 ( .A(n148), .B(n141), .C(n146), .YC(n138), .YS(n139) );
  FAX1 U117 ( .A(n488), .B(n143), .C(n504), .YC(n140), .YS(n141) );
  FAX1 U118 ( .A(n1), .B(n266), .C(n150), .YC(n142), .YS(n143) );
  FAX1 U119 ( .A(n521), .B(n147), .C(n537), .YC(n144), .YS(n145) );
  FAX1 U120 ( .A(n156), .B(n149), .C(n154), .YC(n146), .YS(n147) );
  FAX1 U121 ( .A(n489), .B(n151), .C(n505), .YC(n148), .YS(n149) );
  FAX1 U122 ( .A(n1), .B(n268), .C(n158), .YC(n150), .YS(n151) );
  FAX1 U123 ( .A(n162), .B(n155), .C(n538), .YC(n152), .YS(n153) );
  FAX1 U124 ( .A(n164), .B(n157), .C(n522), .YC(n154), .YS(n155) );
  FAX1 U125 ( .A(n166), .B(n159), .C(n506), .YC(n156), .YS(n157) );
  FAX1 U126 ( .A(n1), .B(n270), .C(n490), .YC(n158), .YS(n159) );
  FAX1 U127 ( .A(n163), .B(n539), .C(n168), .YC(n160), .YS(n161) );
  FAX1 U128 ( .A(n165), .B(n523), .C(n170), .YC(n162), .YS(n163) );
  FAX1 U129 ( .A(n167), .B(n507), .C(n172), .YC(n164), .YS(n165) );
  FAX1 U130 ( .A(n272), .B(n491), .C(n174), .YC(n166), .YS(n167) );
  FAX1 U131 ( .A(n171), .B(n540), .C(n176), .YC(n168), .YS(n169) );
  FAX1 U132 ( .A(n173), .B(n524), .C(n178), .YC(n170), .YS(n171) );
  FAX1 U133 ( .A(n175), .B(n508), .C(n180), .YC(n172), .YS(n173) );
  FAX1 U134 ( .A(n274), .B(n492), .C(n182), .YC(n174), .YS(n175) );
  FAX1 U135 ( .A(n179), .B(n541), .C(n184), .YC(n176), .YS(n177) );
  FAX1 U136 ( .A(n181), .B(n525), .C(n186), .YC(n178), .YS(n179) );
  FAX1 U137 ( .A(n183), .B(n509), .C(n188), .YC(n180), .YS(n181) );
  FAX1 U138 ( .A(n275), .B(n493), .C(n190), .YC(n182), .YS(n183) );
  FAX1 U139 ( .A(n187), .B(n542), .C(n192), .YC(n184), .YS(n185) );
  FAX1 U140 ( .A(n189), .B(n526), .C(n194), .YC(n186), .YS(n187) );
  FAX1 U141 ( .A(n191), .B(n510), .C(n196), .YC(n188), .YS(n189) );
  HAX1 U142 ( .A(n494), .B(n198), .YC(n190), .YS(n191) );
  FAX1 U143 ( .A(n195), .B(n543), .C(n200), .YC(n192), .YS(n193) );
  FAX1 U144 ( .A(n197), .B(n527), .C(n202), .YC(n194), .YS(n195) );
  FAX1 U145 ( .A(n199), .B(n511), .C(n204), .YC(n196), .YS(n197) );
  HAX1 U146 ( .A(n495), .B(n206), .YC(n198), .YS(n199) );
  FAX1 U147 ( .A(n203), .B(n544), .C(n208), .YC(n200), .YS(n201) );
  FAX1 U148 ( .A(n205), .B(n528), .C(n210), .YC(n202), .YS(n203) );
  FAX1 U149 ( .A(n207), .B(n512), .C(n212), .YC(n204), .YS(n205) );
  HAX1 U150 ( .A(n17), .B(n496), .YC(n206), .YS(n207) );
  FAX1 U151 ( .A(n211), .B(n545), .C(n214), .YC(n208), .YS(n209) );
  FAX1 U152 ( .A(n213), .B(n529), .C(n216), .YC(n210), .YS(n211) );
  HAX1 U153 ( .A(n513), .B(n218), .YC(n212), .YS(n213) );
  FAX1 U154 ( .A(n217), .B(n546), .C(n220), .YC(n214), .YS(n215) );
  FAX1 U155 ( .A(n219), .B(n530), .C(n222), .YC(n216), .YS(n217) );
  HAX1 U156 ( .A(n514), .B(n224), .YC(n218), .YS(n219) );
  FAX1 U157 ( .A(n223), .B(n547), .C(n226), .YC(n220), .YS(n221) );
  FAX1 U158 ( .A(n225), .B(n531), .C(n228), .YC(n222), .YS(n223) );
  HAX1 U159 ( .A(n13), .B(n515), .YC(n224), .YS(n225) );
  FAX1 U160 ( .A(n229), .B(n548), .C(n230), .YC(n226), .YS(n227) );
  HAX1 U161 ( .A(n532), .B(n232), .YC(n228), .YS(n229) );
  FAX1 U162 ( .A(n233), .B(n549), .C(n234), .YC(n230), .YS(n231) );
  HAX1 U163 ( .A(n533), .B(n236), .YC(n232), .YS(n233) );
  FAX1 U164 ( .A(n237), .B(n550), .C(n238), .YC(n234), .YS(n235) );
  HAX1 U165 ( .A(n9), .B(n534), .YC(n236), .YS(n237) );
  HAX1 U166 ( .A(n551), .B(n240), .YC(n238), .YS(n239) );
  HAX1 U167 ( .A(n552), .B(n242), .YC(n240), .YS(n241) );
  HAX1 U168 ( .A(n5), .B(n553), .YC(n242), .YS(n243) );
  INVX2 U170 ( .A(n245), .Y(n246) );
  AOI22X1 U171 ( .A(n836), .B(n51), .C(n49), .D(n890), .Y(n245) );
  INVX2 U172 ( .A(n247), .Y(n248) );
  AOI22X1 U173 ( .A(n836), .B(n49), .C(n47), .D(n890), .Y(n247) );
  INVX2 U174 ( .A(n249), .Y(n250) );
  AOI22X1 U175 ( .A(n836), .B(n47), .C(n45), .D(n890), .Y(n249) );
  INVX2 U176 ( .A(n251), .Y(n252) );
  AOI22X1 U177 ( .A(n836), .B(n45), .C(n43), .D(n890), .Y(n251) );
  INVX2 U178 ( .A(n253), .Y(n254) );
  AOI22X1 U179 ( .A(n836), .B(n43), .C(n41), .D(n890), .Y(n253) );
  INVX2 U180 ( .A(n255), .Y(n256) );
  AOI22X1 U181 ( .A(n836), .B(n41), .C(n39), .D(n890), .Y(n255) );
  INVX2 U182 ( .A(n257), .Y(n258) );
  AOI22X1 U183 ( .A(n836), .B(n39), .C(n37), .D(n890), .Y(n257) );
  INVX2 U184 ( .A(n259), .Y(n260) );
  AOI22X1 U185 ( .A(n836), .B(n37), .C(n35), .D(n890), .Y(n259) );
  INVX2 U186 ( .A(n261), .Y(n262) );
  AOI22X1 U187 ( .A(n836), .B(n35), .C(n33), .D(n890), .Y(n261) );
  INVX2 U188 ( .A(n263), .Y(n264) );
  AOI22X1 U189 ( .A(n836), .B(n33), .C(n31), .D(n890), .Y(n263) );
  INVX2 U190 ( .A(n265), .Y(n266) );
  AOI22X1 U191 ( .A(n836), .B(n31), .C(n29), .D(n890), .Y(n265) );
  INVX2 U192 ( .A(n267), .Y(n268) );
  AOI22X1 U193 ( .A(n836), .B(n29), .C(n27), .D(n890), .Y(n267) );
  INVX2 U194 ( .A(n269), .Y(n270) );
  AOI22X1 U195 ( .A(n836), .B(n27), .C(n25), .D(n890), .Y(n269) );
  INVX2 U196 ( .A(n271), .Y(n272) );
  AOI22X1 U197 ( .A(n836), .B(n25), .C(n23), .D(n890), .Y(n271) );
  INVX2 U198 ( .A(n273), .Y(n274) );
  AOI22X1 U199 ( .A(n836), .B(n23), .C(n21), .D(n890), .Y(n273) );
  AND2X2 U200 ( .A(n836), .B(n21), .Y(n275) );
  INVX2 U201 ( .A(n17), .Y(n478) );
  XOR2X1 U202 ( .A(n573), .B(n17), .Y(n479) );
  OAI21X1 U203 ( .A(n20), .B(n748), .C(n591), .Y(n573) );
  NAND2X1 U204 ( .A(n51), .B(n900), .Y(n591) );
  XOR2X1 U205 ( .A(n574), .B(n17), .Y(n480) );
  OAI21X1 U206 ( .A(n20), .B(n749), .C(n592), .Y(n574) );
  AOI21X1 U207 ( .A(n49), .B(n900), .C(n276), .Y(n592) );
  AND2X2 U208 ( .A(n894), .B(n51), .Y(n276) );
  XOR2X1 U209 ( .A(n575), .B(n17), .Y(n481) );
  OAI21X1 U210 ( .A(n20), .B(n750), .C(n593), .Y(n575) );
  AOI21X1 U211 ( .A(n47), .B(n900), .C(n278), .Y(n593) );
  INVX2 U212 ( .A(n277), .Y(n278) );
  AOI22X1 U213 ( .A(n815), .B(n51), .C(n49), .D(n894), .Y(n277) );
  XOR2X1 U214 ( .A(n576), .B(n17), .Y(n482) );
  OAI21X1 U215 ( .A(n20), .B(n751), .C(n594), .Y(n576) );
  AOI21X1 U216 ( .A(n45), .B(n900), .C(n280), .Y(n594) );
  INVX2 U217 ( .A(n279), .Y(n280) );
  AOI22X1 U218 ( .A(n815), .B(n49), .C(n47), .D(n894), .Y(n279) );
  XOR2X1 U219 ( .A(n577), .B(n17), .Y(n483) );
  OAI21X1 U220 ( .A(n20), .B(n752), .C(n595), .Y(n577) );
  AOI21X1 U221 ( .A(n43), .B(n900), .C(n282), .Y(n595) );
  INVX2 U222 ( .A(n281), .Y(n282) );
  AOI22X1 U223 ( .A(n815), .B(n47), .C(n45), .D(n894), .Y(n281) );
  XOR2X1 U224 ( .A(n578), .B(n17), .Y(n484) );
  OAI21X1 U225 ( .A(n20), .B(n753), .C(n596), .Y(n578) );
  AOI21X1 U226 ( .A(n41), .B(n900), .C(n284), .Y(n596) );
  INVX2 U227 ( .A(n283), .Y(n284) );
  AOI22X1 U228 ( .A(n815), .B(n45), .C(n43), .D(n894), .Y(n283) );
  XOR2X1 U229 ( .A(n579), .B(n17), .Y(n485) );
  OAI21X1 U230 ( .A(n20), .B(n754), .C(n597), .Y(n579) );
  AOI21X1 U231 ( .A(n39), .B(n900), .C(n286), .Y(n597) );
  INVX2 U232 ( .A(n285), .Y(n286) );
  AOI22X1 U233 ( .A(n815), .B(n43), .C(n41), .D(n894), .Y(n285) );
  XOR2X1 U234 ( .A(n580), .B(n17), .Y(n486) );
  OAI21X1 U235 ( .A(n20), .B(n755), .C(n598), .Y(n580) );
  AOI21X1 U236 ( .A(n37), .B(n900), .C(n288), .Y(n598) );
  INVX2 U237 ( .A(n287), .Y(n288) );
  AOI22X1 U238 ( .A(n815), .B(n41), .C(n39), .D(n894), .Y(n287) );
  XOR2X1 U239 ( .A(n581), .B(n17), .Y(n487) );
  OAI21X1 U240 ( .A(n20), .B(n756), .C(n599), .Y(n581) );
  AOI21X1 U241 ( .A(n35), .B(n900), .C(n290), .Y(n599) );
  INVX2 U242 ( .A(n289), .Y(n290) );
  AOI22X1 U243 ( .A(n815), .B(n39), .C(n37), .D(n894), .Y(n289) );
  XOR2X1 U244 ( .A(n582), .B(n17), .Y(n488) );
  OAI21X1 U245 ( .A(n19), .B(n757), .C(n600), .Y(n582) );
  AOI21X1 U246 ( .A(n33), .B(n900), .C(n292), .Y(n600) );
  INVX2 U247 ( .A(n291), .Y(n292) );
  AOI22X1 U248 ( .A(n815), .B(n37), .C(n35), .D(n894), .Y(n291) );
  XOR2X1 U249 ( .A(n583), .B(n17), .Y(n489) );
  OAI21X1 U250 ( .A(n19), .B(n758), .C(n601), .Y(n583) );
  AOI21X1 U251 ( .A(n31), .B(n900), .C(n294), .Y(n601) );
  INVX2 U252 ( .A(n293), .Y(n294) );
  AOI22X1 U253 ( .A(n815), .B(n35), .C(n33), .D(n894), .Y(n293) );
  XOR2X1 U254 ( .A(n584), .B(n17), .Y(n490) );
  OAI21X1 U255 ( .A(n19), .B(n759), .C(n602), .Y(n584) );
  AOI21X1 U256 ( .A(n29), .B(n900), .C(n296), .Y(n602) );
  INVX2 U257 ( .A(n295), .Y(n296) );
  AOI22X1 U258 ( .A(n815), .B(n33), .C(n31), .D(n894), .Y(n295) );
  XOR2X1 U259 ( .A(n585), .B(n17), .Y(n491) );
  OAI21X1 U260 ( .A(n19), .B(n760), .C(n603), .Y(n585) );
  AOI21X1 U261 ( .A(n27), .B(n900), .C(n298), .Y(n603) );
  INVX2 U262 ( .A(n297), .Y(n298) );
  AOI22X1 U263 ( .A(n815), .B(n31), .C(n29), .D(n894), .Y(n297) );
  XOR2X1 U264 ( .A(n586), .B(n17), .Y(n492) );
  OAI21X1 U265 ( .A(n19), .B(n761), .C(n604), .Y(n586) );
  AOI21X1 U266 ( .A(n25), .B(n900), .C(n300), .Y(n604) );
  INVX2 U267 ( .A(n299), .Y(n300) );
  AOI22X1 U268 ( .A(n815), .B(n29), .C(n27), .D(n894), .Y(n299) );
  XOR2X1 U269 ( .A(n587), .B(n17), .Y(n493) );
  OAI21X1 U270 ( .A(n19), .B(n762), .C(n605), .Y(n587) );
  AOI21X1 U271 ( .A(n23), .B(n900), .C(n302), .Y(n605) );
  INVX2 U272 ( .A(n301), .Y(n302) );
  AOI22X1 U273 ( .A(n815), .B(n27), .C(n25), .D(n894), .Y(n301) );
  XOR2X1 U274 ( .A(n588), .B(n17), .Y(n494) );
  OAI21X1 U275 ( .A(n19), .B(n763), .C(n606), .Y(n588) );
  AOI21X1 U276 ( .A(n21), .B(n900), .C(n304), .Y(n606) );
  INVX2 U277 ( .A(n303), .Y(n304) );
  AOI22X1 U278 ( .A(n815), .B(n25), .C(n23), .D(n894), .Y(n303) );
  XOR2X1 U279 ( .A(n589), .B(n17), .Y(n495) );
  OAI21X1 U280 ( .A(n764), .B(n19), .C(n305), .Y(n589) );
  AOI22X1 U281 ( .A(n815), .B(n23), .C(n21), .D(n894), .Y(n305) );
  XOR2X1 U282 ( .A(n590), .B(n17), .Y(n496) );
  OAI21X1 U283 ( .A(n765), .B(n19), .C(n906), .Y(n590) );
  INVX2 U286 ( .A(n13), .Y(n497) );
  XOR2X1 U287 ( .A(n608), .B(n13), .Y(n498) );
  OAI21X1 U288 ( .A(n16), .B(n748), .C(n626), .Y(n608) );
  NAND2X1 U289 ( .A(n51), .B(n899), .Y(n626) );
  XOR2X1 U290 ( .A(n609), .B(n13), .Y(n499) );
  OAI21X1 U291 ( .A(n16), .B(n749), .C(n627), .Y(n609) );
  AOI21X1 U292 ( .A(n49), .B(n899), .C(n307), .Y(n627) );
  AND2X2 U293 ( .A(n893), .B(n51), .Y(n307) );
  XOR2X1 U294 ( .A(n610), .B(n13), .Y(n500) );
  OAI21X1 U295 ( .A(n16), .B(n750), .C(n628), .Y(n610) );
  AOI21X1 U296 ( .A(n47), .B(n899), .C(n309), .Y(n628) );
  INVX2 U297 ( .A(n308), .Y(n309) );
  AOI22X1 U298 ( .A(n816), .B(n51), .C(n49), .D(n893), .Y(n308) );
  XOR2X1 U299 ( .A(n611), .B(n13), .Y(n501) );
  OAI21X1 U300 ( .A(n16), .B(n751), .C(n629), .Y(n611) );
  AOI21X1 U301 ( .A(n45), .B(n899), .C(n311), .Y(n629) );
  INVX2 U302 ( .A(n310), .Y(n311) );
  AOI22X1 U303 ( .A(n816), .B(n49), .C(n47), .D(n893), .Y(n310) );
  XOR2X1 U304 ( .A(n612), .B(n13), .Y(n502) );
  OAI21X1 U305 ( .A(n16), .B(n752), .C(n630), .Y(n612) );
  AOI21X1 U306 ( .A(n43), .B(n899), .C(n313), .Y(n630) );
  INVX2 U307 ( .A(n312), .Y(n313) );
  AOI22X1 U308 ( .A(n816), .B(n47), .C(n45), .D(n893), .Y(n312) );
  XOR2X1 U309 ( .A(n613), .B(n13), .Y(n503) );
  OAI21X1 U310 ( .A(n16), .B(n753), .C(n631), .Y(n613) );
  AOI21X1 U311 ( .A(n41), .B(n899), .C(n315), .Y(n631) );
  INVX2 U312 ( .A(n314), .Y(n315) );
  AOI22X1 U313 ( .A(n816), .B(n45), .C(n43), .D(n893), .Y(n314) );
  XOR2X1 U314 ( .A(n614), .B(n13), .Y(n504) );
  OAI21X1 U315 ( .A(n16), .B(n754), .C(n632), .Y(n614) );
  AOI21X1 U316 ( .A(n39), .B(n899), .C(n317), .Y(n632) );
  INVX2 U317 ( .A(n316), .Y(n317) );
  AOI22X1 U318 ( .A(n816), .B(n43), .C(n41), .D(n893), .Y(n316) );
  XOR2X1 U319 ( .A(n615), .B(n13), .Y(n505) );
  OAI21X1 U320 ( .A(n16), .B(n755), .C(n633), .Y(n615) );
  AOI21X1 U321 ( .A(n37), .B(n899), .C(n319), .Y(n633) );
  INVX2 U322 ( .A(n318), .Y(n319) );
  AOI22X1 U323 ( .A(n816), .B(n41), .C(n39), .D(n893), .Y(n318) );
  XOR2X1 U324 ( .A(n616), .B(n13), .Y(n506) );
  OAI21X1 U325 ( .A(n16), .B(n756), .C(n634), .Y(n616) );
  AOI21X1 U326 ( .A(n35), .B(n899), .C(n321), .Y(n634) );
  INVX2 U327 ( .A(n320), .Y(n321) );
  AOI22X1 U328 ( .A(n816), .B(n39), .C(n37), .D(n893), .Y(n320) );
  XOR2X1 U329 ( .A(n617), .B(n13), .Y(n507) );
  OAI21X1 U330 ( .A(n15), .B(n757), .C(n635), .Y(n617) );
  AOI21X1 U331 ( .A(n33), .B(n899), .C(n323), .Y(n635) );
  INVX2 U332 ( .A(n322), .Y(n323) );
  AOI22X1 U333 ( .A(n816), .B(n37), .C(n35), .D(n893), .Y(n322) );
  XOR2X1 U334 ( .A(n618), .B(n13), .Y(n508) );
  OAI21X1 U335 ( .A(n15), .B(n758), .C(n636), .Y(n618) );
  AOI21X1 U336 ( .A(n31), .B(n899), .C(n325), .Y(n636) );
  INVX2 U337 ( .A(n324), .Y(n325) );
  AOI22X1 U338 ( .A(n816), .B(n35), .C(n33), .D(n893), .Y(n324) );
  XOR2X1 U339 ( .A(n619), .B(n13), .Y(n509) );
  OAI21X1 U340 ( .A(n15), .B(n759), .C(n637), .Y(n619) );
  AOI21X1 U341 ( .A(n29), .B(n899), .C(n327), .Y(n637) );
  INVX2 U342 ( .A(n326), .Y(n327) );
  AOI22X1 U343 ( .A(n816), .B(n33), .C(n31), .D(n893), .Y(n326) );
  XOR2X1 U344 ( .A(n620), .B(n13), .Y(n510) );
  OAI21X1 U345 ( .A(n15), .B(n760), .C(n638), .Y(n620) );
  AOI21X1 U346 ( .A(n27), .B(n899), .C(n329), .Y(n638) );
  INVX2 U347 ( .A(n328), .Y(n329) );
  AOI22X1 U348 ( .A(n816), .B(n31), .C(n29), .D(n893), .Y(n328) );
  XOR2X1 U349 ( .A(n621), .B(n13), .Y(n511) );
  OAI21X1 U350 ( .A(n15), .B(n761), .C(n639), .Y(n621) );
  AOI21X1 U351 ( .A(n25), .B(n899), .C(n331), .Y(n639) );
  INVX2 U352 ( .A(n330), .Y(n331) );
  AOI22X1 U353 ( .A(n816), .B(n29), .C(n27), .D(n893), .Y(n330) );
  XOR2X1 U354 ( .A(n622), .B(n13), .Y(n512) );
  OAI21X1 U355 ( .A(n15), .B(n762), .C(n640), .Y(n622) );
  AOI21X1 U356 ( .A(n23), .B(n899), .C(n333), .Y(n640) );
  INVX2 U357 ( .A(n332), .Y(n333) );
  AOI22X1 U358 ( .A(n816), .B(n27), .C(n25), .D(n893), .Y(n332) );
  XOR2X1 U359 ( .A(n623), .B(n13), .Y(n513) );
  OAI21X1 U360 ( .A(n15), .B(n763), .C(n641), .Y(n623) );
  AOI21X1 U361 ( .A(n21), .B(n899), .C(n335), .Y(n641) );
  INVX2 U362 ( .A(n334), .Y(n335) );
  AOI22X1 U363 ( .A(n816), .B(n25), .C(n23), .D(n893), .Y(n334) );
  XOR2X1 U364 ( .A(n624), .B(n13), .Y(n514) );
  OAI21X1 U365 ( .A(n764), .B(n15), .C(n336), .Y(n624) );
  AOI22X1 U366 ( .A(n816), .B(n23), .C(n21), .D(n893), .Y(n336) );
  XOR2X1 U367 ( .A(n625), .B(n13), .Y(n515) );
  OAI21X1 U368 ( .A(n765), .B(n15), .C(n905), .Y(n625) );
  INVX2 U371 ( .A(n9), .Y(n516) );
  XOR2X1 U372 ( .A(n643), .B(n9), .Y(n517) );
  OAI21X1 U373 ( .A(n12), .B(n748), .C(n661), .Y(n643) );
  NAND2X1 U374 ( .A(n51), .B(n898), .Y(n661) );
  XOR2X1 U375 ( .A(n644), .B(n9), .Y(n518) );
  OAI21X1 U376 ( .A(n12), .B(n749), .C(n662), .Y(n644) );
  AOI21X1 U377 ( .A(n49), .B(n898), .C(n338), .Y(n662) );
  AND2X2 U378 ( .A(n892), .B(n51), .Y(n338) );
  XOR2X1 U379 ( .A(n645), .B(n9), .Y(n519) );
  OAI21X1 U380 ( .A(n12), .B(n750), .C(n663), .Y(n645) );
  AOI21X1 U381 ( .A(n47), .B(n898), .C(n340), .Y(n663) );
  INVX2 U382 ( .A(n339), .Y(n340) );
  AOI22X1 U383 ( .A(n817), .B(n51), .C(n49), .D(n892), .Y(n339) );
  XOR2X1 U384 ( .A(n646), .B(n9), .Y(n520) );
  OAI21X1 U385 ( .A(n12), .B(n751), .C(n664), .Y(n646) );
  AOI21X1 U386 ( .A(n45), .B(n898), .C(n342), .Y(n664) );
  INVX2 U387 ( .A(n341), .Y(n342) );
  AOI22X1 U388 ( .A(n817), .B(n49), .C(n47), .D(n892), .Y(n341) );
  XOR2X1 U389 ( .A(n647), .B(n9), .Y(n521) );
  OAI21X1 U390 ( .A(n12), .B(n752), .C(n665), .Y(n647) );
  AOI21X1 U391 ( .A(n43), .B(n898), .C(n344), .Y(n665) );
  INVX2 U392 ( .A(n343), .Y(n344) );
  AOI22X1 U393 ( .A(n817), .B(n47), .C(n45), .D(n892), .Y(n343) );
  XOR2X1 U394 ( .A(n648), .B(n9), .Y(n522) );
  OAI21X1 U395 ( .A(n12), .B(n753), .C(n666), .Y(n648) );
  AOI21X1 U396 ( .A(n41), .B(n898), .C(n346), .Y(n666) );
  INVX2 U397 ( .A(n345), .Y(n346) );
  AOI22X1 U398 ( .A(n817), .B(n45), .C(n43), .D(n892), .Y(n345) );
  XOR2X1 U399 ( .A(n649), .B(n9), .Y(n523) );
  OAI21X1 U400 ( .A(n12), .B(n754), .C(n667), .Y(n649) );
  AOI21X1 U401 ( .A(n39), .B(n898), .C(n348), .Y(n667) );
  INVX2 U402 ( .A(n347), .Y(n348) );
  AOI22X1 U403 ( .A(n817), .B(n43), .C(n41), .D(n892), .Y(n347) );
  XOR2X1 U404 ( .A(n650), .B(n9), .Y(n524) );
  OAI21X1 U405 ( .A(n12), .B(n755), .C(n668), .Y(n650) );
  AOI21X1 U406 ( .A(n37), .B(n898), .C(n350), .Y(n668) );
  INVX2 U407 ( .A(n349), .Y(n350) );
  AOI22X1 U408 ( .A(n817), .B(n41), .C(n39), .D(n892), .Y(n349) );
  XOR2X1 U409 ( .A(n651), .B(n9), .Y(n525) );
  OAI21X1 U410 ( .A(n12), .B(n756), .C(n669), .Y(n651) );
  AOI21X1 U411 ( .A(n35), .B(n898), .C(n352), .Y(n669) );
  INVX2 U412 ( .A(n351), .Y(n352) );
  AOI22X1 U413 ( .A(n817), .B(n39), .C(n37), .D(n892), .Y(n351) );
  XOR2X1 U414 ( .A(n652), .B(n9), .Y(n526) );
  OAI21X1 U415 ( .A(n11), .B(n757), .C(n670), .Y(n652) );
  AOI21X1 U416 ( .A(n33), .B(n898), .C(n354), .Y(n670) );
  INVX2 U417 ( .A(n353), .Y(n354) );
  AOI22X1 U418 ( .A(n817), .B(n37), .C(n35), .D(n892), .Y(n353) );
  XOR2X1 U419 ( .A(n653), .B(n9), .Y(n527) );
  OAI21X1 U420 ( .A(n11), .B(n758), .C(n671), .Y(n653) );
  AOI21X1 U421 ( .A(n31), .B(n898), .C(n356), .Y(n671) );
  INVX2 U422 ( .A(n355), .Y(n356) );
  AOI22X1 U423 ( .A(n817), .B(n35), .C(n33), .D(n892), .Y(n355) );
  XOR2X1 U424 ( .A(n654), .B(n9), .Y(n528) );
  OAI21X1 U425 ( .A(n11), .B(n759), .C(n672), .Y(n654) );
  AOI21X1 U426 ( .A(n29), .B(n898), .C(n358), .Y(n672) );
  INVX2 U427 ( .A(n357), .Y(n358) );
  AOI22X1 U428 ( .A(n817), .B(n33), .C(n31), .D(n892), .Y(n357) );
  XOR2X1 U429 ( .A(n655), .B(n9), .Y(n529) );
  OAI21X1 U430 ( .A(n11), .B(n760), .C(n673), .Y(n655) );
  AOI21X1 U431 ( .A(n27), .B(n898), .C(n360), .Y(n673) );
  INVX2 U432 ( .A(n359), .Y(n360) );
  AOI22X1 U433 ( .A(n817), .B(n31), .C(n29), .D(n892), .Y(n359) );
  XOR2X1 U434 ( .A(n656), .B(n9), .Y(n530) );
  OAI21X1 U435 ( .A(n11), .B(n761), .C(n674), .Y(n656) );
  AOI21X1 U436 ( .A(n25), .B(n898), .C(n362), .Y(n674) );
  INVX2 U437 ( .A(n361), .Y(n362) );
  AOI22X1 U438 ( .A(n817), .B(n29), .C(n27), .D(n892), .Y(n361) );
  XOR2X1 U439 ( .A(n657), .B(n9), .Y(n531) );
  OAI21X1 U440 ( .A(n11), .B(n762), .C(n675), .Y(n657) );
  AOI21X1 U441 ( .A(n23), .B(n898), .C(n364), .Y(n675) );
  INVX2 U442 ( .A(n363), .Y(n364) );
  AOI22X1 U443 ( .A(n817), .B(n27), .C(n25), .D(n892), .Y(n363) );
  XOR2X1 U444 ( .A(n658), .B(n9), .Y(n532) );
  OAI21X1 U445 ( .A(n11), .B(n763), .C(n676), .Y(n658) );
  AOI21X1 U446 ( .A(n21), .B(n898), .C(n366), .Y(n676) );
  INVX2 U447 ( .A(n365), .Y(n366) );
  AOI22X1 U448 ( .A(n817), .B(n25), .C(n23), .D(n892), .Y(n365) );
  XOR2X1 U449 ( .A(n659), .B(n9), .Y(n533) );
  OAI21X1 U450 ( .A(n764), .B(n11), .C(n367), .Y(n659) );
  AOI22X1 U451 ( .A(n817), .B(n23), .C(n21), .D(n892), .Y(n367) );
  XOR2X1 U452 ( .A(n660), .B(n9), .Y(n534) );
  OAI21X1 U453 ( .A(n765), .B(n11), .C(n904), .Y(n660) );
  INVX2 U456 ( .A(n5), .Y(n535) );
  XOR2X1 U457 ( .A(n678), .B(n5), .Y(n536) );
  OAI21X1 U458 ( .A(n8), .B(n748), .C(n696), .Y(n678) );
  NAND2X1 U459 ( .A(n51), .B(n897), .Y(n696) );
  XOR2X1 U460 ( .A(n679), .B(n5), .Y(n537) );
  OAI21X1 U461 ( .A(n8), .B(n749), .C(n697), .Y(n679) );
  AOI21X1 U462 ( .A(n49), .B(n897), .C(n369), .Y(n697) );
  AND2X2 U463 ( .A(n891), .B(n51), .Y(n369) );
  XOR2X1 U464 ( .A(n680), .B(n5), .Y(n538) );
  OAI21X1 U465 ( .A(n8), .B(n750), .C(n698), .Y(n680) );
  AOI21X1 U466 ( .A(n47), .B(n897), .C(n371), .Y(n698) );
  INVX2 U467 ( .A(n370), .Y(n371) );
  AOI22X1 U468 ( .A(n818), .B(n51), .C(n49), .D(n891), .Y(n370) );
  XOR2X1 U469 ( .A(n681), .B(n5), .Y(n539) );
  OAI21X1 U470 ( .A(n8), .B(n751), .C(n699), .Y(n681) );
  AOI21X1 U471 ( .A(n45), .B(n897), .C(n373), .Y(n699) );
  INVX2 U472 ( .A(n372), .Y(n373) );
  AOI22X1 U473 ( .A(n818), .B(n49), .C(n47), .D(n891), .Y(n372) );
  XOR2X1 U474 ( .A(n682), .B(n5), .Y(n540) );
  OAI21X1 U475 ( .A(n8), .B(n752), .C(n700), .Y(n682) );
  AOI21X1 U476 ( .A(n43), .B(n897), .C(n375), .Y(n700) );
  INVX2 U477 ( .A(n374), .Y(n375) );
  AOI22X1 U478 ( .A(n818), .B(n47), .C(n45), .D(n891), .Y(n374) );
  XOR2X1 U479 ( .A(n683), .B(n5), .Y(n541) );
  OAI21X1 U480 ( .A(n8), .B(n753), .C(n701), .Y(n683) );
  AOI21X1 U481 ( .A(n41), .B(n897), .C(n377), .Y(n701) );
  INVX2 U482 ( .A(n376), .Y(n377) );
  AOI22X1 U483 ( .A(n818), .B(n45), .C(n43), .D(n891), .Y(n376) );
  XOR2X1 U484 ( .A(n684), .B(n5), .Y(n542) );
  OAI21X1 U485 ( .A(n8), .B(n754), .C(n702), .Y(n684) );
  AOI21X1 U486 ( .A(n39), .B(n897), .C(n379), .Y(n702) );
  INVX2 U487 ( .A(n378), .Y(n379) );
  AOI22X1 U488 ( .A(n818), .B(n43), .C(n41), .D(n891), .Y(n378) );
  XOR2X1 U489 ( .A(n685), .B(n5), .Y(n543) );
  OAI21X1 U490 ( .A(n8), .B(n755), .C(n703), .Y(n685) );
  AOI21X1 U491 ( .A(n37), .B(n897), .C(n381), .Y(n703) );
  INVX2 U492 ( .A(n380), .Y(n381) );
  AOI22X1 U493 ( .A(n818), .B(n41), .C(n39), .D(n891), .Y(n380) );
  XOR2X1 U494 ( .A(n686), .B(n5), .Y(n544) );
  OAI21X1 U495 ( .A(n8), .B(n756), .C(n704), .Y(n686) );
  AOI21X1 U496 ( .A(n35), .B(n897), .C(n383), .Y(n704) );
  INVX2 U497 ( .A(n382), .Y(n383) );
  AOI22X1 U498 ( .A(n818), .B(n39), .C(n37), .D(n891), .Y(n382) );
  XOR2X1 U499 ( .A(n687), .B(n5), .Y(n545) );
  OAI21X1 U500 ( .A(n7), .B(n757), .C(n705), .Y(n687) );
  AOI21X1 U501 ( .A(n33), .B(n897), .C(n385), .Y(n705) );
  INVX2 U502 ( .A(n384), .Y(n385) );
  AOI22X1 U503 ( .A(n818), .B(n37), .C(n35), .D(n891), .Y(n384) );
  XOR2X1 U504 ( .A(n688), .B(n5), .Y(n546) );
  OAI21X1 U505 ( .A(n7), .B(n758), .C(n706), .Y(n688) );
  AOI21X1 U506 ( .A(n31), .B(n897), .C(n387), .Y(n706) );
  INVX2 U507 ( .A(n386), .Y(n387) );
  AOI22X1 U508 ( .A(n818), .B(n35), .C(n33), .D(n891), .Y(n386) );
  XOR2X1 U509 ( .A(n689), .B(n5), .Y(n547) );
  OAI21X1 U510 ( .A(n7), .B(n759), .C(n707), .Y(n689) );
  AOI21X1 U511 ( .A(n29), .B(n897), .C(n389), .Y(n707) );
  INVX2 U512 ( .A(n388), .Y(n389) );
  AOI22X1 U513 ( .A(n818), .B(n33), .C(n31), .D(n891), .Y(n388) );
  XOR2X1 U514 ( .A(n690), .B(n5), .Y(n548) );
  OAI21X1 U515 ( .A(n7), .B(n760), .C(n708), .Y(n690) );
  AOI21X1 U516 ( .A(n27), .B(n897), .C(n391), .Y(n708) );
  INVX2 U517 ( .A(n390), .Y(n391) );
  AOI22X1 U518 ( .A(n818), .B(n31), .C(n29), .D(n891), .Y(n390) );
  XOR2X1 U519 ( .A(n691), .B(n5), .Y(n549) );
  OAI21X1 U520 ( .A(n7), .B(n761), .C(n709), .Y(n691) );
  AOI21X1 U521 ( .A(n25), .B(n897), .C(n393), .Y(n709) );
  INVX2 U522 ( .A(n392), .Y(n393) );
  AOI22X1 U523 ( .A(n818), .B(n29), .C(n27), .D(n891), .Y(n392) );
  XOR2X1 U524 ( .A(n692), .B(n5), .Y(n550) );
  OAI21X1 U525 ( .A(n7), .B(n762), .C(n710), .Y(n692) );
  AOI21X1 U526 ( .A(n23), .B(n897), .C(n395), .Y(n710) );
  INVX2 U527 ( .A(n394), .Y(n395) );
  AOI22X1 U528 ( .A(n818), .B(n27), .C(n25), .D(n891), .Y(n394) );
  XOR2X1 U529 ( .A(n693), .B(n5), .Y(n551) );
  OAI21X1 U530 ( .A(n7), .B(n763), .C(n711), .Y(n693) );
  AOI21X1 U531 ( .A(n21), .B(n897), .C(n397), .Y(n711) );
  INVX2 U532 ( .A(n396), .Y(n397) );
  AOI22X1 U533 ( .A(n818), .B(n25), .C(n23), .D(n891), .Y(n396) );
  XOR2X1 U534 ( .A(n694), .B(n5), .Y(n552) );
  OAI21X1 U535 ( .A(n764), .B(n7), .C(n398), .Y(n694) );
  AOI22X1 U536 ( .A(n818), .B(n23), .C(n21), .D(n891), .Y(n398) );
  XOR2X1 U537 ( .A(n695), .B(n5), .Y(n553) );
  OAI21X1 U538 ( .A(n765), .B(n7), .C(n903), .Y(n695) );
  INVX2 U541 ( .A(n1), .Y(n554) );
  XOR2X1 U542 ( .A(n713), .B(n1), .Y(n555) );
  OAI21X1 U543 ( .A(n4), .B(n748), .C(n731), .Y(n713) );
  NAND2X1 U544 ( .A(n51), .B(n896), .Y(n731) );
  XOR2X1 U545 ( .A(n714), .B(n1), .Y(n556) );
  OAI21X1 U546 ( .A(n4), .B(n749), .C(n732), .Y(n714) );
  AOI21X1 U547 ( .A(n49), .B(n896), .C(n400), .Y(n732) );
  AND2X2 U548 ( .A(n895), .B(n51), .Y(n400) );
  XOR2X1 U549 ( .A(n715), .B(n1), .Y(n557) );
  OAI21X1 U550 ( .A(n4), .B(n750), .C(n733), .Y(n715) );
  AOI21X1 U551 ( .A(n47), .B(n896), .C(n402), .Y(n733) );
  INVX2 U552 ( .A(n401), .Y(n402) );
  AOI22X1 U553 ( .A(n819), .B(n51), .C(n49), .D(n895), .Y(n401) );
  XOR2X1 U554 ( .A(n716), .B(n1), .Y(n558) );
  OAI21X1 U555 ( .A(n4), .B(n751), .C(n734), .Y(n716) );
  AOI21X1 U556 ( .A(n45), .B(n896), .C(n404), .Y(n734) );
  INVX2 U557 ( .A(n403), .Y(n404) );
  AOI22X1 U558 ( .A(n819), .B(n49), .C(n47), .D(n895), .Y(n403) );
  XOR2X1 U559 ( .A(n717), .B(n1), .Y(n559) );
  OAI21X1 U560 ( .A(n4), .B(n752), .C(n735), .Y(n717) );
  AOI21X1 U561 ( .A(n43), .B(n896), .C(n406), .Y(n735) );
  INVX2 U562 ( .A(n405), .Y(n406) );
  AOI22X1 U563 ( .A(n819), .B(n47), .C(n45), .D(n895), .Y(n405) );
  XOR2X1 U564 ( .A(n718), .B(n1), .Y(n560) );
  OAI21X1 U565 ( .A(n4), .B(n753), .C(n736), .Y(n718) );
  AOI21X1 U566 ( .A(n41), .B(n896), .C(n408), .Y(n736) );
  INVX2 U567 ( .A(n407), .Y(n408) );
  AOI22X1 U568 ( .A(n819), .B(n45), .C(n43), .D(n895), .Y(n407) );
  XOR2X1 U569 ( .A(n719), .B(n1), .Y(n561) );
  OAI21X1 U570 ( .A(n4), .B(n754), .C(n737), .Y(n719) );
  AOI21X1 U571 ( .A(n39), .B(n896), .C(n410), .Y(n737) );
  INVX2 U572 ( .A(n409), .Y(n410) );
  AOI22X1 U573 ( .A(n819), .B(n43), .C(n41), .D(n895), .Y(n409) );
  XOR2X1 U574 ( .A(n720), .B(n1), .Y(n562) );
  OAI21X1 U575 ( .A(n4), .B(n755), .C(n738), .Y(n720) );
  AOI21X1 U576 ( .A(n37), .B(n896), .C(n412), .Y(n738) );
  INVX2 U577 ( .A(n411), .Y(n412) );
  AOI22X1 U578 ( .A(n819), .B(n41), .C(n39), .D(n895), .Y(n411) );
  XOR2X1 U579 ( .A(n721), .B(n1), .Y(n563) );
  OAI21X1 U580 ( .A(n4), .B(n756), .C(n739), .Y(n721) );
  AOI21X1 U581 ( .A(n35), .B(n896), .C(n414), .Y(n739) );
  INVX2 U582 ( .A(n413), .Y(n414) );
  AOI22X1 U583 ( .A(n819), .B(n39), .C(n37), .D(n895), .Y(n413) );
  XOR2X1 U584 ( .A(n722), .B(n1), .Y(n564) );
  OAI21X1 U585 ( .A(n3), .B(n757), .C(n740), .Y(n722) );
  AOI21X1 U586 ( .A(n33), .B(n896), .C(n416), .Y(n740) );
  INVX2 U587 ( .A(n415), .Y(n416) );
  AOI22X1 U588 ( .A(n819), .B(n37), .C(n35), .D(n895), .Y(n415) );
  XOR2X1 U589 ( .A(n723), .B(n1), .Y(n565) );
  OAI21X1 U590 ( .A(n3), .B(n758), .C(n741), .Y(n723) );
  AOI21X1 U591 ( .A(n31), .B(n896), .C(n418), .Y(n741) );
  INVX2 U592 ( .A(n417), .Y(n418) );
  AOI22X1 U593 ( .A(n819), .B(n35), .C(n33), .D(n895), .Y(n417) );
  XOR2X1 U594 ( .A(n724), .B(n1), .Y(n566) );
  OAI21X1 U595 ( .A(n3), .B(n759), .C(n742), .Y(n724) );
  AOI21X1 U596 ( .A(n29), .B(n896), .C(n420), .Y(n742) );
  INVX2 U597 ( .A(n419), .Y(n420) );
  AOI22X1 U598 ( .A(n819), .B(n33), .C(n31), .D(n895), .Y(n419) );
  XOR2X1 U599 ( .A(n725), .B(n1), .Y(n567) );
  OAI21X1 U600 ( .A(n3), .B(n760), .C(n743), .Y(n725) );
  AOI21X1 U601 ( .A(n27), .B(n896), .C(n422), .Y(n743) );
  INVX2 U602 ( .A(n421), .Y(n422) );
  AOI22X1 U603 ( .A(n819), .B(n31), .C(n29), .D(n895), .Y(n421) );
  XOR2X1 U604 ( .A(n726), .B(n1), .Y(n568) );
  OAI21X1 U605 ( .A(n3), .B(n761), .C(n744), .Y(n726) );
  AOI21X1 U606 ( .A(n25), .B(n896), .C(n424), .Y(n744) );
  INVX2 U607 ( .A(n423), .Y(n424) );
  AOI22X1 U608 ( .A(n819), .B(n29), .C(n27), .D(n895), .Y(n423) );
  XOR2X1 U609 ( .A(n727), .B(n1), .Y(n569) );
  OAI21X1 U610 ( .A(n3), .B(n762), .C(n745), .Y(n727) );
  AOI21X1 U611 ( .A(n23), .B(n896), .C(n426), .Y(n745) );
  INVX2 U612 ( .A(n425), .Y(n426) );
  AOI22X1 U613 ( .A(n819), .B(n27), .C(n25), .D(n895), .Y(n425) );
  XOR2X1 U614 ( .A(n728), .B(n1), .Y(n570) );
  OAI21X1 U615 ( .A(n3), .B(n763), .C(n746), .Y(n728) );
  AOI21X1 U616 ( .A(n21), .B(n896), .C(n428), .Y(n746) );
  INVX2 U617 ( .A(n427), .Y(n428) );
  AOI22X1 U618 ( .A(n819), .B(n25), .C(n23), .D(n895), .Y(n427) );
  XOR2X1 U619 ( .A(n729), .B(n1), .Y(n571) );
  OAI21X1 U620 ( .A(n764), .B(n3), .C(n429), .Y(n729) );
  AOI22X1 U621 ( .A(n819), .B(n23), .C(n21), .D(n895), .Y(n429) );
  XOR2X1 U622 ( .A(n730), .B(n1), .Y(n572) );
  OAI21X1 U623 ( .A(n765), .B(n3), .C(n902), .Y(n730) );
  INVX2 U662 ( .A(n782), .Y(n836) );
  XNOR2X1 U663 ( .A(b[14]), .B(b[15]), .Y(n782) );
  AND2X2 U665 ( .A(n793), .B(n783), .Y(n431) );
  OR2X2 U666 ( .A(n783), .B(n432), .Y(n803) );
  INVX2 U667 ( .A(n793), .Y(n432) );
  INVX2 U669 ( .A(n788), .Y(n433) );
  NOR2X1 U670 ( .A(n783), .B(n793), .Y(n837) );
  XNOR2X1 U671 ( .A(b[12]), .B(b[13]), .Y(n788) );
  XNOR2X1 U672 ( .A(b[11]), .B(b[12]), .Y(n783) );
  XOR2X1 U673 ( .A(b[13]), .B(b[14]), .Y(n793) );
  AND2X2 U675 ( .A(n794), .B(n784), .Y(n434) );
  OR2X2 U676 ( .A(n784), .B(n435), .Y(n804) );
  INVX2 U677 ( .A(n794), .Y(n435) );
  INVX2 U679 ( .A(n789), .Y(n436) );
  NOR2X1 U680 ( .A(n784), .B(n794), .Y(n838) );
  XNOR2X1 U681 ( .A(b[9]), .B(b[10]), .Y(n789) );
  XNOR2X1 U682 ( .A(b[8]), .B(b[9]), .Y(n784) );
  XOR2X1 U683 ( .A(b[10]), .B(b[11]), .Y(n794) );
  AND2X2 U685 ( .A(n795), .B(n785), .Y(n437) );
  OR2X2 U686 ( .A(n785), .B(n438), .Y(n805) );
  INVX2 U687 ( .A(n795), .Y(n438) );
  INVX2 U689 ( .A(n790), .Y(n439) );
  NOR2X1 U690 ( .A(n785), .B(n795), .Y(n839) );
  XNOR2X1 U691 ( .A(b[6]), .B(b[7]), .Y(n790) );
  XNOR2X1 U692 ( .A(b[5]), .B(b[6]), .Y(n785) );
  XOR2X1 U693 ( .A(b[7]), .B(b[8]), .Y(n795) );
  AND2X2 U695 ( .A(n796), .B(n786), .Y(n440) );
  OR2X2 U696 ( .A(n786), .B(n441), .Y(n806) );
  INVX2 U697 ( .A(n796), .Y(n441) );
  INVX2 U699 ( .A(n791), .Y(n442) );
  NOR2X1 U700 ( .A(n786), .B(n796), .Y(n840) );
  XNOR2X1 U701 ( .A(b[3]), .B(b[4]), .Y(n791) );
  XNOR2X1 U702 ( .A(b[2]), .B(b[3]), .Y(n786) );
  XOR2X1 U703 ( .A(b[4]), .B(b[5]), .Y(n796) );
  AND2X2 U705 ( .A(n797), .B(n792), .Y(n443) );
  OR2X2 U706 ( .A(n787), .B(n444), .Y(n807) );
  INVX2 U707 ( .A(n797), .Y(n444) );
  INVX2 U709 ( .A(n792), .Y(n445) );
  NOR2X1 U710 ( .A(n787), .B(n797), .Y(n841) );
  XNOR2X1 U711 ( .A(b[0]), .B(b[1]), .Y(n792) );
  INVX2 U712 ( .A(b[0]), .Y(n787) );
  XOR2X1 U713 ( .A(b[1]), .B(b[2]), .Y(n797) );
  HAX1 U714 ( .A(a[30]), .B(n446), .YC(n461), .YS(n462) );
  FAX1 U715 ( .A(a[30]), .B(a[29]), .C(n447), .YC(n446), .YS(n463) );
  FAX1 U716 ( .A(a[29]), .B(a[28]), .C(n448), .YC(n447), .YS(n464) );
  FAX1 U717 ( .A(a[28]), .B(a[27]), .C(n449), .YC(n448), .YS(n465) );
  FAX1 U718 ( .A(a[27]), .B(a[26]), .C(n450), .YC(n449), .YS(n466) );
  FAX1 U719 ( .A(a[26]), .B(a[25]), .C(n451), .YC(n450), .YS(n467) );
  FAX1 U720 ( .A(a[25]), .B(a[24]), .C(n452), .YC(n451), .YS(n468) );
  FAX1 U721 ( .A(a[24]), .B(a[23]), .C(n453), .YC(n452), .YS(n469) );
  FAX1 U722 ( .A(a[23]), .B(a[22]), .C(n454), .YC(n453), .YS(n470) );
  FAX1 U723 ( .A(a[22]), .B(a[21]), .C(n455), .YC(n454), .YS(n471) );
  FAX1 U724 ( .A(a[21]), .B(a[20]), .C(n456), .YC(n455), .YS(n472) );
  FAX1 U725 ( .A(a[20]), .B(a[19]), .C(n457), .YC(n456), .YS(n473) );
  FAX1 U726 ( .A(a[19]), .B(a[18]), .C(n458), .YC(n457), .YS(n474) );
  FAX1 U727 ( .A(a[18]), .B(a[17]), .C(n459), .YC(n458), .YS(n475) );
  FAX1 U728 ( .A(a[17]), .B(a[16]), .C(n460), .YC(n459), .YS(n476) );
  HAX1 U729 ( .A(a[16]), .B(a[15]), .YC(n460), .YS(n477) );
  AND2X2 U733 ( .A(n782), .B(b[15]), .Y(n890) );
  AND2X2 U734 ( .A(n786), .B(n442), .Y(n891) );
  AND2X2 U735 ( .A(n785), .B(n439), .Y(n892) );
  AND2X2 U736 ( .A(n784), .B(n436), .Y(n893) );
  AND2X2 U737 ( .A(n783), .B(n433), .Y(n894) );
  AND2X2 U738 ( .A(n787), .B(n445), .Y(n895) );
  AND2X2 U739 ( .A(n787), .B(n443), .Y(n896) );
  AND2X2 U740 ( .A(n791), .B(n440), .Y(n897) );
  AND2X2 U741 ( .A(n790), .B(n437), .Y(n898) );
  AND2X2 U742 ( .A(n789), .B(n434), .Y(n899) );
  AND2X2 U743 ( .A(n788), .B(n431), .Y(n900) );
  NAND2X1 U744 ( .A(n890), .B(n51), .Y(n901) );
  NAND2X1 U745 ( .A(n819), .B(n21), .Y(n902) );
  NAND2X1 U746 ( .A(n818), .B(n21), .Y(n903) );
  NAND2X1 U747 ( .A(n817), .B(n21), .Y(n904) );
  NAND2X1 U748 ( .A(n816), .B(n21), .Y(n905) );
  NAND2X1 U749 ( .A(n815), .B(n21), .Y(n906) );
  BUFX2 U750 ( .A(n806), .Y(n7) );
  BUFX2 U751 ( .A(n803), .Y(n19) );
  BUFX2 U752 ( .A(n805), .Y(n11) );
  BUFX2 U753 ( .A(n804), .Y(n15) );
  BUFX2 U754 ( .A(n807), .Y(n3) );
  BUFX2 U755 ( .A(n806), .Y(n8) );
  BUFX2 U756 ( .A(n805), .Y(n12) );
  BUFX2 U757 ( .A(n804), .Y(n16) );
  BUFX2 U758 ( .A(n803), .Y(n20) );
  BUFX2 U759 ( .A(n807), .Y(n4) );
  BUFX2 U760 ( .A(n841), .Y(n819) );
  BUFX2 U761 ( .A(n840), .Y(n818) );
  BUFX2 U762 ( .A(n839), .Y(n817) );
  BUFX2 U763 ( .A(n838), .Y(n816) );
  BUFX2 U764 ( .A(n837), .Y(n815) );
  INVX2 U765 ( .A(n461), .Y(n748) );
  INVX2 U766 ( .A(n476), .Y(n763) );
  INVX2 U767 ( .A(n474), .Y(n761) );
  INVX2 U768 ( .A(n475), .Y(n762) );
  INVX2 U769 ( .A(n473), .Y(n760) );
  INVX2 U770 ( .A(n472), .Y(n759) );
  INVX2 U771 ( .A(n471), .Y(n758) );
  INVX2 U772 ( .A(n470), .Y(n757) );
  INVX2 U773 ( .A(n469), .Y(n756) );
  INVX2 U774 ( .A(n467), .Y(n754) );
  INVX2 U775 ( .A(n468), .Y(n755) );
  INVX2 U776 ( .A(n466), .Y(n753) );
  INVX2 U777 ( .A(n464), .Y(n751) );
  INVX2 U778 ( .A(n465), .Y(n752) );
  INVX2 U779 ( .A(n463), .Y(n750) );
  INVX2 U780 ( .A(n462), .Y(n749) );
  INVX2 U781 ( .A(n477), .Y(n764) );
  BUFX4 U782 ( .A(b[2]), .Y(n1) );
  BUFX4 U783 ( .A(b[5]), .Y(n5) );
  BUFX4 U784 ( .A(b[8]), .Y(n9) );
  BUFX4 U785 ( .A(b[11]), .Y(n13) );
  BUFX4 U786 ( .A(b[14]), .Y(n17) );
  BUFX2 U787 ( .A(a[17]), .Y(n25) );
  BUFX2 U788 ( .A(a[18]), .Y(n27) );
  BUFX2 U789 ( .A(a[19]), .Y(n29) );
  BUFX2 U790 ( .A(a[20]), .Y(n31) );
  BUFX2 U791 ( .A(a[21]), .Y(n33) );
  BUFX2 U792 ( .A(a[22]), .Y(n35) );
  BUFX2 U793 ( .A(a[23]), .Y(n37) );
  BUFX2 U794 ( .A(a[24]), .Y(n39) );
  BUFX2 U795 ( .A(a[25]), .Y(n41) );
  BUFX2 U796 ( .A(a[26]), .Y(n43) );
  BUFX2 U797 ( .A(a[27]), .Y(n45) );
  BUFX2 U798 ( .A(a[28]), .Y(n47) );
  BUFX2 U799 ( .A(a[29]), .Y(n49) );
  BUFX2 U800 ( .A(a[16]), .Y(n23) );
  BUFX2 U801 ( .A(a[15]), .Y(n21) );
  BUFX2 U802 ( .A(a[30]), .Y(n51) );
  INVX2 U803 ( .A(a[15]), .Y(n765) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_add_0 add_41 ( .A({src1_data[16], src1_data}), .B({src2_data[16], 
        src2_data}), .CI(1'b0), .SUM(large_sum) );
  alu_DW01_sub_0 sub_44 ( .A({src1_data[16], src1_data}), .B({src2_data[16], 
        src2_data}), .CI(1'b0), .DIFF(large_dif) );
  alu_DW_mult_uns_1 mult_35 ( .a({src1_data[15:0], 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .b(src2_data[15:0]), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  INVX2 U4 ( .A(n25), .Y(n8) );
  BUFX2 U7 ( .A(n5), .Y(n1) );
  INVX2 U8 ( .A(n42), .Y(n6) );
  BUFX2 U9 ( .A(n7), .Y(n2) );
  NAND2X1 U10 ( .A(n3), .B(n4), .Y(result[9]) );
  AOI22X1 U11 ( .A(src1_data[9]), .B(n1), .C(full_mult[39]), .D(n6), .Y(n4) );
  AOI22X1 U12 ( .A(large_dif[9]), .B(n2), .C(large_sum[9]), .D(n8), .Y(n3) );
  NAND2X1 U13 ( .A(n9), .B(n10), .Y(result[8]) );
  AOI22X1 U14 ( .A(src1_data[8]), .B(n1), .C(full_mult[38]), .D(n6), .Y(n10)
         );
  AOI22X1 U15 ( .A(large_dif[8]), .B(n2), .C(large_sum[8]), .D(n8), .Y(n9) );
  NAND2X1 U16 ( .A(n11), .B(n12), .Y(result[7]) );
  AOI22X1 U17 ( .A(src1_data[7]), .B(n1), .C(full_mult[37]), .D(n6), .Y(n12)
         );
  AOI22X1 U18 ( .A(large_dif[7]), .B(n2), .C(large_sum[7]), .D(n8), .Y(n11) );
  NAND2X1 U19 ( .A(n13), .B(n14), .Y(result[6]) );
  AOI22X1 U20 ( .A(src1_data[6]), .B(n1), .C(full_mult[36]), .D(n6), .Y(n14)
         );
  AOI22X1 U21 ( .A(large_dif[6]), .B(n2), .C(large_sum[6]), .D(n8), .Y(n13) );
  NAND2X1 U22 ( .A(n15), .B(n16), .Y(result[5]) );
  AOI22X1 U23 ( .A(src1_data[5]), .B(n1), .C(full_mult[35]), .D(n6), .Y(n16)
         );
  AOI22X1 U24 ( .A(large_dif[5]), .B(n2), .C(large_sum[5]), .D(n8), .Y(n15) );
  NAND2X1 U25 ( .A(n17), .B(n18), .Y(result[4]) );
  AOI22X1 U26 ( .A(src1_data[4]), .B(n1), .C(full_mult[34]), .D(n6), .Y(n18)
         );
  AOI22X1 U27 ( .A(large_dif[4]), .B(n2), .C(large_sum[4]), .D(n8), .Y(n17) );
  NAND2X1 U28 ( .A(n19), .B(n20), .Y(result[3]) );
  AOI22X1 U29 ( .A(src1_data[3]), .B(n1), .C(full_mult[33]), .D(n6), .Y(n20)
         );
  AOI22X1 U30 ( .A(large_dif[3]), .B(n2), .C(large_sum[3]), .D(n8), .Y(n19) );
  NAND2X1 U31 ( .A(n21), .B(n22), .Y(result[2]) );
  AOI22X1 U32 ( .A(src1_data[2]), .B(n1), .C(full_mult[32]), .D(n6), .Y(n22)
         );
  AOI22X1 U33 ( .A(large_dif[2]), .B(n2), .C(large_sum[2]), .D(n8), .Y(n21) );
  NAND2X1 U34 ( .A(n23), .B(n24), .Y(result[1]) );
  AOI22X1 U35 ( .A(src1_data[1]), .B(n1), .C(full_mult[31]), .D(n6), .Y(n24)
         );
  AOI22X1 U36 ( .A(large_dif[1]), .B(n2), .C(large_sum[1]), .D(n8), .Y(n23) );
  OAI21X1 U37 ( .A(n25), .B(n26), .C(n27), .Y(result[16]) );
  AOI22X1 U38 ( .A(src1_data[16]), .B(n1), .C(large_dif[16]), .D(n2), .Y(n27)
         );
  INVX1 U39 ( .A(large_sum[16]), .Y(n26) );
  NAND2X1 U40 ( .A(n28), .B(n29), .Y(result[15]) );
  AOI22X1 U41 ( .A(src1_data[15]), .B(n1), .C(full_mult[45]), .D(n6), .Y(n29)
         );
  AOI22X1 U42 ( .A(large_dif[15]), .B(n2), .C(large_sum[15]), .D(n8), .Y(n28)
         );
  NAND2X1 U43 ( .A(n30), .B(n31), .Y(result[14]) );
  AOI22X1 U44 ( .A(src1_data[14]), .B(n1), .C(full_mult[44]), .D(n6), .Y(n31)
         );
  AOI22X1 U45 ( .A(large_dif[14]), .B(n2), .C(large_sum[14]), .D(n8), .Y(n30)
         );
  NAND2X1 U46 ( .A(n32), .B(n33), .Y(result[13]) );
  AOI22X1 U47 ( .A(src1_data[13]), .B(n1), .C(full_mult[43]), .D(n6), .Y(n33)
         );
  AOI22X1 U48 ( .A(large_dif[13]), .B(n2), .C(large_sum[13]), .D(n8), .Y(n32)
         );
  NAND2X1 U49 ( .A(n34), .B(n35), .Y(result[12]) );
  AOI22X1 U50 ( .A(src1_data[12]), .B(n1), .C(full_mult[42]), .D(n6), .Y(n35)
         );
  AOI22X1 U51 ( .A(large_dif[12]), .B(n2), .C(large_sum[12]), .D(n8), .Y(n34)
         );
  NAND2X1 U52 ( .A(n36), .B(n37), .Y(result[11]) );
  AOI22X1 U53 ( .A(src1_data[11]), .B(n1), .C(full_mult[41]), .D(n6), .Y(n37)
         );
  AOI22X1 U54 ( .A(large_dif[11]), .B(n2), .C(large_sum[11]), .D(n8), .Y(n36)
         );
  NAND2X1 U55 ( .A(n38), .B(n39), .Y(result[10]) );
  AOI22X1 U56 ( .A(src1_data[10]), .B(n1), .C(full_mult[40]), .D(n6), .Y(n39)
         );
  AOI22X1 U57 ( .A(large_dif[10]), .B(n2), .C(large_sum[10]), .D(n8), .Y(n38)
         );
  NAND2X1 U58 ( .A(n40), .B(n41), .Y(result[0]) );
  AOI22X1 U59 ( .A(src1_data[0]), .B(n1), .C(full_mult[30]), .D(n6), .Y(n41)
         );
  NOR2X1 U60 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n5) );
  AOI22X1 U61 ( .A(large_dif[0]), .B(n2), .C(large_sum[0]), .D(n8), .Y(n40) );
  OAI21X1 U62 ( .A(n42), .B(n43), .C(n44), .Y(overflow) );
  AOI22X1 U63 ( .A(n2), .B(n45), .C(n8), .D(n46), .Y(n44) );
  XOR2X1 U64 ( .A(large_sum[17]), .B(large_sum[16]), .Y(n46) );
  NAND2X1 U65 ( .A(alu_op[0]), .B(n47), .Y(n25) );
  XOR2X1 U66 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n45) );
  NOR2X1 U67 ( .A(n47), .B(alu_op[0]), .Y(n7) );
  INVX1 U68 ( .A(alu_op[1]), .Y(n47) );
  INVX1 U69 ( .A(N26), .Y(n43) );
  NAND2X1 U70 ( .A(alu_op[1]), .B(alu_op[0]), .Y(n42) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n32), .new_value(w_data), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n25), .new_value(w_data), .current_value({
        \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] , 
        \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] , 
        \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] , 
        \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] , 
        \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] , 
        \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n24), .new_value(w_data), .current_value({
        \regs_matrix[2][16] , \regs_matrix[2][15] , \regs_matrix[2][14] , 
        \regs_matrix[2][13] , \regs_matrix[2][12] , \regs_matrix[2][11] , 
        \regs_matrix[2][10] , \regs_matrix[2][9] , \regs_matrix[2][8] , 
        \regs_matrix[2][7] , \regs_matrix[2][6] , \regs_matrix[2][5] , 
        \regs_matrix[2][4] , \regs_matrix[2][3] , \regs_matrix[2][2] , 
        \regs_matrix[2][1] , \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n23), .new_value(w_data), .current_value({
        \regs_matrix[3][16] , \regs_matrix[3][15] , \regs_matrix[3][14] , 
        \regs_matrix[3][13] , \regs_matrix[3][12] , \regs_matrix[3][11] , 
        \regs_matrix[3][10] , \regs_matrix[3][9] , \regs_matrix[3][8] , 
        \regs_matrix[3][7] , \regs_matrix[3][6] , \regs_matrix[3][5] , 
        \regs_matrix[3][4] , \regs_matrix[3][3] , \regs_matrix[3][2] , 
        \regs_matrix[3][1] , \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n22), .new_value(w_data), .current_value({
        \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] , 
        \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] , 
        \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] , 
        \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] , 
        \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] , 
        \regs_matrix[4][1] , \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n21), .new_value(w_data), .current_value({
        \regs_matrix[5][16] , \regs_matrix[5][15] , \regs_matrix[5][14] , 
        \regs_matrix[5][13] , \regs_matrix[5][12] , \regs_matrix[5][11] , 
        \regs_matrix[5][10] , \regs_matrix[5][9] , \regs_matrix[5][8] , 
        \regs_matrix[5][7] , \regs_matrix[5][6] , \regs_matrix[5][5] , 
        \regs_matrix[5][4] , \regs_matrix[5][3] , \regs_matrix[5][2] , 
        \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n20), .new_value(w_data), .current_value({
        \regs_matrix[6][16] , \regs_matrix[6][15] , \regs_matrix[6][14] , 
        \regs_matrix[6][13] , \regs_matrix[6][12] , \regs_matrix[6][11] , 
        \regs_matrix[6][10] , \regs_matrix[6][9] , \regs_matrix[6][8] , 
        \regs_matrix[6][7] , \regs_matrix[6][6] , \regs_matrix[6][5] , 
        \regs_matrix[6][4] , \regs_matrix[6][3] , \regs_matrix[6][2] , 
        \regs_matrix[6][1] , \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n19), .new_value(w_data), .current_value({
        \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] , 
        \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] , 
        \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] , 
        \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] , 
        \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] , 
        \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n18), .new_value(w_data), .current_value({
        \regs_matrix[8][16] , \regs_matrix[8][15] , \regs_matrix[8][14] , 
        \regs_matrix[8][13] , \regs_matrix[8][12] , \regs_matrix[8][11] , 
        \regs_matrix[8][10] , \regs_matrix[8][9] , \regs_matrix[8][8] , 
        \regs_matrix[8][7] , \regs_matrix[8][6] , \regs_matrix[8][5] , 
        \regs_matrix[8][4] , \regs_matrix[8][3] , \regs_matrix[8][2] , 
        \regs_matrix[8][1] , \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n17), .new_value(w_data), .current_value({
        \regs_matrix[9][16] , \regs_matrix[9][15] , \regs_matrix[9][14] , 
        \regs_matrix[9][13] , \regs_matrix[9][12] , \regs_matrix[9][11] , 
        \regs_matrix[9][10] , \regs_matrix[9][9] , \regs_matrix[9][8] , 
        \regs_matrix[9][7] , \regs_matrix[9][6] , \regs_matrix[9][5] , 
        \regs_matrix[9][4] , \regs_matrix[9][3] , \regs_matrix[9][2] , 
        \regs_matrix[9][1] , \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n31), .new_value(w_data), .current_value({
        \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] , 
        \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] , 
        \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] , 
        \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] , 
        \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] , 
        \regs_matrix[10][1] , \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n30), .new_value(w_data), .current_value({
        \regs_matrix[11][16] , \regs_matrix[11][15] , \regs_matrix[11][14] , 
        \regs_matrix[11][13] , \regs_matrix[11][12] , \regs_matrix[11][11] , 
        \regs_matrix[11][10] , \regs_matrix[11][9] , \regs_matrix[11][8] , 
        \regs_matrix[11][7] , \regs_matrix[11][6] , \regs_matrix[11][5] , 
        \regs_matrix[11][4] , \regs_matrix[11][3] , \regs_matrix[11][2] , 
        \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n29), .new_value(w_data), .current_value({
        \regs_matrix[12][16] , \regs_matrix[12][15] , \regs_matrix[12][14] , 
        \regs_matrix[12][13] , \regs_matrix[12][12] , \regs_matrix[12][11] , 
        \regs_matrix[12][10] , \regs_matrix[12][9] , \regs_matrix[12][8] , 
        \regs_matrix[12][7] , \regs_matrix[12][6] , \regs_matrix[12][5] , 
        \regs_matrix[12][4] , \regs_matrix[12][3] , \regs_matrix[12][2] , 
        \regs_matrix[12][1] , \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n28), .new_value(w_data), .current_value({
        \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] , 
        \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] , 
        \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] , 
        \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] , 
        \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] , 
        \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n27), .new_value(w_data), .current_value({
        \regs_matrix[14][16] , \regs_matrix[14][15] , \regs_matrix[14][14] , 
        \regs_matrix[14][13] , \regs_matrix[14][12] , \regs_matrix[14][11] , 
        \regs_matrix[14][10] , \regs_matrix[14][9] , \regs_matrix[14][8] , 
        \regs_matrix[14][7] , \regs_matrix[14][6] , \regs_matrix[14][5] , 
        \regs_matrix[14][4] , \regs_matrix[14][3] , \regs_matrix[14][2] , 
        \regs_matrix[14][1] , \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n26), .new_value(w_data), .current_value({
        \regs_matrix[15][16] , \regs_matrix[15][15] , \regs_matrix[15][14] , 
        \regs_matrix[15][13] , \regs_matrix[15][12] , \regs_matrix[15][11] , 
        \regs_matrix[15][10] , \regs_matrix[15][9] , \regs_matrix[15][8] , 
        \regs_matrix[15][7] , \regs_matrix[15][6] , \regs_matrix[15][5] , 
        \regs_matrix[15][4] , \regs_matrix[15][3] , \regs_matrix[15][2] , 
        \regs_matrix[15][1] , \regs_matrix[15][0] }) );
  OR2X2 U2 ( .A(n662), .B(n664), .Y(n1) );
  OR2X2 U3 ( .A(n666), .B(n668), .Y(n2) );
  OR2X2 U4 ( .A(n664), .B(n668), .Y(n3) );
  OR2X2 U5 ( .A(n666), .B(n667), .Y(n4) );
  OR2X2 U6 ( .A(n664), .B(n667), .Y(n5) );
  OR2X2 U7 ( .A(n665), .B(n666), .Y(n6) );
  OR2X2 U8 ( .A(n664), .B(n665), .Y(n7) );
  OR2X2 U9 ( .A(n662), .B(n663), .Y(n8) );
  OR2X2 U10 ( .A(n661), .B(n662), .Y(n9) );
  OR2X2 U11 ( .A(n663), .B(n668), .Y(n10) );
  OR2X2 U12 ( .A(n661), .B(n668), .Y(n11) );
  OR2X2 U13 ( .A(n663), .B(n667), .Y(n12) );
  OR2X2 U14 ( .A(n661), .B(n667), .Y(n13) );
  OR2X2 U15 ( .A(n663), .B(n665), .Y(n14) );
  OR2X2 U16 ( .A(n661), .B(n665), .Y(n15) );
  OR2X2 U17 ( .A(n662), .B(n666), .Y(n16) );
  INVX2 U18 ( .A(n9), .Y(n17) );
  INVX2 U19 ( .A(n8), .Y(n18) );
  INVX2 U20 ( .A(n7), .Y(n19) );
  INVX2 U21 ( .A(n6), .Y(n20) );
  INVX2 U22 ( .A(n5), .Y(n21) );
  INVX2 U23 ( .A(n4), .Y(n22) );
  INVX2 U24 ( .A(n3), .Y(n23) );
  INVX2 U25 ( .A(n2), .Y(n24) );
  INVX2 U26 ( .A(n1), .Y(n25) );
  INVX2 U27 ( .A(n15), .Y(n26) );
  INVX2 U28 ( .A(n14), .Y(n27) );
  INVX2 U29 ( .A(n13), .Y(n28) );
  INVX2 U30 ( .A(n12), .Y(n29) );
  INVX2 U31 ( .A(n11), .Y(n30) );
  INVX2 U32 ( .A(n10), .Y(n31) );
  INVX2 U33 ( .A(n16), .Y(n32) );
  BUFX2 U34 ( .A(n341), .Y(n33) );
  BUFX2 U35 ( .A(n647), .Y(n34) );
  BUFX2 U36 ( .A(n641), .Y(n35) );
  BUFX2 U37 ( .A(n335), .Y(n36) );
  BUFX2 U38 ( .A(n338), .Y(n37) );
  BUFX2 U39 ( .A(n644), .Y(n38) );
  BUFX2 U40 ( .A(n639), .Y(n39) );
  BUFX2 U41 ( .A(n333), .Y(n40) );
  BUFX2 U42 ( .A(n343), .Y(n41) );
  BUFX2 U43 ( .A(n648), .Y(n42) );
  BUFX2 U44 ( .A(n638), .Y(n43) );
  BUFX2 U45 ( .A(n334), .Y(n44) );
  BUFX2 U46 ( .A(n649), .Y(n45) );
  BUFX2 U47 ( .A(n640), .Y(n46) );
  BUFX2 U48 ( .A(n332), .Y(n47) );
  BUFX2 U49 ( .A(n342), .Y(n48) );
  NOR2X1 U50 ( .A(n353), .B(N12), .Y(n51) );
  NAND2X1 U51 ( .A(n51), .B(N10), .Y(n333) );
  NOR2X1 U52 ( .A(N11), .B(N12), .Y(n52) );
  NAND2X1 U53 ( .A(n52), .B(N10), .Y(n332) );
  OAI22X1 U54 ( .A(\regs_matrix[11][0] ), .B(n333), .C(\regs_matrix[9][0] ), 
        .D(n332), .Y(n50) );
  NOR2X1 U55 ( .A(n354), .B(n353), .Y(n55) );
  NAND2X1 U56 ( .A(N10), .B(n55), .Y(n335) );
  NOR2X1 U57 ( .A(n354), .B(N11), .Y(n56) );
  NAND2X1 U58 ( .A(n56), .B(N10), .Y(n334) );
  OAI22X1 U59 ( .A(\regs_matrix[15][0] ), .B(n335), .C(\regs_matrix[13][0] ), 
        .D(n334), .Y(n49) );
  NOR2X1 U60 ( .A(n50), .B(n49), .Y(n68) );
  NAND2X1 U61 ( .A(n51), .B(n352), .Y(n341) );
  NAND2X1 U62 ( .A(n52), .B(n352), .Y(n338) );
  NOR2X1 U63 ( .A(\regs_matrix[8][0] ), .B(n338), .Y(n53) );
  NOR2X1 U64 ( .A(n351), .B(n53), .Y(n54) );
  OAI21X1 U65 ( .A(\regs_matrix[10][0] ), .B(n341), .C(n54), .Y(n58) );
  NAND2X1 U66 ( .A(n55), .B(n352), .Y(n343) );
  NAND2X1 U67 ( .A(n56), .B(n352), .Y(n342) );
  OAI22X1 U68 ( .A(\regs_matrix[14][0] ), .B(n343), .C(\regs_matrix[12][0] ), 
        .D(n342), .Y(n57) );
  NOR2X1 U69 ( .A(n58), .B(n57), .Y(n67) );
  OAI22X1 U70 ( .A(\regs_matrix[3][0] ), .B(n333), .C(\regs_matrix[1][0] ), 
        .D(n332), .Y(n60) );
  OAI22X1 U71 ( .A(\regs_matrix[7][0] ), .B(n335), .C(\regs_matrix[5][0] ), 
        .D(n334), .Y(n59) );
  NOR2X1 U72 ( .A(n60), .B(n59), .Y(n66) );
  NOR2X1 U73 ( .A(outreg_data[0]), .B(n338), .Y(n61) );
  NOR2X1 U74 ( .A(N13), .B(n61), .Y(n62) );
  OAI21X1 U75 ( .A(\regs_matrix[2][0] ), .B(n341), .C(n62), .Y(n64) );
  OAI22X1 U76 ( .A(\regs_matrix[6][0] ), .B(n343), .C(\regs_matrix[4][0] ), 
        .D(n342), .Y(n63) );
  NOR2X1 U77 ( .A(n64), .B(n63), .Y(n65) );
  AOI22X1 U78 ( .A(n68), .B(n67), .C(n66), .D(n65), .Y(n69) );
  OAI22X1 U79 ( .A(\regs_matrix[11][1] ), .B(n333), .C(\regs_matrix[9][1] ), 
        .D(n332), .Y(n71) );
  OAI22X1 U80 ( .A(\regs_matrix[15][1] ), .B(n335), .C(\regs_matrix[13][1] ), 
        .D(n334), .Y(n70) );
  NOR2X1 U81 ( .A(n71), .B(n70), .Y(n85) );
  NOR2X1 U82 ( .A(\regs_matrix[8][1] ), .B(n338), .Y(n72) );
  NOR2X1 U83 ( .A(n351), .B(n72), .Y(n73) );
  OAI21X1 U84 ( .A(\regs_matrix[10][1] ), .B(n341), .C(n73), .Y(n75) );
  OAI22X1 U85 ( .A(\regs_matrix[14][1] ), .B(n343), .C(\regs_matrix[12][1] ), 
        .D(n342), .Y(n74) );
  NOR2X1 U86 ( .A(n75), .B(n74), .Y(n84) );
  OAI22X1 U87 ( .A(\regs_matrix[3][1] ), .B(n333), .C(\regs_matrix[1][1] ), 
        .D(n332), .Y(n77) );
  OAI22X1 U88 ( .A(\regs_matrix[7][1] ), .B(n335), .C(\regs_matrix[5][1] ), 
        .D(n334), .Y(n76) );
  NOR2X1 U89 ( .A(n77), .B(n76), .Y(n83) );
  NOR2X1 U90 ( .A(outreg_data[1]), .B(n338), .Y(n78) );
  NOR2X1 U91 ( .A(N13), .B(n78), .Y(n79) );
  OAI21X1 U92 ( .A(\regs_matrix[2][1] ), .B(n341), .C(n79), .Y(n81) );
  OAI22X1 U93 ( .A(\regs_matrix[6][1] ), .B(n343), .C(\regs_matrix[4][1] ), 
        .D(n342), .Y(n80) );
  NOR2X1 U94 ( .A(n81), .B(n80), .Y(n82) );
  AOI22X1 U95 ( .A(n85), .B(n84), .C(n83), .D(n82), .Y(n86) );
  OAI22X1 U96 ( .A(\regs_matrix[11][2] ), .B(n333), .C(\regs_matrix[9][2] ), 
        .D(n332), .Y(n88) );
  OAI22X1 U97 ( .A(\regs_matrix[15][2] ), .B(n335), .C(\regs_matrix[13][2] ), 
        .D(n334), .Y(n87) );
  NOR2X1 U98 ( .A(n88), .B(n87), .Y(n102) );
  NOR2X1 U99 ( .A(\regs_matrix[8][2] ), .B(n338), .Y(n89) );
  NOR2X1 U100 ( .A(n351), .B(n89), .Y(n90) );
  OAI21X1 U101 ( .A(\regs_matrix[10][2] ), .B(n341), .C(n90), .Y(n92) );
  OAI22X1 U102 ( .A(\regs_matrix[14][2] ), .B(n343), .C(\regs_matrix[12][2] ), 
        .D(n342), .Y(n91) );
  NOR2X1 U103 ( .A(n92), .B(n91), .Y(n101) );
  OAI22X1 U104 ( .A(\regs_matrix[3][2] ), .B(n333), .C(\regs_matrix[1][2] ), 
        .D(n332), .Y(n94) );
  OAI22X1 U105 ( .A(\regs_matrix[7][2] ), .B(n335), .C(\regs_matrix[5][2] ), 
        .D(n334), .Y(n93) );
  NOR2X1 U106 ( .A(n94), .B(n93), .Y(n100) );
  NOR2X1 U107 ( .A(outreg_data[2]), .B(n338), .Y(n95) );
  NOR2X1 U108 ( .A(N13), .B(n95), .Y(n96) );
  OAI21X1 U109 ( .A(\regs_matrix[2][2] ), .B(n341), .C(n96), .Y(n98) );
  OAI22X1 U110 ( .A(\regs_matrix[6][2] ), .B(n343), .C(\regs_matrix[4][2] ), 
        .D(n342), .Y(n97) );
  NOR2X1 U111 ( .A(n98), .B(n97), .Y(n99) );
  AOI22X1 U112 ( .A(n102), .B(n101), .C(n100), .D(n99), .Y(n103) );
  OAI22X1 U113 ( .A(\regs_matrix[11][3] ), .B(n333), .C(\regs_matrix[9][3] ), 
        .D(n332), .Y(n105) );
  OAI22X1 U114 ( .A(\regs_matrix[15][3] ), .B(n335), .C(\regs_matrix[13][3] ), 
        .D(n334), .Y(n104) );
  NOR2X1 U115 ( .A(n105), .B(n104), .Y(n119) );
  NOR2X1 U116 ( .A(\regs_matrix[8][3] ), .B(n338), .Y(n106) );
  NOR2X1 U117 ( .A(n351), .B(n106), .Y(n107) );
  OAI21X1 U118 ( .A(\regs_matrix[10][3] ), .B(n341), .C(n107), .Y(n109) );
  OAI22X1 U119 ( .A(\regs_matrix[14][3] ), .B(n343), .C(\regs_matrix[12][3] ), 
        .D(n342), .Y(n108) );
  NOR2X1 U120 ( .A(n109), .B(n108), .Y(n118) );
  OAI22X1 U121 ( .A(\regs_matrix[3][3] ), .B(n333), .C(\regs_matrix[1][3] ), 
        .D(n332), .Y(n111) );
  OAI22X1 U122 ( .A(\regs_matrix[7][3] ), .B(n335), .C(\regs_matrix[5][3] ), 
        .D(n334), .Y(n110) );
  NOR2X1 U123 ( .A(n111), .B(n110), .Y(n117) );
  NOR2X1 U124 ( .A(outreg_data[3]), .B(n338), .Y(n112) );
  NOR2X1 U125 ( .A(N13), .B(n112), .Y(n113) );
  OAI21X1 U126 ( .A(\regs_matrix[2][3] ), .B(n341), .C(n113), .Y(n115) );
  OAI22X1 U127 ( .A(\regs_matrix[6][3] ), .B(n343), .C(\regs_matrix[4][3] ), 
        .D(n342), .Y(n114) );
  NOR2X1 U128 ( .A(n115), .B(n114), .Y(n116) );
  AOI22X1 U129 ( .A(n119), .B(n118), .C(n117), .D(n116), .Y(n120) );
  OAI22X1 U130 ( .A(\regs_matrix[11][4] ), .B(n40), .C(\regs_matrix[9][4] ), 
        .D(n332), .Y(n122) );
  OAI22X1 U131 ( .A(\regs_matrix[15][4] ), .B(n36), .C(\regs_matrix[13][4] ), 
        .D(n334), .Y(n121) );
  NOR2X1 U132 ( .A(n122), .B(n121), .Y(n136) );
  NOR2X1 U133 ( .A(\regs_matrix[8][4] ), .B(n338), .Y(n123) );
  NOR2X1 U134 ( .A(n351), .B(n123), .Y(n124) );
  OAI21X1 U135 ( .A(\regs_matrix[10][4] ), .B(n341), .C(n124), .Y(n126) );
  OAI22X1 U136 ( .A(\regs_matrix[14][4] ), .B(n41), .C(\regs_matrix[12][4] ), 
        .D(n342), .Y(n125) );
  NOR2X1 U137 ( .A(n126), .B(n125), .Y(n135) );
  OAI22X1 U138 ( .A(\regs_matrix[3][4] ), .B(n40), .C(\regs_matrix[1][4] ), 
        .D(n47), .Y(n128) );
  OAI22X1 U139 ( .A(\regs_matrix[7][4] ), .B(n36), .C(\regs_matrix[5][4] ), 
        .D(n44), .Y(n127) );
  NOR2X1 U140 ( .A(n128), .B(n127), .Y(n134) );
  NOR2X1 U141 ( .A(outreg_data[4]), .B(n338), .Y(n129) );
  NOR2X1 U142 ( .A(N13), .B(n129), .Y(n130) );
  OAI21X1 U143 ( .A(\regs_matrix[2][4] ), .B(n33), .C(n130), .Y(n132) );
  OAI22X1 U144 ( .A(\regs_matrix[6][4] ), .B(n41), .C(\regs_matrix[4][4] ), 
        .D(n48), .Y(n131) );
  NOR2X1 U145 ( .A(n132), .B(n131), .Y(n133) );
  AOI22X1 U146 ( .A(n136), .B(n135), .C(n134), .D(n133), .Y(n137) );
  OAI22X1 U147 ( .A(\regs_matrix[11][5] ), .B(n40), .C(\regs_matrix[9][5] ), 
        .D(n47), .Y(n139) );
  OAI22X1 U148 ( .A(\regs_matrix[15][5] ), .B(n36), .C(\regs_matrix[13][5] ), 
        .D(n44), .Y(n138) );
  NOR2X1 U149 ( .A(n139), .B(n138), .Y(n153) );
  NOR2X1 U150 ( .A(\regs_matrix[8][5] ), .B(n338), .Y(n140) );
  NOR2X1 U151 ( .A(n351), .B(n140), .Y(n141) );
  OAI21X1 U152 ( .A(\regs_matrix[10][5] ), .B(n33), .C(n141), .Y(n143) );
  OAI22X1 U153 ( .A(\regs_matrix[14][5] ), .B(n41), .C(\regs_matrix[12][5] ), 
        .D(n48), .Y(n142) );
  NOR2X1 U154 ( .A(n143), .B(n142), .Y(n152) );
  OAI22X1 U155 ( .A(\regs_matrix[3][5] ), .B(n40), .C(\regs_matrix[1][5] ), 
        .D(n47), .Y(n145) );
  OAI22X1 U156 ( .A(\regs_matrix[7][5] ), .B(n36), .C(\regs_matrix[5][5] ), 
        .D(n44), .Y(n144) );
  NOR2X1 U157 ( .A(n145), .B(n144), .Y(n151) );
  NOR2X1 U158 ( .A(outreg_data[5]), .B(n338), .Y(n146) );
  NOR2X1 U159 ( .A(N13), .B(n146), .Y(n147) );
  OAI21X1 U160 ( .A(\regs_matrix[2][5] ), .B(n33), .C(n147), .Y(n149) );
  OAI22X1 U161 ( .A(\regs_matrix[6][5] ), .B(n41), .C(\regs_matrix[4][5] ), 
        .D(n48), .Y(n148) );
  NOR2X1 U162 ( .A(n149), .B(n148), .Y(n150) );
  AOI22X1 U163 ( .A(n153), .B(n152), .C(n151), .D(n150), .Y(n154) );
  OAI22X1 U164 ( .A(\regs_matrix[11][6] ), .B(n40), .C(\regs_matrix[9][6] ), 
        .D(n47), .Y(n156) );
  OAI22X1 U165 ( .A(\regs_matrix[15][6] ), .B(n36), .C(\regs_matrix[13][6] ), 
        .D(n44), .Y(n155) );
  NOR2X1 U166 ( .A(n156), .B(n155), .Y(n170) );
  NOR2X1 U167 ( .A(\regs_matrix[8][6] ), .B(n338), .Y(n157) );
  NOR2X1 U168 ( .A(n351), .B(n157), .Y(n158) );
  OAI21X1 U169 ( .A(\regs_matrix[10][6] ), .B(n33), .C(n158), .Y(n160) );
  OAI22X1 U170 ( .A(\regs_matrix[14][6] ), .B(n41), .C(\regs_matrix[12][6] ), 
        .D(n48), .Y(n159) );
  NOR2X1 U171 ( .A(n160), .B(n159), .Y(n169) );
  OAI22X1 U172 ( .A(\regs_matrix[3][6] ), .B(n40), .C(\regs_matrix[1][6] ), 
        .D(n47), .Y(n162) );
  OAI22X1 U173 ( .A(\regs_matrix[7][6] ), .B(n36), .C(\regs_matrix[5][6] ), 
        .D(n44), .Y(n161) );
  NOR2X1 U174 ( .A(n162), .B(n161), .Y(n168) );
  NOR2X1 U175 ( .A(outreg_data[6]), .B(n37), .Y(n163) );
  NOR2X1 U176 ( .A(N13), .B(n163), .Y(n164) );
  OAI21X1 U177 ( .A(\regs_matrix[2][6] ), .B(n33), .C(n164), .Y(n166) );
  OAI22X1 U178 ( .A(\regs_matrix[6][6] ), .B(n41), .C(\regs_matrix[4][6] ), 
        .D(n48), .Y(n165) );
  NOR2X1 U179 ( .A(n166), .B(n165), .Y(n167) );
  AOI22X1 U180 ( .A(n170), .B(n169), .C(n168), .D(n167), .Y(n171) );
  OAI22X1 U181 ( .A(\regs_matrix[11][7] ), .B(n40), .C(\regs_matrix[9][7] ), 
        .D(n47), .Y(n173) );
  OAI22X1 U182 ( .A(\regs_matrix[15][7] ), .B(n36), .C(\regs_matrix[13][7] ), 
        .D(n44), .Y(n172) );
  NOR2X1 U183 ( .A(n173), .B(n172), .Y(n187) );
  NOR2X1 U184 ( .A(\regs_matrix[8][7] ), .B(n37), .Y(n174) );
  NOR2X1 U185 ( .A(n351), .B(n174), .Y(n175) );
  OAI21X1 U186 ( .A(\regs_matrix[10][7] ), .B(n33), .C(n175), .Y(n177) );
  OAI22X1 U187 ( .A(\regs_matrix[14][7] ), .B(n41), .C(\regs_matrix[12][7] ), 
        .D(n48), .Y(n176) );
  NOR2X1 U188 ( .A(n177), .B(n176), .Y(n186) );
  OAI22X1 U189 ( .A(\regs_matrix[3][7] ), .B(n40), .C(\regs_matrix[1][7] ), 
        .D(n47), .Y(n179) );
  OAI22X1 U190 ( .A(\regs_matrix[7][7] ), .B(n36), .C(\regs_matrix[5][7] ), 
        .D(n44), .Y(n178) );
  NOR2X1 U191 ( .A(n179), .B(n178), .Y(n185) );
  NOR2X1 U192 ( .A(outreg_data[7]), .B(n37), .Y(n180) );
  NOR2X1 U193 ( .A(N13), .B(n180), .Y(n181) );
  OAI21X1 U194 ( .A(\regs_matrix[2][7] ), .B(n33), .C(n181), .Y(n183) );
  OAI22X1 U195 ( .A(\regs_matrix[6][7] ), .B(n41), .C(\regs_matrix[4][7] ), 
        .D(n48), .Y(n182) );
  NOR2X1 U196 ( .A(n183), .B(n182), .Y(n184) );
  AOI22X1 U197 ( .A(n187), .B(n186), .C(n185), .D(n184), .Y(n188) );
  OAI22X1 U198 ( .A(\regs_matrix[11][8] ), .B(n40), .C(\regs_matrix[9][8] ), 
        .D(n47), .Y(n190) );
  OAI22X1 U199 ( .A(\regs_matrix[15][8] ), .B(n36), .C(\regs_matrix[13][8] ), 
        .D(n44), .Y(n189) );
  NOR2X1 U200 ( .A(n190), .B(n189), .Y(n204) );
  NOR2X1 U201 ( .A(\regs_matrix[8][8] ), .B(n37), .Y(n191) );
  NOR2X1 U202 ( .A(n351), .B(n191), .Y(n192) );
  OAI21X1 U203 ( .A(\regs_matrix[10][8] ), .B(n33), .C(n192), .Y(n194) );
  OAI22X1 U204 ( .A(\regs_matrix[14][8] ), .B(n41), .C(\regs_matrix[12][8] ), 
        .D(n48), .Y(n193) );
  NOR2X1 U205 ( .A(n194), .B(n193), .Y(n203) );
  OAI22X1 U206 ( .A(\regs_matrix[3][8] ), .B(n40), .C(\regs_matrix[1][8] ), 
        .D(n47), .Y(n196) );
  OAI22X1 U207 ( .A(\regs_matrix[7][8] ), .B(n36), .C(\regs_matrix[5][8] ), 
        .D(n44), .Y(n195) );
  NOR2X1 U208 ( .A(n196), .B(n195), .Y(n202) );
  NOR2X1 U209 ( .A(outreg_data[8]), .B(n37), .Y(n197) );
  NOR2X1 U210 ( .A(N13), .B(n197), .Y(n198) );
  OAI21X1 U211 ( .A(\regs_matrix[2][8] ), .B(n33), .C(n198), .Y(n200) );
  OAI22X1 U212 ( .A(\regs_matrix[6][8] ), .B(n41), .C(\regs_matrix[4][8] ), 
        .D(n48), .Y(n199) );
  NOR2X1 U213 ( .A(n200), .B(n199), .Y(n201) );
  AOI22X1 U214 ( .A(n204), .B(n203), .C(n202), .D(n201), .Y(n205) );
  OAI22X1 U215 ( .A(\regs_matrix[11][9] ), .B(n40), .C(\regs_matrix[9][9] ), 
        .D(n47), .Y(n207) );
  OAI22X1 U216 ( .A(\regs_matrix[15][9] ), .B(n36), .C(\regs_matrix[13][9] ), 
        .D(n44), .Y(n206) );
  NOR2X1 U217 ( .A(n207), .B(n206), .Y(n221) );
  NOR2X1 U218 ( .A(\regs_matrix[8][9] ), .B(n37), .Y(n208) );
  NOR2X1 U219 ( .A(n351), .B(n208), .Y(n209) );
  OAI21X1 U220 ( .A(\regs_matrix[10][9] ), .B(n33), .C(n209), .Y(n211) );
  OAI22X1 U221 ( .A(\regs_matrix[14][9] ), .B(n41), .C(\regs_matrix[12][9] ), 
        .D(n48), .Y(n210) );
  NOR2X1 U222 ( .A(n211), .B(n210), .Y(n220) );
  OAI22X1 U223 ( .A(\regs_matrix[3][9] ), .B(n40), .C(\regs_matrix[1][9] ), 
        .D(n47), .Y(n213) );
  OAI22X1 U224 ( .A(\regs_matrix[7][9] ), .B(n36), .C(\regs_matrix[5][9] ), 
        .D(n44), .Y(n212) );
  NOR2X1 U225 ( .A(n213), .B(n212), .Y(n219) );
  NOR2X1 U226 ( .A(outreg_data[9]), .B(n37), .Y(n214) );
  NOR2X1 U227 ( .A(N13), .B(n214), .Y(n215) );
  OAI21X1 U228 ( .A(\regs_matrix[2][9] ), .B(n33), .C(n215), .Y(n217) );
  OAI22X1 U229 ( .A(\regs_matrix[6][9] ), .B(n41), .C(\regs_matrix[4][9] ), 
        .D(n48), .Y(n216) );
  NOR2X1 U230 ( .A(n217), .B(n216), .Y(n218) );
  AOI22X1 U231 ( .A(n221), .B(n220), .C(n219), .D(n218), .Y(n222) );
  OAI22X1 U232 ( .A(\regs_matrix[11][10] ), .B(n40), .C(\regs_matrix[9][10] ), 
        .D(n47), .Y(n224) );
  OAI22X1 U233 ( .A(\regs_matrix[15][10] ), .B(n36), .C(\regs_matrix[13][10] ), 
        .D(n44), .Y(n223) );
  NOR2X1 U234 ( .A(n224), .B(n223), .Y(n238) );
  NOR2X1 U235 ( .A(\regs_matrix[8][10] ), .B(n37), .Y(n225) );
  NOR2X1 U236 ( .A(n351), .B(n225), .Y(n226) );
  OAI21X1 U237 ( .A(\regs_matrix[10][10] ), .B(n33), .C(n226), .Y(n228) );
  OAI22X1 U238 ( .A(\regs_matrix[14][10] ), .B(n41), .C(\regs_matrix[12][10] ), 
        .D(n48), .Y(n227) );
  NOR2X1 U239 ( .A(n228), .B(n227), .Y(n237) );
  OAI22X1 U240 ( .A(\regs_matrix[3][10] ), .B(n40), .C(\regs_matrix[1][10] ), 
        .D(n47), .Y(n230) );
  OAI22X1 U241 ( .A(\regs_matrix[7][10] ), .B(n36), .C(\regs_matrix[5][10] ), 
        .D(n44), .Y(n229) );
  NOR2X1 U242 ( .A(n230), .B(n229), .Y(n236) );
  NOR2X1 U243 ( .A(outreg_data[10]), .B(n37), .Y(n231) );
  NOR2X1 U244 ( .A(N13), .B(n231), .Y(n232) );
  OAI21X1 U245 ( .A(\regs_matrix[2][10] ), .B(n33), .C(n232), .Y(n234) );
  OAI22X1 U246 ( .A(\regs_matrix[6][10] ), .B(n41), .C(\regs_matrix[4][10] ), 
        .D(n48), .Y(n233) );
  NOR2X1 U247 ( .A(n234), .B(n233), .Y(n235) );
  AOI22X1 U248 ( .A(n238), .B(n237), .C(n236), .D(n235), .Y(n239) );
  OAI22X1 U249 ( .A(\regs_matrix[11][11] ), .B(n40), .C(\regs_matrix[9][11] ), 
        .D(n47), .Y(n241) );
  OAI22X1 U250 ( .A(\regs_matrix[15][11] ), .B(n36), .C(\regs_matrix[13][11] ), 
        .D(n44), .Y(n240) );
  NOR2X1 U251 ( .A(n241), .B(n240), .Y(n255) );
  NOR2X1 U252 ( .A(\regs_matrix[8][11] ), .B(n37), .Y(n242) );
  NOR2X1 U253 ( .A(n351), .B(n242), .Y(n243) );
  OAI21X1 U254 ( .A(\regs_matrix[10][11] ), .B(n33), .C(n243), .Y(n245) );
  OAI22X1 U255 ( .A(\regs_matrix[14][11] ), .B(n41), .C(\regs_matrix[12][11] ), 
        .D(n48), .Y(n244) );
  NOR2X1 U256 ( .A(n245), .B(n244), .Y(n254) );
  OAI22X1 U257 ( .A(\regs_matrix[3][11] ), .B(n40), .C(\regs_matrix[1][11] ), 
        .D(n47), .Y(n247) );
  OAI22X1 U258 ( .A(\regs_matrix[7][11] ), .B(n36), .C(\regs_matrix[5][11] ), 
        .D(n44), .Y(n246) );
  NOR2X1 U259 ( .A(n247), .B(n246), .Y(n253) );
  NOR2X1 U260 ( .A(outreg_data[11]), .B(n37), .Y(n248) );
  NOR2X1 U261 ( .A(N13), .B(n248), .Y(n249) );
  OAI21X1 U262 ( .A(\regs_matrix[2][11] ), .B(n33), .C(n249), .Y(n251) );
  OAI22X1 U263 ( .A(\regs_matrix[6][11] ), .B(n41), .C(\regs_matrix[4][11] ), 
        .D(n48), .Y(n250) );
  NOR2X1 U264 ( .A(n251), .B(n250), .Y(n252) );
  AOI22X1 U265 ( .A(n255), .B(n254), .C(n253), .D(n252), .Y(n256) );
  OAI22X1 U266 ( .A(\regs_matrix[11][12] ), .B(n40), .C(\regs_matrix[9][12] ), 
        .D(n47), .Y(n258) );
  OAI22X1 U267 ( .A(\regs_matrix[15][12] ), .B(n36), .C(\regs_matrix[13][12] ), 
        .D(n44), .Y(n257) );
  NOR2X1 U268 ( .A(n258), .B(n257), .Y(n272) );
  NOR2X1 U269 ( .A(\regs_matrix[8][12] ), .B(n37), .Y(n259) );
  NOR2X1 U270 ( .A(n351), .B(n259), .Y(n260) );
  OAI21X1 U271 ( .A(\regs_matrix[10][12] ), .B(n33), .C(n260), .Y(n262) );
  OAI22X1 U272 ( .A(\regs_matrix[14][12] ), .B(n41), .C(\regs_matrix[12][12] ), 
        .D(n48), .Y(n261) );
  NOR2X1 U273 ( .A(n262), .B(n261), .Y(n271) );
  OAI22X1 U274 ( .A(\regs_matrix[3][12] ), .B(n40), .C(\regs_matrix[1][12] ), 
        .D(n47), .Y(n264) );
  OAI22X1 U275 ( .A(\regs_matrix[7][12] ), .B(n36), .C(\regs_matrix[5][12] ), 
        .D(n44), .Y(n263) );
  NOR2X1 U276 ( .A(n264), .B(n263), .Y(n270) );
  NOR2X1 U277 ( .A(outreg_data[12]), .B(n37), .Y(n265) );
  NOR2X1 U278 ( .A(N13), .B(n265), .Y(n266) );
  OAI21X1 U279 ( .A(\regs_matrix[2][12] ), .B(n33), .C(n266), .Y(n268) );
  OAI22X1 U280 ( .A(\regs_matrix[6][12] ), .B(n41), .C(\regs_matrix[4][12] ), 
        .D(n48), .Y(n267) );
  NOR2X1 U281 ( .A(n268), .B(n267), .Y(n269) );
  AOI22X1 U282 ( .A(n272), .B(n271), .C(n270), .D(n269), .Y(n273) );
  OAI22X1 U283 ( .A(\regs_matrix[11][13] ), .B(n40), .C(\regs_matrix[9][13] ), 
        .D(n47), .Y(n275) );
  OAI22X1 U284 ( .A(\regs_matrix[15][13] ), .B(n36), .C(\regs_matrix[13][13] ), 
        .D(n44), .Y(n274) );
  NOR2X1 U285 ( .A(n275), .B(n274), .Y(n289) );
  NOR2X1 U286 ( .A(\regs_matrix[8][13] ), .B(n37), .Y(n276) );
  NOR2X1 U287 ( .A(n351), .B(n276), .Y(n277) );
  OAI21X1 U288 ( .A(\regs_matrix[10][13] ), .B(n33), .C(n277), .Y(n279) );
  OAI22X1 U289 ( .A(\regs_matrix[14][13] ), .B(n41), .C(\regs_matrix[12][13] ), 
        .D(n48), .Y(n278) );
  NOR2X1 U290 ( .A(n279), .B(n278), .Y(n288) );
  OAI22X1 U291 ( .A(\regs_matrix[3][13] ), .B(n40), .C(\regs_matrix[1][13] ), 
        .D(n47), .Y(n281) );
  OAI22X1 U292 ( .A(\regs_matrix[7][13] ), .B(n36), .C(\regs_matrix[5][13] ), 
        .D(n44), .Y(n280) );
  NOR2X1 U293 ( .A(n281), .B(n280), .Y(n287) );
  NOR2X1 U294 ( .A(outreg_data[13]), .B(n37), .Y(n282) );
  NOR2X1 U295 ( .A(N13), .B(n282), .Y(n283) );
  OAI21X1 U296 ( .A(\regs_matrix[2][13] ), .B(n33), .C(n283), .Y(n285) );
  OAI22X1 U297 ( .A(\regs_matrix[6][13] ), .B(n41), .C(\regs_matrix[4][13] ), 
        .D(n48), .Y(n284) );
  NOR2X1 U298 ( .A(n285), .B(n284), .Y(n286) );
  AOI22X1 U299 ( .A(n289), .B(n288), .C(n287), .D(n286), .Y(n290) );
  OAI22X1 U300 ( .A(\regs_matrix[11][14] ), .B(n40), .C(\regs_matrix[9][14] ), 
        .D(n47), .Y(n292) );
  OAI22X1 U301 ( .A(\regs_matrix[15][14] ), .B(n36), .C(\regs_matrix[13][14] ), 
        .D(n44), .Y(n291) );
  NOR2X1 U302 ( .A(n292), .B(n291), .Y(n306) );
  NOR2X1 U303 ( .A(\regs_matrix[8][14] ), .B(n37), .Y(n293) );
  NOR2X1 U304 ( .A(n351), .B(n293), .Y(n294) );
  OAI21X1 U305 ( .A(\regs_matrix[10][14] ), .B(n33), .C(n294), .Y(n296) );
  OAI22X1 U306 ( .A(\regs_matrix[14][14] ), .B(n41), .C(\regs_matrix[12][14] ), 
        .D(n48), .Y(n295) );
  NOR2X1 U307 ( .A(n296), .B(n295), .Y(n305) );
  OAI22X1 U308 ( .A(\regs_matrix[3][14] ), .B(n40), .C(\regs_matrix[1][14] ), 
        .D(n47), .Y(n298) );
  OAI22X1 U309 ( .A(\regs_matrix[7][14] ), .B(n36), .C(\regs_matrix[5][14] ), 
        .D(n44), .Y(n297) );
  NOR2X1 U310 ( .A(n298), .B(n297), .Y(n304) );
  NOR2X1 U311 ( .A(outreg_data[14]), .B(n37), .Y(n299) );
  NOR2X1 U312 ( .A(N13), .B(n299), .Y(n300) );
  OAI21X1 U313 ( .A(\regs_matrix[2][14] ), .B(n33), .C(n300), .Y(n302) );
  OAI22X1 U314 ( .A(\regs_matrix[6][14] ), .B(n41), .C(\regs_matrix[4][14] ), 
        .D(n48), .Y(n301) );
  NOR2X1 U315 ( .A(n302), .B(n301), .Y(n303) );
  AOI22X1 U316 ( .A(n306), .B(n305), .C(n304), .D(n303), .Y(n307) );
  OAI22X1 U317 ( .A(\regs_matrix[11][15] ), .B(n40), .C(\regs_matrix[9][15] ), 
        .D(n47), .Y(n309) );
  OAI22X1 U318 ( .A(\regs_matrix[15][15] ), .B(n36), .C(\regs_matrix[13][15] ), 
        .D(n44), .Y(n308) );
  NOR2X1 U319 ( .A(n309), .B(n308), .Y(n323) );
  NOR2X1 U320 ( .A(\regs_matrix[8][15] ), .B(n37), .Y(n310) );
  NOR2X1 U321 ( .A(n351), .B(n310), .Y(n311) );
  OAI21X1 U322 ( .A(\regs_matrix[10][15] ), .B(n33), .C(n311), .Y(n313) );
  OAI22X1 U323 ( .A(\regs_matrix[14][15] ), .B(n41), .C(\regs_matrix[12][15] ), 
        .D(n48), .Y(n312) );
  NOR2X1 U324 ( .A(n313), .B(n312), .Y(n322) );
  OAI22X1 U325 ( .A(\regs_matrix[3][15] ), .B(n40), .C(\regs_matrix[1][15] ), 
        .D(n47), .Y(n315) );
  OAI22X1 U326 ( .A(\regs_matrix[7][15] ), .B(n36), .C(\regs_matrix[5][15] ), 
        .D(n44), .Y(n314) );
  NOR2X1 U327 ( .A(n315), .B(n314), .Y(n321) );
  NOR2X1 U328 ( .A(outreg_data[15]), .B(n37), .Y(n316) );
  NOR2X1 U329 ( .A(N13), .B(n316), .Y(n317) );
  OAI21X1 U330 ( .A(\regs_matrix[2][15] ), .B(n33), .C(n317), .Y(n319) );
  OAI22X1 U331 ( .A(\regs_matrix[6][15] ), .B(n41), .C(\regs_matrix[4][15] ), 
        .D(n48), .Y(n318) );
  NOR2X1 U332 ( .A(n319), .B(n318), .Y(n320) );
  AOI22X1 U333 ( .A(n323), .B(n322), .C(n321), .D(n320), .Y(n324) );
  OAI22X1 U334 ( .A(\regs_matrix[13][16] ), .B(n44), .C(\regs_matrix[11][16] ), 
        .D(n333), .Y(n326) );
  OAI21X1 U335 ( .A(\regs_matrix[15][16] ), .B(n335), .C(N13), .Y(n325) );
  NOR2X1 U336 ( .A(n326), .B(n325), .Y(n349) );
  NOR2X1 U337 ( .A(\regs_matrix[8][16] ), .B(n37), .Y(n328) );
  NOR2X1 U338 ( .A(\regs_matrix[10][16] ), .B(n33), .Y(n327) );
  NOR2X1 U339 ( .A(n328), .B(n327), .Y(n329) );
  OAI21X1 U340 ( .A(\regs_matrix[12][16] ), .B(n48), .C(n329), .Y(n331) );
  OAI22X1 U341 ( .A(\regs_matrix[9][16] ), .B(n47), .C(\regs_matrix[14][16] ), 
        .D(n343), .Y(n330) );
  NOR2X1 U342 ( .A(n331), .B(n330), .Y(n348) );
  OAI22X1 U343 ( .A(\regs_matrix[3][16] ), .B(n40), .C(\regs_matrix[1][16] ), 
        .D(n47), .Y(n337) );
  OAI22X1 U344 ( .A(\regs_matrix[7][16] ), .B(n36), .C(\regs_matrix[5][16] ), 
        .D(n44), .Y(n336) );
  NOR2X1 U345 ( .A(n337), .B(n336), .Y(n347) );
  NOR2X1 U346 ( .A(outreg_data[16]), .B(n37), .Y(n339) );
  NOR2X1 U347 ( .A(N13), .B(n339), .Y(n340) );
  OAI21X1 U348 ( .A(\regs_matrix[2][16] ), .B(n33), .C(n340), .Y(n345) );
  OAI22X1 U349 ( .A(\regs_matrix[6][16] ), .B(n41), .C(\regs_matrix[4][16] ), 
        .D(n48), .Y(n344) );
  NOR2X1 U350 ( .A(n345), .B(n344), .Y(n346) );
  AOI22X1 U351 ( .A(n349), .B(n348), .C(n347), .D(n346), .Y(n350) );
  INVX2 U352 ( .A(N13), .Y(n351) );
  INVX2 U353 ( .A(N10), .Y(n352) );
  INVX2 U354 ( .A(N11), .Y(n353) );
  INVX2 U355 ( .A(N12), .Y(n354) );
  INVX2 U356 ( .A(n69), .Y(r1_data[0]) );
  INVX2 U357 ( .A(n86), .Y(r1_data[1]) );
  INVX2 U358 ( .A(n103), .Y(r1_data[2]) );
  INVX2 U359 ( .A(n120), .Y(r1_data[3]) );
  INVX2 U360 ( .A(n137), .Y(r1_data[4]) );
  INVX2 U361 ( .A(n154), .Y(r1_data[5]) );
  INVX2 U362 ( .A(n171), .Y(r1_data[6]) );
  INVX2 U363 ( .A(n188), .Y(r1_data[7]) );
  INVX2 U364 ( .A(n205), .Y(r1_data[8]) );
  INVX2 U365 ( .A(n222), .Y(r1_data[9]) );
  INVX2 U366 ( .A(n239), .Y(r1_data[10]) );
  INVX2 U367 ( .A(n256), .Y(r1_data[11]) );
  INVX2 U368 ( .A(n273), .Y(r1_data[12]) );
  INVX2 U369 ( .A(n290), .Y(r1_data[13]) );
  INVX2 U370 ( .A(n307), .Y(r1_data[14]) );
  INVX2 U371 ( .A(n324), .Y(r1_data[15]) );
  INVX2 U372 ( .A(n350), .Y(r1_data[16]) );
  NOR2X1 U373 ( .A(n658), .B(N16), .Y(n357) );
  NAND2X1 U374 ( .A(n357), .B(N14), .Y(n639) );
  NOR2X1 U375 ( .A(N15), .B(N16), .Y(n358) );
  NAND2X1 U376 ( .A(n358), .B(N14), .Y(n638) );
  OAI22X1 U377 ( .A(\regs_matrix[11][0] ), .B(n639), .C(\regs_matrix[9][0] ), 
        .D(n638), .Y(n356) );
  NOR2X1 U378 ( .A(n659), .B(n658), .Y(n361) );
  NAND2X1 U379 ( .A(N14), .B(n361), .Y(n641) );
  NOR2X1 U380 ( .A(n659), .B(N15), .Y(n362) );
  NAND2X1 U381 ( .A(n362), .B(N14), .Y(n640) );
  OAI22X1 U382 ( .A(\regs_matrix[15][0] ), .B(n641), .C(\regs_matrix[13][0] ), 
        .D(n640), .Y(n355) );
  NOR2X1 U383 ( .A(n356), .B(n355), .Y(n374) );
  NAND2X1 U384 ( .A(n357), .B(n657), .Y(n647) );
  NAND2X1 U385 ( .A(n358), .B(n657), .Y(n644) );
  NOR2X1 U386 ( .A(\regs_matrix[8][0] ), .B(n644), .Y(n359) );
  NOR2X1 U387 ( .A(n660), .B(n359), .Y(n360) );
  OAI21X1 U388 ( .A(\regs_matrix[10][0] ), .B(n647), .C(n360), .Y(n364) );
  NAND2X1 U389 ( .A(n361), .B(n657), .Y(n649) );
  NAND2X1 U390 ( .A(n362), .B(n657), .Y(n648) );
  OAI22X1 U391 ( .A(\regs_matrix[14][0] ), .B(n649), .C(\regs_matrix[12][0] ), 
        .D(n648), .Y(n363) );
  NOR2X1 U392 ( .A(n364), .B(n363), .Y(n373) );
  OAI22X1 U393 ( .A(\regs_matrix[3][0] ), .B(n639), .C(\regs_matrix[1][0] ), 
        .D(n638), .Y(n366) );
  OAI22X1 U394 ( .A(\regs_matrix[7][0] ), .B(n641), .C(\regs_matrix[5][0] ), 
        .D(n640), .Y(n365) );
  NOR2X1 U395 ( .A(n366), .B(n365), .Y(n372) );
  NOR2X1 U396 ( .A(outreg_data[0]), .B(n644), .Y(n367) );
  NOR2X1 U397 ( .A(N17), .B(n367), .Y(n368) );
  OAI21X1 U398 ( .A(\regs_matrix[2][0] ), .B(n647), .C(n368), .Y(n370) );
  OAI22X1 U399 ( .A(\regs_matrix[6][0] ), .B(n649), .C(\regs_matrix[4][0] ), 
        .D(n648), .Y(n369) );
  NOR2X1 U400 ( .A(n370), .B(n369), .Y(n371) );
  AOI22X1 U401 ( .A(n374), .B(n373), .C(n372), .D(n371), .Y(n375) );
  OAI22X1 U402 ( .A(\regs_matrix[11][1] ), .B(n639), .C(\regs_matrix[9][1] ), 
        .D(n638), .Y(n377) );
  OAI22X1 U403 ( .A(\regs_matrix[15][1] ), .B(n641), .C(\regs_matrix[13][1] ), 
        .D(n640), .Y(n376) );
  NOR2X1 U404 ( .A(n377), .B(n376), .Y(n391) );
  NOR2X1 U405 ( .A(\regs_matrix[8][1] ), .B(n644), .Y(n378) );
  NOR2X1 U406 ( .A(n660), .B(n378), .Y(n379) );
  OAI21X1 U407 ( .A(\regs_matrix[10][1] ), .B(n647), .C(n379), .Y(n381) );
  OAI22X1 U408 ( .A(\regs_matrix[14][1] ), .B(n649), .C(\regs_matrix[12][1] ), 
        .D(n648), .Y(n380) );
  NOR2X1 U409 ( .A(n381), .B(n380), .Y(n390) );
  OAI22X1 U410 ( .A(\regs_matrix[3][1] ), .B(n639), .C(\regs_matrix[1][1] ), 
        .D(n638), .Y(n383) );
  OAI22X1 U411 ( .A(\regs_matrix[7][1] ), .B(n641), .C(\regs_matrix[5][1] ), 
        .D(n640), .Y(n382) );
  NOR2X1 U412 ( .A(n383), .B(n382), .Y(n389) );
  NOR2X1 U413 ( .A(outreg_data[1]), .B(n644), .Y(n384) );
  NOR2X1 U414 ( .A(N17), .B(n384), .Y(n385) );
  OAI21X1 U415 ( .A(\regs_matrix[2][1] ), .B(n647), .C(n385), .Y(n387) );
  OAI22X1 U416 ( .A(\regs_matrix[6][1] ), .B(n649), .C(\regs_matrix[4][1] ), 
        .D(n648), .Y(n386) );
  NOR2X1 U417 ( .A(n387), .B(n386), .Y(n388) );
  AOI22X1 U418 ( .A(n391), .B(n390), .C(n389), .D(n388), .Y(n392) );
  OAI22X1 U419 ( .A(\regs_matrix[11][2] ), .B(n639), .C(\regs_matrix[9][2] ), 
        .D(n638), .Y(n394) );
  OAI22X1 U420 ( .A(\regs_matrix[15][2] ), .B(n641), .C(\regs_matrix[13][2] ), 
        .D(n640), .Y(n393) );
  NOR2X1 U421 ( .A(n394), .B(n393), .Y(n408) );
  NOR2X1 U422 ( .A(\regs_matrix[8][2] ), .B(n644), .Y(n395) );
  NOR2X1 U423 ( .A(n660), .B(n395), .Y(n396) );
  OAI21X1 U424 ( .A(\regs_matrix[10][2] ), .B(n647), .C(n396), .Y(n398) );
  OAI22X1 U425 ( .A(\regs_matrix[14][2] ), .B(n649), .C(\regs_matrix[12][2] ), 
        .D(n648), .Y(n397) );
  NOR2X1 U426 ( .A(n398), .B(n397), .Y(n407) );
  OAI22X1 U427 ( .A(\regs_matrix[3][2] ), .B(n639), .C(\regs_matrix[1][2] ), 
        .D(n638), .Y(n400) );
  OAI22X1 U428 ( .A(\regs_matrix[7][2] ), .B(n641), .C(\regs_matrix[5][2] ), 
        .D(n640), .Y(n399) );
  NOR2X1 U429 ( .A(n400), .B(n399), .Y(n406) );
  NOR2X1 U430 ( .A(outreg_data[2]), .B(n644), .Y(n401) );
  NOR2X1 U431 ( .A(N17), .B(n401), .Y(n402) );
  OAI21X1 U432 ( .A(\regs_matrix[2][2] ), .B(n647), .C(n402), .Y(n404) );
  OAI22X1 U433 ( .A(\regs_matrix[6][2] ), .B(n649), .C(\regs_matrix[4][2] ), 
        .D(n648), .Y(n403) );
  NOR2X1 U434 ( .A(n404), .B(n403), .Y(n405) );
  AOI22X1 U435 ( .A(n408), .B(n407), .C(n406), .D(n405), .Y(n409) );
  OAI22X1 U436 ( .A(\regs_matrix[11][3] ), .B(n639), .C(\regs_matrix[9][3] ), 
        .D(n638), .Y(n411) );
  OAI22X1 U437 ( .A(\regs_matrix[15][3] ), .B(n641), .C(\regs_matrix[13][3] ), 
        .D(n640), .Y(n410) );
  NOR2X1 U438 ( .A(n411), .B(n410), .Y(n425) );
  NOR2X1 U439 ( .A(\regs_matrix[8][3] ), .B(n644), .Y(n412) );
  NOR2X1 U440 ( .A(n660), .B(n412), .Y(n413) );
  OAI21X1 U441 ( .A(\regs_matrix[10][3] ), .B(n647), .C(n413), .Y(n415) );
  OAI22X1 U442 ( .A(\regs_matrix[14][3] ), .B(n649), .C(\regs_matrix[12][3] ), 
        .D(n648), .Y(n414) );
  NOR2X1 U443 ( .A(n415), .B(n414), .Y(n424) );
  OAI22X1 U444 ( .A(\regs_matrix[3][3] ), .B(n639), .C(\regs_matrix[1][3] ), 
        .D(n638), .Y(n417) );
  OAI22X1 U445 ( .A(\regs_matrix[7][3] ), .B(n641), .C(\regs_matrix[5][3] ), 
        .D(n640), .Y(n416) );
  NOR2X1 U446 ( .A(n417), .B(n416), .Y(n423) );
  NOR2X1 U447 ( .A(outreg_data[3]), .B(n644), .Y(n418) );
  NOR2X1 U448 ( .A(N17), .B(n418), .Y(n419) );
  OAI21X1 U449 ( .A(\regs_matrix[2][3] ), .B(n647), .C(n419), .Y(n421) );
  OAI22X1 U450 ( .A(\regs_matrix[6][3] ), .B(n649), .C(\regs_matrix[4][3] ), 
        .D(n648), .Y(n420) );
  NOR2X1 U451 ( .A(n421), .B(n420), .Y(n422) );
  AOI22X1 U452 ( .A(n425), .B(n424), .C(n423), .D(n422), .Y(n426) );
  OAI22X1 U453 ( .A(\regs_matrix[11][4] ), .B(n39), .C(\regs_matrix[9][4] ), 
        .D(n638), .Y(n428) );
  OAI22X1 U454 ( .A(\regs_matrix[15][4] ), .B(n35), .C(\regs_matrix[13][4] ), 
        .D(n640), .Y(n427) );
  NOR2X1 U455 ( .A(n428), .B(n427), .Y(n442) );
  NOR2X1 U456 ( .A(\regs_matrix[8][4] ), .B(n644), .Y(n429) );
  NOR2X1 U457 ( .A(n660), .B(n429), .Y(n430) );
  OAI21X1 U458 ( .A(\regs_matrix[10][4] ), .B(n647), .C(n430), .Y(n432) );
  OAI22X1 U459 ( .A(\regs_matrix[14][4] ), .B(n45), .C(\regs_matrix[12][4] ), 
        .D(n648), .Y(n431) );
  NOR2X1 U460 ( .A(n432), .B(n431), .Y(n441) );
  OAI22X1 U461 ( .A(\regs_matrix[3][4] ), .B(n39), .C(\regs_matrix[1][4] ), 
        .D(n43), .Y(n434) );
  OAI22X1 U462 ( .A(\regs_matrix[7][4] ), .B(n35), .C(\regs_matrix[5][4] ), 
        .D(n46), .Y(n433) );
  NOR2X1 U463 ( .A(n434), .B(n433), .Y(n440) );
  NOR2X1 U464 ( .A(outreg_data[4]), .B(n644), .Y(n435) );
  NOR2X1 U465 ( .A(N17), .B(n435), .Y(n436) );
  OAI21X1 U466 ( .A(\regs_matrix[2][4] ), .B(n34), .C(n436), .Y(n438) );
  OAI22X1 U467 ( .A(\regs_matrix[6][4] ), .B(n45), .C(\regs_matrix[4][4] ), 
        .D(n42), .Y(n437) );
  NOR2X1 U468 ( .A(n438), .B(n437), .Y(n439) );
  AOI22X1 U469 ( .A(n442), .B(n441), .C(n440), .D(n439), .Y(n443) );
  OAI22X1 U470 ( .A(\regs_matrix[11][5] ), .B(n39), .C(\regs_matrix[9][5] ), 
        .D(n43), .Y(n445) );
  OAI22X1 U471 ( .A(\regs_matrix[15][5] ), .B(n35), .C(\regs_matrix[13][5] ), 
        .D(n46), .Y(n444) );
  NOR2X1 U472 ( .A(n445), .B(n444), .Y(n459) );
  NOR2X1 U473 ( .A(\regs_matrix[8][5] ), .B(n644), .Y(n446) );
  NOR2X1 U474 ( .A(n660), .B(n446), .Y(n447) );
  OAI21X1 U475 ( .A(\regs_matrix[10][5] ), .B(n34), .C(n447), .Y(n449) );
  OAI22X1 U476 ( .A(\regs_matrix[14][5] ), .B(n45), .C(\regs_matrix[12][5] ), 
        .D(n42), .Y(n448) );
  NOR2X1 U477 ( .A(n449), .B(n448), .Y(n458) );
  OAI22X1 U478 ( .A(\regs_matrix[3][5] ), .B(n39), .C(\regs_matrix[1][5] ), 
        .D(n43), .Y(n451) );
  OAI22X1 U479 ( .A(\regs_matrix[7][5] ), .B(n35), .C(\regs_matrix[5][5] ), 
        .D(n46), .Y(n450) );
  NOR2X1 U480 ( .A(n451), .B(n450), .Y(n457) );
  NOR2X1 U481 ( .A(outreg_data[5]), .B(n644), .Y(n452) );
  NOR2X1 U482 ( .A(N17), .B(n452), .Y(n453) );
  OAI21X1 U483 ( .A(\regs_matrix[2][5] ), .B(n34), .C(n453), .Y(n455) );
  OAI22X1 U484 ( .A(\regs_matrix[6][5] ), .B(n45), .C(\regs_matrix[4][5] ), 
        .D(n42), .Y(n454) );
  NOR2X1 U485 ( .A(n455), .B(n454), .Y(n456) );
  AOI22X1 U486 ( .A(n459), .B(n458), .C(n457), .D(n456), .Y(n460) );
  OAI22X1 U487 ( .A(\regs_matrix[11][6] ), .B(n39), .C(\regs_matrix[9][6] ), 
        .D(n43), .Y(n462) );
  OAI22X1 U488 ( .A(\regs_matrix[15][6] ), .B(n35), .C(\regs_matrix[13][6] ), 
        .D(n46), .Y(n461) );
  NOR2X1 U489 ( .A(n462), .B(n461), .Y(n476) );
  NOR2X1 U490 ( .A(\regs_matrix[8][6] ), .B(n644), .Y(n463) );
  NOR2X1 U491 ( .A(n660), .B(n463), .Y(n464) );
  OAI21X1 U492 ( .A(\regs_matrix[10][6] ), .B(n34), .C(n464), .Y(n466) );
  OAI22X1 U493 ( .A(\regs_matrix[14][6] ), .B(n45), .C(\regs_matrix[12][6] ), 
        .D(n42), .Y(n465) );
  NOR2X1 U494 ( .A(n466), .B(n465), .Y(n475) );
  OAI22X1 U495 ( .A(\regs_matrix[3][6] ), .B(n39), .C(\regs_matrix[1][6] ), 
        .D(n43), .Y(n468) );
  OAI22X1 U496 ( .A(\regs_matrix[7][6] ), .B(n35), .C(\regs_matrix[5][6] ), 
        .D(n46), .Y(n467) );
  NOR2X1 U497 ( .A(n468), .B(n467), .Y(n474) );
  NOR2X1 U498 ( .A(outreg_data[6]), .B(n38), .Y(n469) );
  NOR2X1 U499 ( .A(N17), .B(n469), .Y(n470) );
  OAI21X1 U500 ( .A(\regs_matrix[2][6] ), .B(n34), .C(n470), .Y(n472) );
  OAI22X1 U501 ( .A(\regs_matrix[6][6] ), .B(n45), .C(\regs_matrix[4][6] ), 
        .D(n42), .Y(n471) );
  NOR2X1 U502 ( .A(n472), .B(n471), .Y(n473) );
  AOI22X1 U503 ( .A(n476), .B(n475), .C(n474), .D(n473), .Y(n477) );
  OAI22X1 U504 ( .A(\regs_matrix[11][7] ), .B(n39), .C(\regs_matrix[9][7] ), 
        .D(n43), .Y(n479) );
  OAI22X1 U505 ( .A(\regs_matrix[15][7] ), .B(n35), .C(\regs_matrix[13][7] ), 
        .D(n46), .Y(n478) );
  NOR2X1 U506 ( .A(n479), .B(n478), .Y(n493) );
  NOR2X1 U507 ( .A(\regs_matrix[8][7] ), .B(n38), .Y(n480) );
  NOR2X1 U508 ( .A(n660), .B(n480), .Y(n481) );
  OAI21X1 U509 ( .A(\regs_matrix[10][7] ), .B(n34), .C(n481), .Y(n483) );
  OAI22X1 U510 ( .A(\regs_matrix[14][7] ), .B(n45), .C(\regs_matrix[12][7] ), 
        .D(n42), .Y(n482) );
  NOR2X1 U511 ( .A(n483), .B(n482), .Y(n492) );
  OAI22X1 U512 ( .A(\regs_matrix[3][7] ), .B(n39), .C(\regs_matrix[1][7] ), 
        .D(n43), .Y(n485) );
  OAI22X1 U513 ( .A(\regs_matrix[7][7] ), .B(n35), .C(\regs_matrix[5][7] ), 
        .D(n46), .Y(n484) );
  NOR2X1 U514 ( .A(n485), .B(n484), .Y(n491) );
  NOR2X1 U515 ( .A(outreg_data[7]), .B(n38), .Y(n486) );
  NOR2X1 U516 ( .A(N17), .B(n486), .Y(n487) );
  OAI21X1 U517 ( .A(\regs_matrix[2][7] ), .B(n34), .C(n487), .Y(n489) );
  OAI22X1 U518 ( .A(\regs_matrix[6][7] ), .B(n45), .C(\regs_matrix[4][7] ), 
        .D(n42), .Y(n488) );
  NOR2X1 U519 ( .A(n489), .B(n488), .Y(n490) );
  AOI22X1 U520 ( .A(n493), .B(n492), .C(n491), .D(n490), .Y(n494) );
  OAI22X1 U521 ( .A(\regs_matrix[11][8] ), .B(n39), .C(\regs_matrix[9][8] ), 
        .D(n43), .Y(n496) );
  OAI22X1 U522 ( .A(\regs_matrix[15][8] ), .B(n35), .C(\regs_matrix[13][8] ), 
        .D(n46), .Y(n495) );
  NOR2X1 U523 ( .A(n496), .B(n495), .Y(n510) );
  NOR2X1 U524 ( .A(\regs_matrix[8][8] ), .B(n38), .Y(n497) );
  NOR2X1 U525 ( .A(n660), .B(n497), .Y(n498) );
  OAI21X1 U526 ( .A(\regs_matrix[10][8] ), .B(n34), .C(n498), .Y(n500) );
  OAI22X1 U527 ( .A(\regs_matrix[14][8] ), .B(n45), .C(\regs_matrix[12][8] ), 
        .D(n42), .Y(n499) );
  NOR2X1 U528 ( .A(n500), .B(n499), .Y(n509) );
  OAI22X1 U529 ( .A(\regs_matrix[3][8] ), .B(n39), .C(\regs_matrix[1][8] ), 
        .D(n43), .Y(n502) );
  OAI22X1 U530 ( .A(\regs_matrix[7][8] ), .B(n35), .C(\regs_matrix[5][8] ), 
        .D(n46), .Y(n501) );
  NOR2X1 U531 ( .A(n502), .B(n501), .Y(n508) );
  NOR2X1 U532 ( .A(outreg_data[8]), .B(n38), .Y(n503) );
  NOR2X1 U533 ( .A(N17), .B(n503), .Y(n504) );
  OAI21X1 U534 ( .A(\regs_matrix[2][8] ), .B(n34), .C(n504), .Y(n506) );
  OAI22X1 U535 ( .A(\regs_matrix[6][8] ), .B(n45), .C(\regs_matrix[4][8] ), 
        .D(n42), .Y(n505) );
  NOR2X1 U536 ( .A(n506), .B(n505), .Y(n507) );
  AOI22X1 U537 ( .A(n510), .B(n509), .C(n508), .D(n507), .Y(n511) );
  OAI22X1 U538 ( .A(\regs_matrix[11][9] ), .B(n39), .C(\regs_matrix[9][9] ), 
        .D(n43), .Y(n513) );
  OAI22X1 U539 ( .A(\regs_matrix[15][9] ), .B(n35), .C(\regs_matrix[13][9] ), 
        .D(n46), .Y(n512) );
  NOR2X1 U540 ( .A(n513), .B(n512), .Y(n527) );
  NOR2X1 U541 ( .A(\regs_matrix[8][9] ), .B(n38), .Y(n514) );
  NOR2X1 U542 ( .A(n660), .B(n514), .Y(n515) );
  OAI21X1 U543 ( .A(\regs_matrix[10][9] ), .B(n34), .C(n515), .Y(n517) );
  OAI22X1 U544 ( .A(\regs_matrix[14][9] ), .B(n45), .C(\regs_matrix[12][9] ), 
        .D(n42), .Y(n516) );
  NOR2X1 U545 ( .A(n517), .B(n516), .Y(n526) );
  OAI22X1 U546 ( .A(\regs_matrix[3][9] ), .B(n39), .C(\regs_matrix[1][9] ), 
        .D(n43), .Y(n519) );
  OAI22X1 U547 ( .A(\regs_matrix[7][9] ), .B(n35), .C(\regs_matrix[5][9] ), 
        .D(n46), .Y(n518) );
  NOR2X1 U548 ( .A(n519), .B(n518), .Y(n525) );
  NOR2X1 U549 ( .A(outreg_data[9]), .B(n38), .Y(n520) );
  NOR2X1 U550 ( .A(N17), .B(n520), .Y(n521) );
  OAI21X1 U551 ( .A(\regs_matrix[2][9] ), .B(n34), .C(n521), .Y(n523) );
  OAI22X1 U552 ( .A(\regs_matrix[6][9] ), .B(n45), .C(\regs_matrix[4][9] ), 
        .D(n42), .Y(n522) );
  NOR2X1 U553 ( .A(n523), .B(n522), .Y(n524) );
  AOI22X1 U554 ( .A(n527), .B(n526), .C(n525), .D(n524), .Y(n528) );
  OAI22X1 U555 ( .A(\regs_matrix[11][10] ), .B(n39), .C(\regs_matrix[9][10] ), 
        .D(n43), .Y(n530) );
  OAI22X1 U556 ( .A(\regs_matrix[15][10] ), .B(n35), .C(\regs_matrix[13][10] ), 
        .D(n46), .Y(n529) );
  NOR2X1 U557 ( .A(n530), .B(n529), .Y(n544) );
  NOR2X1 U558 ( .A(\regs_matrix[8][10] ), .B(n38), .Y(n531) );
  NOR2X1 U559 ( .A(n660), .B(n531), .Y(n532) );
  OAI21X1 U560 ( .A(\regs_matrix[10][10] ), .B(n34), .C(n532), .Y(n534) );
  OAI22X1 U561 ( .A(\regs_matrix[14][10] ), .B(n45), .C(\regs_matrix[12][10] ), 
        .D(n42), .Y(n533) );
  NOR2X1 U562 ( .A(n534), .B(n533), .Y(n543) );
  OAI22X1 U563 ( .A(\regs_matrix[3][10] ), .B(n39), .C(\regs_matrix[1][10] ), 
        .D(n43), .Y(n536) );
  OAI22X1 U564 ( .A(\regs_matrix[7][10] ), .B(n35), .C(\regs_matrix[5][10] ), 
        .D(n46), .Y(n535) );
  NOR2X1 U565 ( .A(n536), .B(n535), .Y(n542) );
  NOR2X1 U566 ( .A(outreg_data[10]), .B(n38), .Y(n537) );
  NOR2X1 U567 ( .A(N17), .B(n537), .Y(n538) );
  OAI21X1 U568 ( .A(\regs_matrix[2][10] ), .B(n34), .C(n538), .Y(n540) );
  OAI22X1 U569 ( .A(\regs_matrix[6][10] ), .B(n45), .C(\regs_matrix[4][10] ), 
        .D(n42), .Y(n539) );
  NOR2X1 U570 ( .A(n540), .B(n539), .Y(n541) );
  AOI22X1 U571 ( .A(n544), .B(n543), .C(n542), .D(n541), .Y(n545) );
  OAI22X1 U572 ( .A(\regs_matrix[11][11] ), .B(n39), .C(\regs_matrix[9][11] ), 
        .D(n43), .Y(n547) );
  OAI22X1 U573 ( .A(\regs_matrix[15][11] ), .B(n35), .C(\regs_matrix[13][11] ), 
        .D(n46), .Y(n546) );
  NOR2X1 U574 ( .A(n547), .B(n546), .Y(n561) );
  NOR2X1 U575 ( .A(\regs_matrix[8][11] ), .B(n38), .Y(n548) );
  NOR2X1 U576 ( .A(n660), .B(n548), .Y(n549) );
  OAI21X1 U577 ( .A(\regs_matrix[10][11] ), .B(n34), .C(n549), .Y(n551) );
  OAI22X1 U578 ( .A(\regs_matrix[14][11] ), .B(n45), .C(\regs_matrix[12][11] ), 
        .D(n42), .Y(n550) );
  NOR2X1 U579 ( .A(n551), .B(n550), .Y(n560) );
  OAI22X1 U580 ( .A(\regs_matrix[3][11] ), .B(n39), .C(\regs_matrix[1][11] ), 
        .D(n43), .Y(n553) );
  OAI22X1 U581 ( .A(\regs_matrix[7][11] ), .B(n35), .C(\regs_matrix[5][11] ), 
        .D(n46), .Y(n552) );
  NOR2X1 U582 ( .A(n553), .B(n552), .Y(n559) );
  NOR2X1 U583 ( .A(outreg_data[11]), .B(n38), .Y(n554) );
  NOR2X1 U584 ( .A(N17), .B(n554), .Y(n555) );
  OAI21X1 U585 ( .A(\regs_matrix[2][11] ), .B(n34), .C(n555), .Y(n557) );
  OAI22X1 U586 ( .A(\regs_matrix[6][11] ), .B(n45), .C(\regs_matrix[4][11] ), 
        .D(n42), .Y(n556) );
  NOR2X1 U587 ( .A(n557), .B(n556), .Y(n558) );
  AOI22X1 U588 ( .A(n561), .B(n560), .C(n559), .D(n558), .Y(n562) );
  OAI22X1 U589 ( .A(\regs_matrix[11][12] ), .B(n39), .C(\regs_matrix[9][12] ), 
        .D(n43), .Y(n564) );
  OAI22X1 U590 ( .A(\regs_matrix[15][12] ), .B(n35), .C(\regs_matrix[13][12] ), 
        .D(n46), .Y(n563) );
  NOR2X1 U591 ( .A(n564), .B(n563), .Y(n578) );
  NOR2X1 U592 ( .A(\regs_matrix[8][12] ), .B(n38), .Y(n565) );
  NOR2X1 U593 ( .A(n660), .B(n565), .Y(n566) );
  OAI21X1 U594 ( .A(\regs_matrix[10][12] ), .B(n34), .C(n566), .Y(n568) );
  OAI22X1 U595 ( .A(\regs_matrix[14][12] ), .B(n45), .C(\regs_matrix[12][12] ), 
        .D(n42), .Y(n567) );
  NOR2X1 U596 ( .A(n568), .B(n567), .Y(n577) );
  OAI22X1 U597 ( .A(\regs_matrix[3][12] ), .B(n39), .C(\regs_matrix[1][12] ), 
        .D(n43), .Y(n570) );
  OAI22X1 U598 ( .A(\regs_matrix[7][12] ), .B(n35), .C(\regs_matrix[5][12] ), 
        .D(n46), .Y(n569) );
  NOR2X1 U599 ( .A(n570), .B(n569), .Y(n576) );
  NOR2X1 U600 ( .A(outreg_data[12]), .B(n38), .Y(n571) );
  NOR2X1 U601 ( .A(N17), .B(n571), .Y(n572) );
  OAI21X1 U602 ( .A(\regs_matrix[2][12] ), .B(n34), .C(n572), .Y(n574) );
  OAI22X1 U603 ( .A(\regs_matrix[6][12] ), .B(n45), .C(\regs_matrix[4][12] ), 
        .D(n42), .Y(n573) );
  NOR2X1 U604 ( .A(n574), .B(n573), .Y(n575) );
  AOI22X1 U605 ( .A(n578), .B(n577), .C(n576), .D(n575), .Y(n579) );
  OAI22X1 U606 ( .A(\regs_matrix[11][13] ), .B(n39), .C(\regs_matrix[9][13] ), 
        .D(n43), .Y(n581) );
  OAI22X1 U607 ( .A(\regs_matrix[15][13] ), .B(n35), .C(\regs_matrix[13][13] ), 
        .D(n46), .Y(n580) );
  NOR2X1 U608 ( .A(n581), .B(n580), .Y(n595) );
  NOR2X1 U609 ( .A(\regs_matrix[8][13] ), .B(n38), .Y(n582) );
  NOR2X1 U610 ( .A(n660), .B(n582), .Y(n583) );
  OAI21X1 U611 ( .A(\regs_matrix[10][13] ), .B(n34), .C(n583), .Y(n585) );
  OAI22X1 U612 ( .A(\regs_matrix[14][13] ), .B(n45), .C(\regs_matrix[12][13] ), 
        .D(n42), .Y(n584) );
  NOR2X1 U613 ( .A(n585), .B(n584), .Y(n594) );
  OAI22X1 U614 ( .A(\regs_matrix[3][13] ), .B(n39), .C(\regs_matrix[1][13] ), 
        .D(n43), .Y(n587) );
  OAI22X1 U615 ( .A(\regs_matrix[7][13] ), .B(n35), .C(\regs_matrix[5][13] ), 
        .D(n46), .Y(n586) );
  NOR2X1 U616 ( .A(n587), .B(n586), .Y(n593) );
  NOR2X1 U617 ( .A(outreg_data[13]), .B(n38), .Y(n588) );
  NOR2X1 U618 ( .A(N17), .B(n588), .Y(n589) );
  OAI21X1 U619 ( .A(\regs_matrix[2][13] ), .B(n34), .C(n589), .Y(n591) );
  OAI22X1 U620 ( .A(\regs_matrix[6][13] ), .B(n45), .C(\regs_matrix[4][13] ), 
        .D(n42), .Y(n590) );
  NOR2X1 U621 ( .A(n591), .B(n590), .Y(n592) );
  AOI22X1 U622 ( .A(n595), .B(n594), .C(n593), .D(n592), .Y(n596) );
  OAI22X1 U623 ( .A(\regs_matrix[11][14] ), .B(n39), .C(\regs_matrix[9][14] ), 
        .D(n43), .Y(n598) );
  OAI22X1 U624 ( .A(\regs_matrix[15][14] ), .B(n35), .C(\regs_matrix[13][14] ), 
        .D(n46), .Y(n597) );
  NOR2X1 U625 ( .A(n598), .B(n597), .Y(n612) );
  NOR2X1 U626 ( .A(\regs_matrix[8][14] ), .B(n38), .Y(n599) );
  NOR2X1 U627 ( .A(n660), .B(n599), .Y(n600) );
  OAI21X1 U628 ( .A(\regs_matrix[10][14] ), .B(n34), .C(n600), .Y(n602) );
  OAI22X1 U629 ( .A(\regs_matrix[14][14] ), .B(n45), .C(\regs_matrix[12][14] ), 
        .D(n42), .Y(n601) );
  NOR2X1 U630 ( .A(n602), .B(n601), .Y(n611) );
  OAI22X1 U631 ( .A(\regs_matrix[3][14] ), .B(n39), .C(\regs_matrix[1][14] ), 
        .D(n43), .Y(n604) );
  OAI22X1 U632 ( .A(\regs_matrix[7][14] ), .B(n35), .C(\regs_matrix[5][14] ), 
        .D(n46), .Y(n603) );
  NOR2X1 U633 ( .A(n604), .B(n603), .Y(n610) );
  NOR2X1 U634 ( .A(outreg_data[14]), .B(n38), .Y(n605) );
  NOR2X1 U635 ( .A(N17), .B(n605), .Y(n606) );
  OAI21X1 U636 ( .A(\regs_matrix[2][14] ), .B(n34), .C(n606), .Y(n608) );
  OAI22X1 U637 ( .A(\regs_matrix[6][14] ), .B(n45), .C(\regs_matrix[4][14] ), 
        .D(n42), .Y(n607) );
  NOR2X1 U638 ( .A(n608), .B(n607), .Y(n609) );
  AOI22X1 U639 ( .A(n612), .B(n611), .C(n610), .D(n609), .Y(n613) );
  OAI22X1 U640 ( .A(\regs_matrix[11][15] ), .B(n39), .C(\regs_matrix[9][15] ), 
        .D(n43), .Y(n615) );
  OAI22X1 U641 ( .A(\regs_matrix[15][15] ), .B(n35), .C(\regs_matrix[13][15] ), 
        .D(n46), .Y(n614) );
  NOR2X1 U642 ( .A(n615), .B(n614), .Y(n629) );
  NOR2X1 U643 ( .A(\regs_matrix[8][15] ), .B(n38), .Y(n616) );
  NOR2X1 U644 ( .A(n660), .B(n616), .Y(n617) );
  OAI21X1 U645 ( .A(\regs_matrix[10][15] ), .B(n34), .C(n617), .Y(n619) );
  OAI22X1 U646 ( .A(\regs_matrix[14][15] ), .B(n45), .C(\regs_matrix[12][15] ), 
        .D(n42), .Y(n618) );
  NOR2X1 U647 ( .A(n619), .B(n618), .Y(n628) );
  OAI22X1 U648 ( .A(\regs_matrix[3][15] ), .B(n39), .C(\regs_matrix[1][15] ), 
        .D(n43), .Y(n621) );
  OAI22X1 U649 ( .A(\regs_matrix[7][15] ), .B(n35), .C(\regs_matrix[5][15] ), 
        .D(n46), .Y(n620) );
  NOR2X1 U650 ( .A(n621), .B(n620), .Y(n627) );
  NOR2X1 U651 ( .A(outreg_data[15]), .B(n38), .Y(n622) );
  NOR2X1 U652 ( .A(N17), .B(n622), .Y(n623) );
  OAI21X1 U653 ( .A(\regs_matrix[2][15] ), .B(n34), .C(n623), .Y(n625) );
  OAI22X1 U654 ( .A(\regs_matrix[6][15] ), .B(n45), .C(\regs_matrix[4][15] ), 
        .D(n42), .Y(n624) );
  NOR2X1 U655 ( .A(n625), .B(n624), .Y(n626) );
  AOI22X1 U656 ( .A(n629), .B(n628), .C(n627), .D(n626), .Y(n630) );
  OAI22X1 U657 ( .A(\regs_matrix[13][16] ), .B(n46), .C(\regs_matrix[11][16] ), 
        .D(n639), .Y(n632) );
  OAI21X1 U658 ( .A(\regs_matrix[15][16] ), .B(n641), .C(N17), .Y(n631) );
  NOR2X1 U659 ( .A(n632), .B(n631), .Y(n655) );
  NOR2X1 U660 ( .A(\regs_matrix[8][16] ), .B(n38), .Y(n634) );
  NOR2X1 U661 ( .A(\regs_matrix[10][16] ), .B(n34), .Y(n633) );
  NOR2X1 U662 ( .A(n634), .B(n633), .Y(n635) );
  OAI21X1 U663 ( .A(\regs_matrix[12][16] ), .B(n42), .C(n635), .Y(n637) );
  OAI22X1 U664 ( .A(\regs_matrix[9][16] ), .B(n43), .C(\regs_matrix[14][16] ), 
        .D(n649), .Y(n636) );
  NOR2X1 U665 ( .A(n637), .B(n636), .Y(n654) );
  OAI22X1 U666 ( .A(\regs_matrix[3][16] ), .B(n39), .C(\regs_matrix[1][16] ), 
        .D(n43), .Y(n643) );
  OAI22X1 U667 ( .A(\regs_matrix[7][16] ), .B(n35), .C(\regs_matrix[5][16] ), 
        .D(n46), .Y(n642) );
  NOR2X1 U668 ( .A(n643), .B(n642), .Y(n653) );
  NOR2X1 U669 ( .A(outreg_data[16]), .B(n38), .Y(n645) );
  NOR2X1 U670 ( .A(N17), .B(n645), .Y(n646) );
  OAI21X1 U671 ( .A(\regs_matrix[2][16] ), .B(n34), .C(n646), .Y(n651) );
  OAI22X1 U672 ( .A(\regs_matrix[6][16] ), .B(n45), .C(\regs_matrix[4][16] ), 
        .D(n42), .Y(n650) );
  NOR2X1 U673 ( .A(n651), .B(n650), .Y(n652) );
  AOI22X1 U674 ( .A(n655), .B(n654), .C(n653), .D(n652), .Y(n656) );
  INVX2 U675 ( .A(N14), .Y(n657) );
  INVX2 U676 ( .A(N15), .Y(n658) );
  INVX2 U677 ( .A(N16), .Y(n659) );
  INVX2 U678 ( .A(N17), .Y(n660) );
  INVX2 U679 ( .A(n375), .Y(r2_data[0]) );
  INVX2 U680 ( .A(n392), .Y(r2_data[1]) );
  INVX2 U681 ( .A(n409), .Y(r2_data[2]) );
  INVX2 U682 ( .A(n426), .Y(r2_data[3]) );
  INVX2 U683 ( .A(n443), .Y(r2_data[4]) );
  INVX2 U684 ( .A(n460), .Y(r2_data[5]) );
  INVX2 U685 ( .A(n477), .Y(r2_data[6]) );
  INVX2 U686 ( .A(n494), .Y(r2_data[7]) );
  INVX2 U687 ( .A(n511), .Y(r2_data[8]) );
  INVX2 U688 ( .A(n528), .Y(r2_data[9]) );
  INVX2 U689 ( .A(n545), .Y(r2_data[10]) );
  INVX2 U690 ( .A(n562), .Y(r2_data[11]) );
  INVX2 U691 ( .A(n579), .Y(r2_data[12]) );
  INVX2 U692 ( .A(n596), .Y(r2_data[13]) );
  INVX2 U693 ( .A(n613), .Y(r2_data[14]) );
  INVX2 U694 ( .A(n630), .Y(r2_data[15]) );
  INVX2 U695 ( .A(n656), .Y(r2_data[16]) );
  NAND3X1 U696 ( .A(w_en), .B(n669), .C(w_sel[0]), .Y(n664) );
  NAND2X1 U697 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n665) );
  NAND2X1 U698 ( .A(w_sel[2]), .B(n670), .Y(n667) );
  NAND3X1 U699 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n661) );
  NAND2X1 U700 ( .A(w_sel[1]), .B(n671), .Y(n668) );
  NAND3X1 U701 ( .A(w_en), .B(n672), .C(w_sel[3]), .Y(n663) );
  NAND3X1 U702 ( .A(n672), .B(n669), .C(w_en), .Y(n666) );
  INVX1 U703 ( .A(w_sel[3]), .Y(n669) );
  INVX1 U704 ( .A(w_sel[0]), .Y(n672) );
  NAND2X1 U705 ( .A(n670), .B(n671), .Y(n662) );
  INVX1 U706 ( .A(w_sel[2]), .Y(n671) );
  INVX1 U707 ( .A(w_sel[1]), .Y(n670) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data({dest_data[16], n12, n14, n16, 
        n18, n20, n22, n2, n4, n6, n8, n10, n23, n24, n25, n26, n27}), 
        .r1_data(src1_data), .r2_data(src2_data), .outreg_data(outreg_data) );
  INVX1 U2 ( .A(dest_data[9]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX1 U4 ( .A(dest_data[8]), .Y(n3) );
  INVX2 U5 ( .A(n3), .Y(n4) );
  INVX1 U6 ( .A(dest_data[7]), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n6) );
  INVX1 U8 ( .A(dest_data[6]), .Y(n7) );
  INVX2 U9 ( .A(n7), .Y(n8) );
  INVX1 U10 ( .A(dest_data[5]), .Y(n9) );
  INVX2 U11 ( .A(n9), .Y(n10) );
  INVX1 U12 ( .A(dest_data[15]), .Y(n11) );
  INVX2 U13 ( .A(n11), .Y(n12) );
  INVX1 U14 ( .A(dest_data[14]), .Y(n13) );
  INVX2 U15 ( .A(n13), .Y(n14) );
  INVX1 U16 ( .A(dest_data[13]), .Y(n15) );
  INVX2 U17 ( .A(n15), .Y(n16) );
  INVX1 U18 ( .A(dest_data[12]), .Y(n17) );
  INVX2 U19 ( .A(n17), .Y(n18) );
  INVX1 U20 ( .A(dest_data[11]), .Y(n19) );
  INVX2 U21 ( .A(n19), .Y(n20) );
  INVX1 U22 ( .A(dest_data[10]), .Y(n21) );
  INVX2 U23 ( .A(n21), .Y(n22) );
  BUFX2 U24 ( .A(dest_data[4]), .Y(n23) );
  BUFX2 U25 ( .A(dest_data[3]), .Y(n24) );
  BUFX2 U26 ( .A(dest_data[2]), .Y(n25) );
  BUFX2 U27 ( .A(dest_data[1]), .Y(n26) );
  BUFX2 U28 ( .A(dest_data[0]), .Y(n27) );
  AND2X2 U29 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  AND2X2 U30 ( .A(w_data_sel[0]), .B(n30), .Y(n32) );
  INVX2 U31 ( .A(w_data_sel[1]), .Y(n30) );
  BUFX2 U32 ( .A(n33), .Y(n28) );
  OAI21X1 U33 ( .A(n29), .B(n30), .C(n31), .Y(dest_data[9]) );
  AOI22X1 U34 ( .A(ext_data2[9]), .B(n32), .C(ext_data1[9]), .D(n28), .Y(n31)
         );
  INVX1 U35 ( .A(alu_result[9]), .Y(n29) );
  OAI21X1 U36 ( .A(n30), .B(n34), .C(n35), .Y(dest_data[8]) );
  AOI22X1 U37 ( .A(ext_data2[8]), .B(n32), .C(ext_data1[8]), .D(n28), .Y(n35)
         );
  INVX1 U38 ( .A(alu_result[8]), .Y(n34) );
  OAI21X1 U39 ( .A(n30), .B(n36), .C(n37), .Y(dest_data[7]) );
  AOI22X1 U40 ( .A(ext_data2[7]), .B(n32), .C(ext_data1[7]), .D(n28), .Y(n37)
         );
  INVX1 U41 ( .A(alu_result[7]), .Y(n36) );
  OAI21X1 U42 ( .A(n30), .B(n38), .C(n39), .Y(dest_data[6]) );
  AOI22X1 U43 ( .A(ext_data2[6]), .B(n32), .C(ext_data1[6]), .D(n28), .Y(n39)
         );
  INVX1 U44 ( .A(alu_result[6]), .Y(n38) );
  OAI21X1 U45 ( .A(n30), .B(n40), .C(n41), .Y(dest_data[5]) );
  AOI22X1 U46 ( .A(ext_data2[5]), .B(n32), .C(ext_data1[5]), .D(n28), .Y(n41)
         );
  INVX1 U47 ( .A(alu_result[5]), .Y(n40) );
  OAI21X1 U48 ( .A(n30), .B(n42), .C(n43), .Y(dest_data[4]) );
  AOI22X1 U49 ( .A(ext_data2[4]), .B(n32), .C(ext_data1[4]), .D(n28), .Y(n43)
         );
  INVX1 U50 ( .A(alu_result[4]), .Y(n42) );
  OAI21X1 U51 ( .A(n30), .B(n44), .C(n45), .Y(dest_data[3]) );
  AOI22X1 U52 ( .A(ext_data2[3]), .B(n32), .C(ext_data1[3]), .D(n28), .Y(n45)
         );
  INVX1 U53 ( .A(alu_result[3]), .Y(n44) );
  OAI21X1 U54 ( .A(n30), .B(n46), .C(n47), .Y(dest_data[2]) );
  AOI22X1 U55 ( .A(ext_data2[2]), .B(n32), .C(ext_data1[2]), .D(n28), .Y(n47)
         );
  INVX1 U56 ( .A(alu_result[2]), .Y(n46) );
  OAI21X1 U57 ( .A(n30), .B(n48), .C(n49), .Y(dest_data[1]) );
  AOI22X1 U58 ( .A(ext_data2[1]), .B(n32), .C(ext_data1[1]), .D(n28), .Y(n49)
         );
  INVX1 U59 ( .A(alu_result[1]), .Y(n48) );
  OAI21X1 U60 ( .A(n30), .B(n50), .C(n51), .Y(dest_data[15]) );
  AOI22X1 U61 ( .A(ext_data2[15]), .B(n32), .C(ext_data1[15]), .D(n28), .Y(n51) );
  INVX1 U62 ( .A(alu_result[15]), .Y(n50) );
  OAI21X1 U63 ( .A(n30), .B(n52), .C(n53), .Y(dest_data[14]) );
  AOI22X1 U64 ( .A(ext_data2[14]), .B(n32), .C(ext_data1[14]), .D(n28), .Y(n53) );
  INVX1 U65 ( .A(alu_result[14]), .Y(n52) );
  OAI21X1 U66 ( .A(n30), .B(n54), .C(n55), .Y(dest_data[13]) );
  AOI22X1 U67 ( .A(ext_data2[13]), .B(n32), .C(ext_data1[13]), .D(n28), .Y(n55) );
  INVX1 U68 ( .A(alu_result[13]), .Y(n54) );
  OAI21X1 U69 ( .A(n30), .B(n56), .C(n57), .Y(dest_data[12]) );
  AOI22X1 U70 ( .A(ext_data2[12]), .B(n32), .C(ext_data1[12]), .D(n28), .Y(n57) );
  INVX1 U71 ( .A(alu_result[12]), .Y(n56) );
  OAI21X1 U72 ( .A(n30), .B(n58), .C(n59), .Y(dest_data[11]) );
  AOI22X1 U73 ( .A(ext_data2[11]), .B(n32), .C(ext_data1[11]), .D(n28), .Y(n59) );
  INVX1 U74 ( .A(alu_result[11]), .Y(n58) );
  OAI21X1 U75 ( .A(n30), .B(n60), .C(n61), .Y(dest_data[10]) );
  AOI22X1 U76 ( .A(ext_data2[10]), .B(n32), .C(ext_data1[10]), .D(n28), .Y(n61) );
  INVX1 U77 ( .A(alu_result[10]), .Y(n60) );
  OAI21X1 U78 ( .A(n30), .B(n62), .C(n63), .Y(dest_data[0]) );
  AOI22X1 U79 ( .A(ext_data2[0]), .B(n32), .C(ext_data1[0]), .D(n28), .Y(n63)
         );
  NOR2X1 U80 ( .A(w_data_sel[0]), .B(w_data_sel[1]), .Y(n33) );
  INVX1 U81 ( .A(alu_result[0]), .Y(n62) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35;
  assign out[0] = N2;
  assign N2 = in[0];

  XNOR2X1 U2 ( .A(in[15]), .B(n1), .Y(out[15]) );
  OAI21X1 U3 ( .A(in[14]), .B(n2), .C(in[16]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(n2) );
  XOR2X1 U5 ( .A(in[14]), .B(n4), .Y(out[14]) );
  NOR2X1 U6 ( .A(n3), .B(n5), .Y(n4) );
  NOR2X1 U7 ( .A(n6), .B(in[13]), .Y(n3) );
  XNOR2X1 U8 ( .A(in[13]), .B(n7), .Y(out[13]) );
  NAND2X1 U9 ( .A(in[16]), .B(n6), .Y(n7) );
  NAND2X1 U10 ( .A(n8), .B(n9), .Y(n6) );
  XNOR2X1 U11 ( .A(n9), .B(n10), .Y(out[12]) );
  NOR2X1 U12 ( .A(n8), .B(n5), .Y(n10) );
  NOR2X1 U13 ( .A(n11), .B(in[11]), .Y(n8) );
  INVX1 U14 ( .A(in[12]), .Y(n9) );
  XNOR2X1 U15 ( .A(in[11]), .B(n12), .Y(out[11]) );
  NAND2X1 U16 ( .A(in[16]), .B(n11), .Y(n12) );
  NAND2X1 U17 ( .A(n13), .B(n14), .Y(n11) );
  XNOR2X1 U18 ( .A(n14), .B(n15), .Y(out[10]) );
  NOR2X1 U19 ( .A(n13), .B(n5), .Y(n15) );
  NOR2X1 U20 ( .A(n16), .B(in[9]), .Y(n13) );
  INVX1 U21 ( .A(in[10]), .Y(n14) );
  XNOR2X1 U22 ( .A(in[9]), .B(n17), .Y(out[9]) );
  NAND2X1 U23 ( .A(in[16]), .B(n16), .Y(n17) );
  NAND2X1 U24 ( .A(n18), .B(n19), .Y(n16) );
  XNOR2X1 U25 ( .A(n19), .B(n20), .Y(out[8]) );
  NOR2X1 U26 ( .A(n18), .B(n5), .Y(n20) );
  NOR2X1 U27 ( .A(n21), .B(in[7]), .Y(n18) );
  INVX1 U28 ( .A(in[8]), .Y(n19) );
  XNOR2X1 U29 ( .A(in[7]), .B(n22), .Y(out[7]) );
  NAND2X1 U30 ( .A(in[16]), .B(n21), .Y(n22) );
  NAND2X1 U31 ( .A(n23), .B(n24), .Y(n21) );
  XNOR2X1 U32 ( .A(n24), .B(n25), .Y(out[6]) );
  NOR2X1 U33 ( .A(n23), .B(n5), .Y(n25) );
  NOR2X1 U34 ( .A(n26), .B(in[5]), .Y(n23) );
  INVX1 U35 ( .A(in[6]), .Y(n24) );
  XNOR2X1 U36 ( .A(in[5]), .B(n27), .Y(out[5]) );
  NAND2X1 U37 ( .A(in[16]), .B(n26), .Y(n27) );
  NAND2X1 U38 ( .A(n28), .B(n29), .Y(n26) );
  XNOR2X1 U39 ( .A(n29), .B(n30), .Y(out[4]) );
  NOR2X1 U40 ( .A(n28), .B(n5), .Y(n30) );
  INVX1 U41 ( .A(in[16]), .Y(n5) );
  NOR2X1 U42 ( .A(n31), .B(in[3]), .Y(n28) );
  INVX1 U43 ( .A(in[4]), .Y(n29) );
  XNOR2X1 U44 ( .A(in[3]), .B(n32), .Y(out[3]) );
  NAND2X1 U45 ( .A(in[16]), .B(n31), .Y(n32) );
  OR2X1 U46 ( .A(n33), .B(in[2]), .Y(n31) );
  XNOR2X1 U47 ( .A(in[2]), .B(n34), .Y(out[2]) );
  NAND2X1 U48 ( .A(in[16]), .B(n33), .Y(n34) );
  OR2X1 U49 ( .A(in[1]), .B(N2), .Y(n33) );
  XNOR2X1 U50 ( .A(in[1]), .B(n35), .Y(out[1]) );
  NAND2X1 U51 ( .A(N2), .B(in[16]), .Y(n35) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, load_coeff, 
        data_ready, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, load_coeff, data_ready;
  output one_k_samples, modwait, err;
  wire   overflow, cnt_up, clear;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] result;
  wire   SYNOPSYS_UNCONNECTED__0;

  controller A1 ( .clk(clk), .n_rst(n_reset), .dr(data_ready), .lc(load_coeff), 
        .overflow(overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), 
        .op(op), .src1({SYNOPSYS_UNCONNECTED__0, src1[2:0]}), .src2(src2), 
        .dest(dest), .err(err) );
  counter A2 ( .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), 
        .one_k_samples(one_k_samples) );
  datapath A3 ( .clk(clk), .n_reset(n_reset), .op(op), .src1({1'b0, src1[2:0]}), .src2(src2), .dest(dest), .ext_data1(sample_data), .ext_data2(
        fir_coefficient), .outreg_data(result), .overflow(overflow) );
  magnitude A4 ( .in(result), .out(fir_out) );
endmodule


module ahb_lite_fir_filter ( clk, n_rst, hsel, haddr, hsize, htrans, hwrite, 
        hwdata, hrdata, hresp );
  input [3:0] haddr;
  input [1:0] htrans;
  input [15:0] hwdata;
  output [15:0] hrdata;
  input clk, n_rst, hsel, hsize, hwrite;
  output hresp;
  wire   data_ready, new_coeff_set, modwait, err, load_coeff;
  wire   [1:0] set;
  wire   [15:0] sample_data;
  wire   [1:0] coefficient_num;
  wire   [15:0] fir_coefficient;
  wire   [15:0] fir_out;

  ahb_lite_slave AHB ( .clk(clk), .n_rst(n_rst), .set(set), .sample_data(
        sample_data), .data_ready(data_ready), .new_coefficient_set(
        new_coeff_set), .coefficient_num(coefficient_num), .fir_coefficient(
        fir_coefficient), .modwait(modwait), .fir_out(fir_out), .err(err), 
        .hsel(hsel), .haddr(haddr), .hsize(hsize), .htrans(htrans), .hwrite(
        hwrite), .hwdata(hwdata), .hrdata(hrdata), .hresp(hresp) );
  coefficient_loader LC ( .clk(clk), .n_reset(n_rst), .new_coefficient_set(
        new_coeff_set), .modwait(modwait), .load_coeff(load_coeff), 
        .coefficient_num(coefficient_num), .set(set) );
  fir_filter FIR ( .clk(clk), .n_reset(n_rst), .sample_data(sample_data), 
        .fir_coefficient(fir_coefficient), .load_coeff(load_coeff), 
        .data_ready(data_ready), .modwait(modwait), .fir_out(fir_out), .err(
        err) );
endmodule

