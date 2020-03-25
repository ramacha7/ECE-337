// $Id: $mg117
// File name:   mealy.sv
// Created:     2/14/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Mealy Machine '1101' Detector Design

module mealy(input wire clk, input wire n_rst, input wire i, output wire o);

    typedef enum logic [1:0] {IDLE, RCV1,RCV11,RCV110} state_type;

    state_type next_state,state;

    always_ff @ (posedge clk, negedge n_rst) begin
        if (!n_rst) begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end


    always_comb begin
        next_state = state;

        case(state)
            IDLE: begin
                if(i == 1) begin
                    next_state = RCV1;
                end
                else begin
                    next_state = IDLE;
                end
            end

            RCV1: begin
                if(i == 1) begin
                    next_state = RCV11;
                end
                else begin
                    next_state = IDLE;
                end
            end

            RCV11: begin
                if(i == 1) begin
                    next_state = RCV11;
                end
                else begin
                    next_state = RCV110;
                end
            end

            RCV110: begin
                if(i == 1) begin
                    next_state = RCV1;
                end
                else begin
                    next_state = IDLE;
                end
            end
        endcase
    end


    assign o = ((state == RCV110) && (i == 1));

endmodule


