// $Id: $
// File name:   flex_counter.sv
// Created:     2/7/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Flex Counter Design

module first_flex_counter #(parameter NUM_CNT_BITS = 14)(input wire clk, input wire n_rst, input wire enable_timer, input wire [NUM_CNT_BITS-1:0] rollover_val, output reg[NUM_CNT_BITS-1:0] count_out, output reg rollover_flag);

reg [NUM_CNT_BITS-1:0] next_count;
reg next_rollover_flag;

always_ff @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
        //count_out <= (rollover_val >> 1) + 14'd3;
        count_out <= '0;
        rollover_flag <= 0;
    end
    else begin
        count_out <= next_count;
        rollover_flag <= next_rollover_flag;
    end
end


always_comb begin
    next_count = count_out;
    next_rollover_flag = rollover_flag;
    if (!(enable_timer)) begin
        next_count = (rollover_val >> 1) + 14'd3;
        //next_count = 8;
        next_rollover_flag = 1'b0;
    end
    else begin
        if (count_out == (rollover_val - 1)) begin
            next_rollover_flag = 1;
            next_count = count_out + 1;
        end

        else if(count_out == rollover_val) begin
            next_count = 1;
            next_rollover_flag = 0;
        end

        else begin
            next_count = count_out + 1;
            next_rollover_flag = 0;
        end
    end
end

endmodule
