// $Id: $mg117
// File name:   rcu.sv
// Created:     4/21/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Design of RCU

module rcu (input wire clk, input wire n_rst, input reg d_edge, input reg eop, input reg shift_enable, input reg [7:0] rcv_data, input reg byte_received, input reg [3:0] count,output reg rcving, output reg w_enable, output reg r_error, output reg clear, output logic[3:0] PID, output reg start);


typedef enum logic [4:0] {IDLE, RECEIVING, CHECK_SYNCBYTE, PID_RECEIVE, PID_ASSIGN, PACKET_DATA, FIFO_EN, CHECK_EOP, EOP_1, EOP_2, EOP_IDLE, ERR_RECEIVING, EOP_E1, EOP_E2, EOP_EIDLE, ERROR}state_type;

state_type state;
state_type next_state;

reg next_rcving;
reg next_w_enable;
reg next_r_error;
reg next_clear;
reg next_start;
logic [3:0] next_PID;

always_ff @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
        state <= IDLE;
        rcving <= '0;
        w_enable <= '0;
        r_error <= '0;
        clear <= '0;
        PID <= '1;
        start <= '0;
    end

    else begin
        state <= next_state;
        rcving <= next_rcving;
        w_enable <= next_w_enable;
        r_error <= next_r_error;
        clear <= next_clear;
        PID <= next_PID;
        start <= next_start;
    end
end

always_comb begin
    next_state = state;
    next_rcving = rcving;
    next_w_enable = w_enable;
    next_r_error = r_error;
    next_clear = clear;
    next_PID = PID;
    next_start = start;

    case(state)
        IDLE: begin
            if (d_edge == 1) begin
                next_state = RECEIVING;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = '1;
                next_start = 0;
            end

            else begin
                next_state = IDLE;
                next_rcving = 0;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = '1;
            end
        end

        RECEIVING: begin
             if (byte_received == 1) begin
                next_state = CHECK_SYNCBYTE;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = '1;
                next_start = 0;
            end

            else begin
                next_state = RECEIVING;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = '1;
            end
        end

        CHECK_SYNCBYTE: begin
            if (rcv_data != 8'b10000000) begin
                next_state = ERR_RECEIVING;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 1;
                next_clear = 0;
                next_PID = '1;
                next_start = 0;
            end

            else begin
                next_state = PID_RECEIVE;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = '1;
                next_start = 0;
            end
        end

        PID_RECEIVE: begin
            if (byte_received == 1) begin
                next_state = PID_ASSIGN;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                if((rcv_data[3:0] == 4'b0001) || (rcv_data[3:0] == 4'b1001) || (rcv_data[3:0] == 4'b0011) || (rcv_data[3:0] == 4'b1011) || (rcv_data[3:0] == 4'b0010) || (rcv_data[3:0] == 4'b1010) || (rcv_data[3:0] == 4'b1110)) begin 
                    next_PID = rcv_data[3:0];
                end
                else begin
                    next_PID = '1;
                end
                next_start = 0;

            end

            else begin
                next_state = PID_RECEIVE;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = '1;
            end
        end

        PID_ASSIGN: begin
            next_state = PACKET_DATA;
            next_rcving = 1;
            next_w_enable = 0;
            next_r_error = 0;
            next_clear = 0;
            next_PID = PID;
            next_start = 1;
        end

        PACKET_DATA: begin
            if (byte_received == 1) begin
                next_state = FIFO_EN;
                next_rcving = 1;
                next_w_enable = 1;
                next_r_error = 0;
                next_clear = 0;
                next_PID = PID;
                next_start = 1;
            end

            else if(eop == 1) begin
                next_start = 0;
            if ((eop == 1) && (shift_enable == 1)) begin
                next_state = CHECK_EOP;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = PID;
            end
            end

            else begin
                next_state = PACKET_DATA;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = PID;
                next_start = start;
            end
        end

        FIFO_EN: begin
            if((eop == 1) && (shift_enable == 1)) begin
                next_state = CHECK_EOP;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = PID;
                next_start = 0;
            end

            else begin
                next_state = PACKET_DATA;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = PID;
                next_start = 1;
            end
        end

        CHECK_EOP: begin
            if (count == 1) begin
                next_state = EOP_1;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = PID;
                next_start = 0;
            end

            else begin
                next_state = EOP_E1;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 1;
                next_clear = 0;
                next_PID = PID;
                next_start = 0;
            end
        end

        EOP_1: begin
            if(shift_enable == 1) begin
                next_state = EOP_2;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = PID;
                next_start = 0;
            end
            else begin
                next_state = EOP_1;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = PID;
                next_start = 0;
            end
        end

        EOP_2: begin
            if(shift_enable == 1) begin
                next_state = EOP_IDLE;
                next_rcving = 0;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 1;
                next_PID = PID;
                next_start = 0;
            end
            else begin
                next_state = EOP_2;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = PID;
                next_start = 0;
            end
        end


        EOP_IDLE: begin
            next_state = IDLE;
            next_rcving = 0;
            next_w_enable = 0;
            next_r_error = 0;
            next_clear = 0;
            next_PID = PID;
            next_start = 0;
        end

        ERR_RECEIVING: begin
            if ((eop == 1) && (shift_enable == 1)) begin
                next_state = EOP_E1;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 1;
                next_clear = 0;
                next_PID = PID;
                next_start = 0;
            end

            else begin
                next_state = ERR_RECEIVING;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 1;
                next_clear = 0;
                next_PID = PID;
                next_start = 0;
            end
        end

        EOP_E1: begin
            if (shift_enable == 1) begin
                next_state = EOP_E2;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 1;
                next_clear = 0;
                next_PID = PID;
                next_start = 0;
            end

            else begin
                next_state = EOP_E1;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 1;
                next_clear = 0;
                next_PID = PID;
                next_start = 0;
            end
        end

        EOP_E2: begin
            if (shift_enable == 1) begin
                next_state = EOP_EIDLE;
                next_rcving = 0;
                next_w_enable = 0;
                next_r_error = 1;
                next_clear = 1;
                next_PID = PID;
                next_start = 0;
            end

            else begin
                next_state = EOP_E2;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 1;
                next_clear = 0;
                next_PID = PID;
                next_start = 0;
            end
        end
        
        EOP_EIDLE: begin
            next_state = ERROR;
            next_rcving = 0;
            next_w_enable = 0;
            next_r_error = 1;
            next_clear = 0;
            next_PID = PID;
            next_start = 0;
        end

        
        ERROR: begin
            if (d_edge == 1) begin
                next_state = RECEIVING;
                next_rcving = 1;
                next_w_enable = 0;
                next_r_error = 0;
                next_clear = 0;
                next_PID = '1;
                next_start = 0;
            end

            else begin
                next_state = ERROR;
                next_rcving = 0;
                next_w_enable = 0;
                next_r_error = 1;
                next_clear = 0;
                next_PID = PID;
                next_start = 0;
            end
        end
    endcase
end

endmodule







                

