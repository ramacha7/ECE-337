/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 30 22:38:36 2020
/////////////////////////////////////////////////////////////


module rcu ( clk, n_rst, d_edge, eop, shift_enable, rcv_data, byte_received, 
        count, rcving, w_enable, r_error, clear, PID, start );
  input [7:0] rcv_data;
  input [3:0] count;
  output [3:0] PID;
  input clk, n_rst, d_edge, eop, shift_enable, byte_received;
  output rcving, w_enable, r_error, clear, start;
  wire   n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265;
  wire   [4:0] state;

  DFFSR \state_reg[0]  ( .D(n157), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[2]  ( .D(n154), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(n155), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR \state_reg[3]  ( .D(n156), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3]) );
  DFFSR start_reg ( .D(n153), .CLK(clk), .R(n_rst), .S(1'b1), .Q(start) );
  DFFSR rcving_reg ( .D(n152), .CLK(clk), .R(n_rst), .S(1'b1), .Q(rcving) );
  DFFSR w_enable_reg ( .D(n151), .CLK(clk), .R(n_rst), .S(1'b1), .Q(w_enable)
         );
  DFFSR r_error_reg ( .D(n150), .CLK(clk), .R(n_rst), .S(1'b1), .Q(r_error) );
  DFFSR clear_reg ( .D(n149), .CLK(clk), .R(n_rst), .S(1'b1), .Q(clear) );
  DFFSR \PID_reg[3]  ( .D(n148), .CLK(clk), .R(1'b1), .S(n_rst), .Q(PID[3]) );
  DFFSR \PID_reg[2]  ( .D(n147), .CLK(clk), .R(1'b1), .S(n_rst), .Q(PID[2]) );
  DFFSR \PID_reg[1]  ( .D(n146), .CLK(clk), .R(1'b1), .S(n_rst), .Q(PID[1]) );
  DFFSR \PID_reg[0]  ( .D(n145), .CLK(clk), .R(1'b1), .S(n_rst), .Q(PID[0]) );
  NAND3X1 U161 ( .A(n158), .B(n159), .C(n160), .Y(n157) );
  AOI21X1 U162 ( .A(n161), .B(n162), .C(n163), .Y(n160) );
  OAI21X1 U163 ( .A(n164), .B(n165), .C(n166), .Y(n163) );
  NAND3X1 U164 ( .A(n167), .B(n168), .C(n169), .Y(n156) );
  INVX1 U165 ( .A(n170), .Y(n169) );
  AOI21X1 U166 ( .A(n171), .B(n172), .C(n173), .Y(n155) );
  NOR2X1 U167 ( .A(n174), .B(n175), .Y(n172) );
  OAI22X1 U168 ( .A(d_edge), .B(n166), .C(n176), .D(n177), .Y(n175) );
  OAI21X1 U169 ( .A(n178), .B(n164), .C(n179), .Y(n174) );
  NOR2X1 U170 ( .A(n180), .B(n181), .Y(n171) );
  OAI21X1 U171 ( .A(n182), .B(n183), .C(n159), .Y(n181) );
  AOI21X1 U172 ( .A(n177), .B(n184), .C(n185), .Y(n159) );
  INVX1 U173 ( .A(n186), .Y(n184) );
  MUX2X1 U174 ( .B(n187), .A(n188), .S(byte_received), .Y(n180) );
  OR2X1 U175 ( .A(n189), .B(n190), .Y(n154) );
  OAI21X1 U176 ( .A(n191), .B(n168), .C(n192), .Y(n190) );
  INVX1 U177 ( .A(n193), .Y(n191) );
  OAI22X1 U178 ( .A(n186), .B(n177), .C(n162), .D(n187), .Y(n189) );
  NAND2X1 U179 ( .A(n194), .B(n195), .Y(n153) );
  AOI21X1 U180 ( .A(n196), .B(n177), .C(n197), .Y(n195) );
  AOI22X1 U181 ( .A(byte_received), .B(n198), .C(start), .D(n199), .Y(n194) );
  OAI21X1 U182 ( .A(byte_received), .B(n200), .C(n201), .Y(n199) );
  NAND3X1 U183 ( .A(n202), .B(n203), .C(n204), .Y(n201) );
  AOI21X1 U184 ( .A(n198), .B(n182), .C(n205), .Y(n200) );
  NAND2X1 U185 ( .A(n206), .B(n187), .Y(n205) );
  INVX1 U186 ( .A(n207), .Y(n152) );
  MUX2X1 U187 ( .B(n208), .A(rcving), .S(n173), .Y(n207) );
  NAND3X1 U188 ( .A(n209), .B(n168), .C(n210), .Y(n208) );
  NOR2X1 U189 ( .A(n161), .B(n211), .Y(n210) );
  OAI21X1 U190 ( .A(n203), .B(n166), .C(n158), .Y(n211) );
  INVX1 U191 ( .A(n212), .Y(n158) );
  NAND3X1 U192 ( .A(n213), .B(n179), .C(n214), .Y(n212) );
  AOI22X1 U193 ( .A(n215), .B(d_edge), .C(n216), .D(n164), .Y(n214) );
  INVX1 U194 ( .A(n178), .Y(n216) );
  AND2X1 U195 ( .A(n202), .B(n204), .Y(n215) );
  NOR2X1 U196 ( .A(n197), .B(n196), .Y(n213) );
  INVX1 U197 ( .A(n217), .Y(n197) );
  INVX1 U198 ( .A(d_edge), .Y(n203) );
  NAND2X1 U199 ( .A(n188), .B(n187), .Y(n161) );
  NAND3X1 U200 ( .A(state[0]), .B(state[1]), .C(n204), .Y(n187) );
  NOR2X1 U201 ( .A(n198), .B(n218), .Y(n188) );
  INVX1 U202 ( .A(n183), .Y(n198) );
  AND2X1 U203 ( .A(n165), .B(n186), .Y(n209) );
  OAI21X1 U204 ( .A(n183), .B(n162), .C(n219), .Y(n151) );
  NAND2X1 U205 ( .A(w_enable), .B(n173), .Y(n219) );
  NAND2X1 U206 ( .A(n220), .B(n167), .Y(n150) );
  INVX1 U207 ( .A(n221), .Y(n167) );
  NAND3X1 U208 ( .A(n222), .B(n186), .C(n223), .Y(n221) );
  INVX1 U209 ( .A(n224), .Y(n223) );
  NAND3X1 U210 ( .A(state[0]), .B(state[1]), .C(n225), .Y(n186) );
  INVX1 U211 ( .A(n226), .Y(n225) );
  OAI21X1 U212 ( .A(n227), .B(n228), .C(n229), .Y(n222) );
  INVX1 U213 ( .A(n179), .Y(n229) );
  NAND3X1 U214 ( .A(rcv_data[7]), .B(n230), .C(n231), .Y(n228) );
  INVX1 U215 ( .A(rcv_data[0]), .Y(n230) );
  NAND2X1 U216 ( .A(n232), .B(n233), .Y(n227) );
  NOR2X1 U217 ( .A(rcv_data[6]), .B(rcv_data[5]), .Y(n233) );
  NOR2X1 U218 ( .A(rcv_data[4]), .B(rcv_data[3]), .Y(n232) );
  AOI22X1 U219 ( .A(n234), .B(n193), .C(r_error), .D(n173), .Y(n220) );
  NAND3X1 U220 ( .A(count[0]), .B(n235), .C(n236), .Y(n193) );
  NOR2X1 U221 ( .A(count[3]), .B(count[2]), .Y(n236) );
  INVX1 U222 ( .A(count[1]), .Y(n235) );
  INVX1 U223 ( .A(n168), .Y(n234) );
  OAI21X1 U224 ( .A(n178), .B(n164), .C(n237), .Y(n149) );
  NAND2X1 U225 ( .A(clear), .B(n173), .Y(n237) );
  INVX1 U226 ( .A(n238), .Y(n173) );
  NAND3X1 U227 ( .A(n177), .B(n162), .C(n239), .Y(n238) );
  NOR2X1 U228 ( .A(n182), .B(n183), .Y(n239) );
  INVX1 U229 ( .A(eop), .Y(n182) );
  NAND2X1 U230 ( .A(shift_enable), .B(eop), .Y(n177) );
  INVX1 U231 ( .A(shift_enable), .Y(n164) );
  MUX2X1 U232 ( .B(n240), .A(n241), .S(n242), .Y(n148) );
  INVX1 U233 ( .A(PID[3]), .Y(n241) );
  AND2X1 U234 ( .A(n243), .B(n244), .Y(n240) );
  MUX2X1 U235 ( .B(n244), .A(n245), .S(n242), .Y(n147) );
  INVX1 U236 ( .A(PID[2]), .Y(n245) );
  NOR2X1 U237 ( .A(n246), .B(n247), .Y(n244) );
  OAI21X1 U238 ( .A(rcv_data[1]), .B(rcv_data[0]), .C(n248), .Y(n247) );
  INVX1 U239 ( .A(rcv_data[2]), .Y(n248) );
  INVX1 U240 ( .A(n249), .Y(n146) );
  MUX2X1 U241 ( .B(n250), .A(PID[1]), .S(n242), .Y(n249) );
  NAND3X1 U242 ( .A(rcv_data[0]), .B(n251), .C(n231), .Y(n250) );
  NOR2X1 U243 ( .A(rcv_data[2]), .B(rcv_data[1]), .Y(n231) );
  INVX1 U244 ( .A(n252), .Y(n145) );
  MUX2X1 U245 ( .B(n253), .A(PID[0]), .S(n242), .Y(n252) );
  NAND3X1 U246 ( .A(n168), .B(n226), .C(n192), .Y(n242) );
  INVX1 U247 ( .A(n254), .Y(n192) );
  NAND3X1 U248 ( .A(n217), .B(n183), .C(n255), .Y(n254) );
  NOR2X1 U249 ( .A(n196), .B(n224), .Y(n255) );
  OAI21X1 U250 ( .A(d_edge), .B(n166), .C(n256), .Y(n224) );
  AOI21X1 U251 ( .A(state[2]), .B(n170), .C(n185), .Y(n256) );
  NOR2X1 U252 ( .A(n257), .B(state[0]), .Y(n185) );
  NAND2X1 U253 ( .A(n178), .B(n165), .Y(n170) );
  NAND2X1 U254 ( .A(n202), .B(state[3]), .Y(n165) );
  NAND3X1 U255 ( .A(state[3]), .B(n258), .C(state[0]), .Y(n178) );
  INVX1 U256 ( .A(n259), .Y(n166) );
  INVX1 U257 ( .A(n176), .Y(n196) );
  NAND3X1 U258 ( .A(state[1]), .B(n260), .C(n261), .Y(n176) );
  NAND3X1 U259 ( .A(state[0]), .B(n258), .C(n261), .Y(n183) );
  NAND2X1 U260 ( .A(n202), .B(n261), .Y(n217) );
  NAND2X1 U261 ( .A(state[3]), .B(n262), .Y(n226) );
  NAND3X1 U262 ( .A(state[0]), .B(state[1]), .C(n261), .Y(n168) );
  NOR2X1 U263 ( .A(n262), .B(state[3]), .Y(n261) );
  INVX1 U264 ( .A(state[2]), .Y(n262) );
  NAND3X1 U265 ( .A(rcv_data[1]), .B(n251), .C(n263), .Y(n253) );
  AOI21X1 U266 ( .A(rcv_data[2]), .B(n243), .C(rcv_data[0]), .Y(n263) );
  INVX1 U267 ( .A(rcv_data[3]), .Y(n243) );
  INVX1 U268 ( .A(n246), .Y(n251) );
  NAND3X1 U269 ( .A(n264), .B(n179), .C(n265), .Y(n246) );
  NOR2X1 U270 ( .A(n218), .B(n162), .Y(n265) );
  INVX1 U271 ( .A(byte_received), .Y(n162) );
  INVX1 U272 ( .A(n206), .Y(n218) );
  NAND3X1 U273 ( .A(state[0]), .B(n258), .C(n204), .Y(n206) );
  INVX1 U274 ( .A(state[1]), .Y(n258) );
  NAND3X1 U275 ( .A(state[1]), .B(n260), .C(n204), .Y(n179) );
  NOR2X1 U276 ( .A(state[3]), .B(state[2]), .Y(n204) );
  NOR2X1 U277 ( .A(n202), .B(n259), .Y(n264) );
  NOR2X1 U278 ( .A(n260), .B(n257), .Y(n259) );
  NAND3X1 U279 ( .A(state[2]), .B(state[1]), .C(state[3]), .Y(n257) );
  INVX1 U280 ( .A(state[0]), .Y(n260) );
  NOR2X1 U281 ( .A(state[0]), .B(state[1]), .Y(n202) );
endmodule

