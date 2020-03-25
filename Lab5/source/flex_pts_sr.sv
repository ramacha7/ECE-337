// $Id: $mg117
// File name:   flex_pts_sr.sv
// Created:     2/13/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Flexible and Scalable Parallel-to Serial Shift Register Design


module flex_pts_sr #(parameter NUM_BITS = 4, parameter SHIFT_MSB = 1) (input wire clk, input wire n_rst, input wire shift_enable, input wire load_enable, input wire [NUM_BITS-1:0] parallel_in, output reg serial_out);

    reg [NUM_BITS-1:0] q;
    reg [NUM_BITS-1:0] qtemp;

    always_ff @ (posedge clk, negedge n_rst) begin
        if (!n_rst) begin
            q <= '1;
        end
        else begin
            q <= qtemp;
        end
    end

    always_comb begin
        qtemp = q;
        if (load_enable == 1) begin
            qtemp = parallel_in;
        end
        else if(shift_enable == 1 && load_enable == 0) begin
            if (SHIFT_MSB == 1) begin
                qtemp = {q[NUM_BITS-2:0],1'b1};
            end
            else begin
                qtemp = {1'b1,q[NUM_BITS-1:1]};
            end
        end

        else begin
            qtemp = q;
        end
    end

    always_comb begin
         if (SHIFT_MSB == 1) begin
             serial_out = q[NUM_BITS-1];
            end
         else begin
             serial_out = q[0];
         end
    end

endmodule
