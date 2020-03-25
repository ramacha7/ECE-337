// $Id: $mg117
// File name:   magnitude.sv
// Created:     3/3/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Magnitude block that changes signed value to 16 bit unsigned value

module magnitude(input wire[16:0] in, output reg[15:0] out);
    
    always_comb begin
        if(in[16] == 1) begin
            out = ~(in[15:0]) + 16'd1;
        end
        else begin
            out = in[15:0];
        end
    end

endmodule    
