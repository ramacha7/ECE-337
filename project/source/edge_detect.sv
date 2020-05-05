// $Id: $
// File name:   edge_detect.sv
// Created:     4/21/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Design for detecting edge in D_plus

module edge_detect(input wire clk, input wire n_rst, input reg d_plus, output reg d_edge);

reg Q1;
reg Q2;

always_ff @ (posedge clk, negedge n_rst) begin
    if(!n_rst) begin
        Q1 <= '1;
        Q2 <= '1;
    end
    else begin
        Q1 <= d_plus;
        Q2 <= Q1;
    end
end

always_comb begin
    d_edge = 0;
    if (Q1 != Q2) begin
        d_edge = 1;
    end
end

endmodule
