// $Id: $
// File name:   sync_low.sv
// Created:     2/6/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: sync low

module sync_low(
    input wire clk,
    input wire n_rst,
    input wire async_in,
    output reg sync_out
);

reg meta;

always_ff @(posedge clk,negedge n_rst) begin
    if (!n_rst) begin
        meta <= 1'b0;
        sync_out <= 1'b0;
    end
    else begin
        meta <= async_in;
        sync_out <= meta;
    end
end

endmodule

