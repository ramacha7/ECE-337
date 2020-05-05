// $Id: $mg 117
// File name:   ahb_lite_fir_filter.sv
// Created:     4/1/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Overall Design of SOC accelerator with AHB bus protocol

module ahb_lite_fir_filter(input wire clk, input wire n_rst, input reg hsel, input reg[3:0] haddr, input reg hsize, input reg[1:0] htrans, input reg hwrite, input reg[15:0] hwdata, output reg[15:0] hrdata, output reg hresp);

reg[15:0] sample_data;
reg data_ready;
reg new_coeff_set;
reg[1:0] coefficient_num;
reg[15:0] fir_coefficient;
reg modwait;
reg[15:0] fir_out;
reg err;
reg load_coeff;
reg one_k_samples;
reg [1:0] set;

ahb_lite_slave AHB (.clk(clk), .n_rst(n_rst), .set(set),.sample_data(sample_data), .data_ready(data_ready), .new_coefficient_set(new_coeff_set), .coefficient_num(coefficient_num), .fir_coefficient(fir_coefficient), .modwait(modwait), .fir_out(fir_out), .err(err), .hsel(hsel), .haddr(haddr), .hsize(hsize), .htrans(htrans), .hwrite(hwrite), .hwdata(hwdata), .hrdata(hrdata), .hresp(hresp));

coefficient_loader LC (.clk(clk), .n_reset(n_rst), .new_coefficient_set(new_coeff_set), .modwait(modwait), .load_coeff(load_coeff), .coefficient_num(coefficient_num), .set(set));

fir_filter FIR (.clk(clk), .n_reset(n_rst), .sample_data(sample_data), .data_ready(data_ready), .fir_coefficient(fir_coefficient), .load_coeff(load_coeff), .one_k_samples(one_k_samples), .modwait(modwait), .fir_out(fir_out), .err(err));

endmodule
