// $Id: $
// File name:   dr_controller.sv
// Created:     4/1/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Module to regulate data ready signal for minimum of 2 clock cycles

module dr_controller(input wire clk, input wire n_rst, input reg dr, input reg modwait,output reg data_ready);

typedef enum logic [2:0] {IDLE, WAIT1, READY, READY1, READY2} state_type;

state_type state;
state_type next_state;

reg next_data_ready;

always_ff @ (posedge clk, negedge n_rst) begin
    if(!n_rst) begin
        state <= IDLE;
        data_ready <= '0;
    end

    else begin
        state <= next_state;
        data_ready <= next_data_ready;
    end
end


always_comb begin
    next_state = state;
    next_data_ready = data_ready;
    case(state)
        IDLE: begin
            if(dr == 1) begin
                next_state = WAIT1;
                next_data_ready = 0;
            end
        end

        WAIT1: begin
            if(modwait == 1) begin
                next_state = WAIT1;
                next_data_ready = 0;
            end
            else begin
                next_state = READY;
                next_data_ready = 1;
            end
        end

        READY: begin
           /* if (modwait == 1) begin
                next_state = READY;
                next_data_ready = 1;
            end
            */
            //else begin
                next_state = READY1;
                next_data_ready = 1;
            //end
        end

        READY1: begin
            next_state = READY2;
            next_data_ready = 1;
        end

        READY2: begin
            next_state = IDLE;
            next_data_ready = 0;
        end
    endcase
end

endmodule


