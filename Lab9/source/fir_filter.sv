// $Id: $mg117
// File name:   fir_filter.sv
// Created:     3/2/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Main file for FIR filter design

module fir_filter(input wire clk, input wire n_reset, input wire[15:0] sample_data, input wire[15:0] fir_coefficient, input wire load_coeff, input wire data_ready, output reg one_k_samples, output reg modwait, output reg[15:0] fir_out, output reg err);

reg overflow;
reg cnt_up;
//reg dr;
//reg lc;
reg clear;
reg [2:0] op;
reg [3:0] src1;
reg [3:0] src2;
reg [3:0] dest;
reg [16:0] result;

controller A1 (.clk(clk), .n_rst(n_reset), .dr(data_ready), .lc(load_coeff), .overflow(overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), .op(op), .src1(src1), .src2(src2), .dest(dest), .err(err));

counter A2 (.clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), .one_k_samples(one_k_samples));

datapath A3 (.clk(clk), .n_reset(n_reset), .op(op), .src1(src1), .src2(src2), .dest(dest), .ext_data1(sample_data), .ext_data2(fir_coefficient), .outreg_data(result), .overflow(overflow));

magnitude A4 (.in(result), .out(fir_out));

//sync_low A5 (.clk(clk), .n_rst(n_reset), .async_in(data_ready), .sync_out(dr));

//sync_low A6 (.clk(clk), .n_rst(n_reset), .async_in(load_coeff), .sync_out(lc));


endmodule
