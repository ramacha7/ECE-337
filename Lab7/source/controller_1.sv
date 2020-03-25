// $Id: $mg117
// File name:   controller.sv
// Created:     3/2/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Module for controller unit

module controller(input wire clk, input wire n_rst, input wire dr, input lc, input wire overflow, output reg cnt_up, output reg clear, output reg modwait, output reg [2:0] op, output reg [3:0] src1, output reg[3:0] src2, output reg[3:0] dest, output reg err);

typedef enum logic [4:0] {IDLE, LOAD_COEFF1, WAIT1,LOAD_COEFF2, WAIT2, LOAD_COEFF3, WAIT3, LOAD_COEFF4, STORE, ZERO, REORD1, REORD2, REORD3, REORD4, MUL1, SUB1, MUL2, ADD2, MUL3, SUB3, MUL4, ADD4, EIDLE } state_type;

state_type state;
state_type next_state;
reg [18:0] next_out;

always_ff @(posedge clk, negedge n_rst) begin
    if (!n_rst) begin
        state <= IDLE;
    end
    else begin
        state <= next_state;
    end
end


always_comb begin
    next_state = state;
    cnt_up = 0;
    clear = 0;
    modwait = 0;
    op = '0;
    src1 = '0;
    src2 = '0;
    dest = '0;
    err = 0;

    case(state)
        IDLE: begin
            if (lc == 1) begin
                next_state = LOAD_COEFF1;
                cnt_up = 0;
                clear = 0;
                modwait = 1;
                op = 3'b011;
                src1 = '0;
                src2 = '0;
                dest = 4'b0111;
                err = 0;
            end

            else if(dr == 1) begin
                next_state = STORE;
                cnt_up = 0;
                clear = 0;
                modwait = 0;
                op = 3'b010;
                src1 = '0;
                src2 = '0;
                dest = 4'b0101;
                err = 0;
            end

        end

        LOAD_COEFF1: begin
            next_state = WAIT1;
            cnt_up = 0;
            clear = 0;
            modwait = 0;
            op = 3'b000;
            src1 = '0;
            src2 = '0;
            dest = '0;
            err = 0;
        end

        WAIT1: begin
            if(lc == 1) begin
                next_state = LOAD_COEFF2;
                cnt_up = 0;
                clear = 0;
                modwait = 1;
                op = 3'b011;
                src1 = '0;
                src2 = '0;
                dest = 4'b1000;
                err = 0;
            end
        end


        LOAD_COEFF2: begin
            next_state = WAIT2;
            cnt_up = 0;
            clear = 0;
            modwait = 0;
            op = 3'b000;
            src1 = '0;
            src2 = '0;
            dest = '0;
            err = 0;
        end

        WAIT2: begin
            if(lc == 1) begin
                next_state = LOAD_COEFF3;
                cnt_up = 0;
                clear = 0;
                modwait = 1;
                op = 3'b011;
                src1 = '0;
                src2 = '0;
                dest = 4'b1001;
                err = 0;
            end
        end

        LOAD_COEFF3: begin
            next_state = WAIT3;
            cnt_up = 0;
            clear = 0;
            modwait = 0;
            op = 3'b000;
            src1 = '0;
            src2 = '0;
            dest = '0;
            err = 0;
        end

        WAIT3: begin
            if(lc == 1) begin
                next_state = LOAD_COEFF4;
                cnt_up = 0;
                clear = 1;
                modwait = 1;
                op = 3'b011;
                src1 = '0;
                src2 = '0;
                dest = 4'b1010;
                err = 0;
            end
        end

        LOAD_COEFF4: begin
            next_state = IDLE;
            cnt_up = 0;
            clear = 0;
            modwait = 0;
            op = 3'b000;
            src1 = '0;
            src2 = '0;
            dest = '0;
            err = 0;
        end

        STORE: begin
            if (dr == 1) begin
                next_state = ZERO;
                cnt_up = 1;
                clear = 0;
                modwait = 1;
                op = 3'b101;     
                src1 = 4'b0001;
                src2 = 4'b0001;
                dest = 4'b0000;
                err = 0;
            end

            else if( dr != 1) begin
                next_state = EIDLE;
                cnt_up = 0;
                clear = 0;
                modwait = 0;
                op = 3'b000;
                src1 = '0;
                src2 = '0;
                dest = '0;
                err = 1;
            end
        end

        ZERO: begin
            next_state = REORD1;
            cnt_up = 0;
            clear = 0;
            modwait = 1;
            op = 3'b001;
            src1 = 4'b0010;
            src2 = '0;
            dest = 4'b0001;
            err = 0;
        end

        REORD1: begin
            next_state = REORD2;
            cnt_up = 0;
            clear = 0;
            modwait = 1;
            op = 3'b001;
            src1 = 4'b0011;
            src2 = '0;
            dest = 4'b0010;
            err = 0;
        end

        REORD2: begin
            next_state = REORD3;
            cnt_up = 0;
            clear = 0;
            modwait = 1;
            op = 3'b001;
            src1 = 4'b0100;
            src2 = '0;
            dest = 4'b0011;
            err = 0;
        end

        REORD3: begin
            next_state = REORD4;
            cnt_up = 0;
            clear = 0;
            modwait = 1;
            op = 3'b001;
            src1 = 4'b0101;
            src2 = '0;
            dest = 4'b0100;
            err = 0;
        end

        REORD4: begin
            next_state = MUL1;
            cnt_up = 0;
            clear = 0;
            modwait = 1;
            op = 3'b110;
            src1 = 4'b0100;
            src2 = 4'b0111;
            dest = 4'b0110;
            err = 0;
        end

        MUL1: begin
            next_state = SUB1;
            cnt_up = 0;
            clear = 0;
            modwait = 1;
            op = 3'b101;
            src1 = '0;
            src2 = 4'b0110;
            dest = 4'b0000;
            err = 0;
        end


        SUB1: begin
            if(overflow == 1) begin
                next_state = EIDLE;
                cnt_up = 0;
                clear = 0;
                modwait = 0;
                op = '0;
                src1 = '0;
                src2 = '0;
                dest = '0;
                err = 1;
            end
            else begin
                next_state = MUL2;
                cnt_up = 0;
                clear = 0;
                modwait = 1;
                op = 3'b110;
                src1 = 4'b0011;
                src2 = 4'b1000;
                dest = 4'b0110;
                err = 0;
            end
        end

        MUL2: begin
            next_state = ADD2;
            cnt_up = 0;
            clear = 0;
            modwait = 1;
            op = 3'b100;
            src1 = 4'b0000;
            src2 = 4'b0110;
            dest = 4'b0000;
            err = 0;
        end

        ADD2: begin
            if(overflow == 1) begin
                next_state = EIDLE;
                cnt_up = 0;
                clear = 0;
                modwait = 0;
                op = '0;
                src1 = '0;
                src2 = '0;
                dest = '0;
                err = 1;
            end
            else begin
                next_state = MUL3;
                cnt_up = 0;
                clear = 0;
                modwait = 1;
                op = 3'b110;
                src1 = 4'b0010;
                src2 = 4'b1001;
                dest = 4'b0110;
                err = 0;
            end
        end

        MUL3: begin
            next_state = SUB3;
            cnt_up = 0;
            clear = 0;
            modwait = 1;
            op = 3'b101;
            src1 = 4'b0000;
            src2 = 4'b0110;
            dest = 4'b0000;
            err = 0;
        end

        SUB3: begin
            if(overflow == 1) begin
                next_state = EIDLE;
                cnt_up = 0;
                clear = 0;
                modwait = 0;
                op = '0;
                src1 = '0;
                src2 = '0;
                dest = '0;
                err = 1;
            end

            else begin
                next_state = MUL4;
                cnt_up = 0;
                clear = 0;
                modwait = 1;
                op = 3'b110;
                src1 = 4'b0001;
                src2 = 4'b1010;
                dest = 4'b0110;
                err = 0;
            end
        end

        MUL4: begin
            next_state = ADD4;
            cnt_up = 0;
            clear = 0;
            modwait = 1;
            op = 3'b100;
            src1 = 4'b0000;
            src2 = 4'b0110;
            dest = 4'b0000;
            err = 0;
        end

        ADD4: begin
             if(overflow == 1) begin
                next_state = EIDLE;
                cnt_up = 0;
                clear = 0;
                modwait = 0;
                op = '0;
                src1 = '0;
                src2 = '0;
                dest = '0;
                err = 1;
            end

            else begin
                next_state = IDLE;
                cnt_up = 0;
                clear = 0;
                modwait = 0;
                op = '0;
                src1 = '0;
                src2 = '0;
                dest = '0;
                err = 0;
            end
        end


        EIDLE: begin
            if (dr == 1) begin
                next_state = STORE;
                cnt_up = 0;
                clear = 0;
                modwait = 0;
                op = 3'b010;
                src1 = '0;
                src2 = '0;
                dest = 4'b0101;
                err = 0;
            end

            else if(dr == 0) begin
                next_state = EIDLE;
                cnt_up = 0;
                clear = 0;
                modwait = 0;
                op = '0;
                src1 = '0;
                src2 = '0;
                dest = '0;
                err = 1;
            end

            else if(lc == 1) begin
                next_state = LOAD_COEFF1;
                cnt_up = 0;
                clear = 0;
                modwait = 1;
                op = 3'b011;
                src1 = '0;
                src2 = '0;
                dest = 4'b0111;
                err = 0;
            end
        end
    endcase
end

endmodule

