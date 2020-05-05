// $Id: $mg117
// File name:   eop_detect.sv
// Created:     4/21/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Design for EOP detect block


module eop_detect(input wire d_plus, input wire d_minus, output reg eop);

always_comb begin
    eop = 0;
    if((d_plus == 0) && (d_minus == 0)) begin
        eop = 1;
    end
end

endmodule

