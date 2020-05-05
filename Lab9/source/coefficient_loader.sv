// $Id: $
// File name:   coefficient_loader.sv
// Created:     4/1/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Design for the coefficient loader to the FIR filter

module coefficient_loader(input wire clk, input wire n_reset, input reg new_coefficient_set, input reg modwait, output reg load_coeff,output reg[1:0] coefficient_num,output reg [1:0] set);

typedef enum logic [3:0] {IDLE, F0_coeff, WAIT0, F1_coeff, WAIT1, F2_coeff, WAIT2, F3_coeff,WAIT3} state_type;

state_type next_state;
state_type state;

reg next_lc;
reg [1:0] next_set;
reg [1:0] next_coeff_num;

always_ff @ (posedge clk, negedge n_reset) begin
    if (!n_reset) begin
        state <= IDLE;
        coefficient_num <= '0;
        load_coeff <= '0;
        set <= 2'd2;
    end

    else begin
        state <= next_state;
        coefficient_num <= next_coeff_num;
        load_coeff <= next_lc;
        set <= next_set;
    end
end


always_comb begin
    next_state = state;
    next_lc = load_coeff;
    next_coeff_num = coefficient_num;
    next_set = set;

    case(state)
        IDLE: begin
            if (new_coefficient_set == 1 && modwait == 0) begin
                next_state = F0_coeff;
                next_lc = 1;
                next_coeff_num = 2'd0;
                next_set = 1;
            end

            else begin 
                next_state = IDLE;
                next_lc = 0;
                next_coeff_num = 2'd0;
                next_set = 2;
            end
        end

        F0_coeff: begin
            next_state = WAIT0;
            next_lc = 0;
            next_coeff_num = 2'd0;
            next_set = 1;
        end

        WAIT0: begin
            if (modwait == 1) begin
                next_state = WAIT0;
                next_lc = 0;
                next_set = 1;
                next_coeff_num = 2'd1;
            end

            else begin
                next_state = F1_coeff;
                next_lc = 1;
                next_set = 1;
                next_coeff_num = 2'd1;
            end
        end

        F1_coeff: begin
            next_state = WAIT1;
            next_lc = 0;
            next_set = 1;
            next_coeff_num = 2'd1;
        end

        WAIT1: begin
            if(modwait == 1) begin
                next_state = WAIT1;
                next_lc = 0;
                next_set = 1;
                next_coeff_num = 2'd1;
            end

            else begin
                next_state = F2_coeff;
                next_lc = 1;
                next_set = 1;
                next_coeff_num = 2'd2;
            end
        end

        F2_coeff: begin
            next_state = WAIT2;
            next_lc = 0;
            next_set = 1;
            next_coeff_num = 2'd2;
        end

        WAIT2: begin
            if(modwait == 1) begin
                next_state = WAIT2;
                next_lc = 0;
                next_set = 1;
                next_coeff_num = 2'd2;
            end

            else begin
                next_state = F3_coeff;
                next_lc = 1;
                next_set = 1;
                next_coeff_num = 2'd3;
            end
        end

        F3_coeff: begin
            next_state = WAIT3;
            next_lc = 0;
            next_set = 0;
            next_coeff_num = 2'd3;
        end

        WAIT3: begin
            next_state = IDLE;
            next_lc = 0;
            next_set = 2;
            next_coeff_num = 2'd0;
        end
    endcase
end

endmodule
