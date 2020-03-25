// $Id: $mg117
// File name:   flex_stp_sr.sv
// Created:     2/13/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Flexible and Scalable Serial to Parallel Shift Register Design


module flex_stp_sr #(parameter NUM_BITS = 9,parameter SHIFT_MSB = 1) (input wire clk,input wire n_rst,input wire shift_enable,input wire serial_in, output reg [NUM_BITS-1:0] parallel_out);

    reg [NUM_BITS-1:0] parallel_temp;

    always_ff @(posedge clk, negedge n_rst) begin
        if (!n_rst) begin
            parallel_out <= '1;
        end
        else begin
            parallel_out <= parallel_temp;
        end
    end

    always_comb begin
        if (shift_enable == 1) begin
            if (SHIFT_MSB == 1) begin
                parallel_temp = parallel_out << 1;
                parallel_temp[0] = serial_in;
            end
            else begin
                parallel_temp = parallel_out >> 1;
                parallel_temp[NUM_BITS-1] = serial_in;
            end
        end

        else begin
            parallel_temp = parallel_out;
        end
    end

endmodule

