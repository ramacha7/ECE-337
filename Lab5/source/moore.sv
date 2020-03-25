// $Id: $mg117
// File name:   moore.sv
// Created:     2/14/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Moore State Machine '1101' Detector Desgin

module moore(input wire clk, input wire n_rst, input wire i, output reg o);

    typedef enum logic [2:0] {IDLE, RCV1, RCV11, RCV110, RCV1101} state_type;

    state_type next_state;
    state_type state;

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
                    next_state = RCV1101;
                end
                else begin
                    next_state = IDLE;
                end
            end

            RCV1101: begin
                if(i == 1) begin
                    next_state = RCV11;
                end
                else begin
                    next_state = IDLE;
                end
            end
        endcase
    end
    
    always_comb begin
        if (state == RCV1101) begin
            o = 1'b1;
        end
        else begin
            o = 1'b0;
        end
    end

endmodule
