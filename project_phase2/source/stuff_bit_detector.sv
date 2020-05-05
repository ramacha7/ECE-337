// $Id: $
// File name:   stuff_bit_detector.sv
// Created:     4/27/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Design to create stuff bit detector

module stuff_bit_detector(input wire clk, input wire n_rst, input reg d_orig, input reg shift_enable, output reg stuff_bit_detect);

reg detect;
reg [5:0] parallel_out;
reg next_stuff_bit_detect;

typedef enum logic {IDLE, DETECTED} state_type;

state_type state;
state_type next_state;

always_ff @(posedge clk, negedge n_rst) begin
    if(!n_rst) begin
        state <= IDLE;
        stuff_bit_detect <= '0;
    end
    else begin
        state <= next_state;
        stuff_bit_detect <= next_stuff_bit_detect;
    end
end

always_comb begin
    next_state = state;
    next_stuff_bit_detect = stuff_bit_detect;
    case(state)
        IDLE: begin
            if(detect == 1) begin
                next_state = DETECTED;
                next_stuff_bit_detect = 1;
            end
            else begin
                next_state = IDLE;
                next_stuff_bit_detect = 0;
            end
        end

        DETECTED: begin
            if(shift_enable == 1) begin
                next_state = IDLE;
                next_stuff_bit_detect = 0;
            end
            else begin
                next_state = DETECTED;
                next_stuff_bit_detect = 1;
            end
        end
    endcase
end


flex_stp_sr_stuffbit SB (.clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), .serial_in(d_orig), .parallel_out(parallel_out));

always_comb begin
    detect = 0;
    if(parallel_out == 6'b111111) begin
        detect = 1;
    end
end



endmodule
