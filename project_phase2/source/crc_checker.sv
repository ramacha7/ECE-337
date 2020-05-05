// $Id: $mg117
// File name:   crc_checker.sv
// Created:     4/28/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Design to implement CRC for receiver side

module crc_checker(input wire clk, input wire n_rst, input reg shift_enable, input reg start, input reg data_in, output reg [15:0] crc_out);

reg [15:0] lfsr;

always_ff @ (posedge shift_enable, negedge n_rst) begin
    if(!n_rst) begin
        lfsr <= 16'hFFFF;
    end
    else if (start == 0) begin
        lfsr <= 16'hFFFF;
    end

    else begin
        lfsr[0] <= data_in ^ lfsr[15];
        lfsr[1] <= lfsr[0];
        lfsr[2] <= lfsr[1];
        lfsr[3] <= lfsr[2];
        lfsr[4] <= lfsr[3];
        lfsr[5] <= lfsr[4] ^ data_in ^ lfsr[15];
        lfsr[6] <= lfsr[5];
        lfsr[7] <= lfsr[6];
        lfsr[8] <= lfsr[7];
        lfsr[9] <= lfsr[8];
        lfsr[10] <= lfsr[9];
        lfsr[11] <= lfsr[10];
        lfsr[12] <= lfsr[11] ^ data_in ^ lfsr[15];
        lfsr[13] <= lfsr[12];
        lfsr[14] <= lfsr[13];
        lfsr[15] <= lfsr[14];
    end
end


always_comb begin
    crc_out = lfsr;
end

endmodule
