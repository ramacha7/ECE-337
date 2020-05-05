// $Id: $mg117
// File name:   decode.sv
// Created:     4/21/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Design for Decoding NRZ encoded signal

module decode(input wire clk, input wire n_rst, input reg d_plus, input reg shift_enable, input reg eop, output reg d_orig);

reg Q1next;
reg Q2next;
reg Q1;
reg Q2;

always_comb begin
    d_orig = 1;
    if(Q1 != Q2) begin
        d_orig = 0;
    end
end

always_ff @ (posedge clk, negedge n_rst) begin
    if(!n_rst) begin
        Q1 <= '1;
        Q2 <= '1;
    end

    else begin
        Q1 <= Q1next;
        Q2 <= Q2next;
    end
end

always_comb begin
    Q1next = Q1;
    Q2next = Q2;

    if((eop == 1) && (shift_enable == 1)) begin
        Q1next = 1;
        Q2next = 1;
    end
    else if(shift_enable == 1) begin
        Q2next = Q1;
        Q1next = d_plus;
    end
    else begin
        Q2next = Q2;
        Q1next = d_plus;
    end

end

endmodule
