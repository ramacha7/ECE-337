// $Id: $mg117
// File name:   rcu.sv
// Created:     2/25/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Receiver Control Unit


module rcu (input wire clk, input wire n_rst, input wire new_packet_detected, input wire packet_done, input wire framing_error, output reg sbc_clear, output reg sbc_enable, output reg load_buffer, output reg enable_timer);

    typedef enum logic [2:0] {IDLE, NEW_PACKET, PACKET_DONE,CHECK_ERROR,LOAD_BUFFER} state_type;

    state_type next_state,state;

    reg next_sbc_clear;
    reg next_sbc_enable;
    reg next_load_buffer;
    //reg next_load_buffer1;
    reg next_enable_timer;

    always_ff @ (posedge clk, negedge n_rst) begin
        if (!n_rst) begin
            state <= IDLE;
            sbc_clear <= 0;
            sbc_enable <= 0;
            load_buffer <= 0;
            enable_timer <= 0;
        end
        else begin
            state <= next_state;
            sbc_clear <= next_sbc_clear;
            sbc_enable <= next_sbc_enable;
            load_buffer <= next_load_buffer;
            enable_timer <= next_enable_timer;
        end
    end

/*    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            next_load_buffer <= 0;
        end
        else begin
            next_load_buffer <= next_load_buffer1;
        end
    end
*/

    always_comb begin
        next_state = state;
        next_sbc_clear = sbc_clear;
        next_sbc_enable = sbc_enable;
        next_load_buffer = load_buffer;
        //next_load_buffer1 = 0;
        next_enable_timer = enable_timer;
        case(state)
            IDLE: begin
                if (new_packet_detected == 1) begin
                    next_state = NEW_PACKET;
                    next_sbc_clear = 1;
                    next_enable_timer = 1;
                    next_sbc_enable = 0;
                    next_load_buffer = 0;
                end

                else begin
                    next_state = IDLE;
                    next_sbc_clear = sbc_clear;
                    next_enable_timer = enable_timer;
                    next_sbc_enable = sbc_enable;
                    next_load_buffer = load_buffer;    
                end
            end

            NEW_PACKET: begin
                if (packet_done == 1) begin
                    next_state = PACKET_DONE;
                    next_sbc_clear = 0;
                    next_enable_timer = 0;
                    next_sbc_enable = 1;
                    next_load_buffer = 0;

                end

                else begin
                    next_state = NEW_PACKET;
                    next_sbc_clear = sbc_clear;
                    next_enable_timer = enable_timer;
                    next_sbc_enable = sbc_enable;
                    next_load_buffer = load_buffer; 
                end

           end

           PACKET_DONE: begin
               next_state = CHECK_ERROR;
               next_sbc_clear = 0;
               next_enable_timer = 0;
               next_sbc_enable = 1;
               next_load_buffer = 0;

           end

           CHECK_ERROR: begin
               if (framing_error == 1) begin
                   next_state = IDLE;
                    next_sbc_clear = 0;
                    next_enable_timer = 0;
                    next_sbc_enable = 0;
                    next_load_buffer = 0;

               end

               else begin
                   next_state = LOAD_BUFFER;
                   next_sbc_clear = 0;
                   next_enable_timer = 0;
                   next_sbc_enable = 0;
                   next_load_buffer = 1; 
               end
          end

          LOAD_BUFFER: begin
              next_state = IDLE;
              next_sbc_clear = 0;
              next_enable_timer = 0;
              next_sbc_enable = 0;
              next_load_buffer = 0;

          end
        endcase

   end


endmodule
