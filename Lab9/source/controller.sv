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
reg next_cntup;
reg next_clear;
reg next_modwait;
reg [2:0] next_op;
reg [3:0] next_src1;
reg [3:0] next_src2;
reg [3:0] next_dest;
reg next_err;

always_ff @(posedge clk, negedge n_rst) begin
    if (!n_rst) begin
        state <= IDLE;
        cnt_up <= 0;
        clear <= 0;
        modwait <= 0;
        op <= 3'b000;
        src1 <= 4'b0000;
        src2 <= 4'b0000;
        dest <= 4'b0000;
        err <= 0;
    end
    else begin
        state <= next_state;
        cnt_up <= next_cntup;
        clear <= next_clear;
        modwait <= next_modwait;
        op <= next_op;
        src1 <= next_src1;
        src2 <= next_src2;
        dest <= next_dest;
        err <= next_err;
    end
end


always_comb begin
    next_state = state;
    next_cntup = cnt_up;
    next_clear = clear;
    next_modwait = modwait;
    next_op = op;
    next_src1 = src1;
    next_src2 = src2;
    next_dest = dest;
    next_err = err;

    case(state)
        IDLE: begin
            if (lc == 1) begin
                next_state = LOAD_COEFF1;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 1;
                next_op = 3'b011;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = 4'b0111;
                next_err = 0;
            end

            else if(dr == 1) begin
                next_state = STORE;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 1;
                next_op = 3'b010;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = 4'b0101;
                next_err = 0;
            end

        end

        LOAD_COEFF1: begin
            next_state = WAIT1;
            next_cntup = 0;
            next_clear = 0;
            next_modwait = 0;
            next_op = 3'b000;
            next_src1 = '0;
            next_src2 = '0;
            next_dest = '0;
            next_err = 0;
        end

        WAIT1: begin
            if(lc == 1) begin
                next_state = LOAD_COEFF2;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 1;
                next_op = 3'b011;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = 4'b1000;
                next_err = 0;
            end
        end


        LOAD_COEFF2: begin
            next_state = WAIT2;
            next_cntup = 0;
            next_clear = 0;
            next_modwait = 0;
            next_op = 3'b000;
            next_src1 = '0;
            next_src2 = '0;
            next_dest = '0;
            next_err = 0;
        end

        WAIT2: begin
            if(lc == 1) begin
                next_state = LOAD_COEFF3;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 1;
                next_op = 3'b011;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = 4'b1001;
                next_err = 0;
            end
        end

        LOAD_COEFF3: begin
            next_state = WAIT3;
            next_cntup = 0;
            next_clear = 0;
            next_modwait = 0;
            next_op = 3'b000;
            next_src1 = '0;
            next_src2 = '0;
            next_dest = '0;
            next_err = 0;
        end

        WAIT3: begin
            if(lc == 1) begin
                next_state = LOAD_COEFF4;
                next_cntup = 0;
                next_clear = 1;
                next_modwait = 1;
                next_op = 3'b011;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = 4'b1010;
                next_err = 0;
            end
        end

        LOAD_COEFF4: begin
            next_state = IDLE;
            next_cntup = 0;
            next_clear = 0;
            next_modwait = 0;
            next_op = 3'b000;
            next_src1 = '0;
            next_src2 = '0;
            next_dest = '0;
            next_err = 0;
        end

        STORE: begin
            if (dr == 1) begin
                next_state = ZERO;
                next_cntup = 1;
                next_clear = 0;
                next_modwait = 1;
                next_op = 3'b101;     
                next_src1 = 4'b0001;
                next_src2 = 4'b0001;
                next_dest = 4'b0000;
                next_err = 0;
            end

            else if( dr != 1) begin
                next_state = EIDLE;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 0;
                next_op = 3'b000;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = '0;
                next_err = 1;
            end
        end

        ZERO: begin
            next_state = REORD1;
            next_cntup = 0;
            next_clear = 0;
            next_modwait = 1;
            next_op = 3'b001;
            next_src1 = 4'b0010;
            next_src2 = '0;
            next_dest = 4'b0001;
            next_err = 0;
        end

        REORD1: begin
            next_state = REORD2;
            next_cntup = 0;
            next_clear = 0;
            next_modwait = 1;
            next_op = 3'b001;
            next_src1 = 4'b0011;
            next_src2 = '0;
            next_dest = 4'b0010;
            next_err = 0;
        end

        REORD2: begin
            next_state = REORD3;
            next_cntup = 0;
            next_clear = 0;
            next_modwait = 1;
            next_op = 3'b001;
            next_src1 = 4'b0100;
            next_src2 = '0;
            next_dest = 4'b0011;
            next_err = 0;
        end

        REORD3: begin
            next_state = REORD4;
            next_cntup = 0;
            next_clear = 0;
            next_modwait = 1;
            next_op = 3'b001;
            next_src1 = 4'b0101;
            next_src2 = '0;
            next_dest = 4'b0100;
            next_err = 0;
        end

        REORD4: begin
            next_state = MUL1;
            next_cntup = 0;
            next_clear = 0;
            next_modwait = 1;
            next_op = 3'b110;
            next_src1 = 4'b0100;
            next_src2 = 4'b0111;
            next_dest = 4'b0110;
            next_err = 0;
        end

        MUL1: begin
            next_state = SUB1;
            next_cntup = 0;
            next_clear = 0;
            next_modwait = 1;
            next_op = 3'b101;
            next_src1 = '0;
            next_src2 = 4'b0110;
            next_dest = 4'b0000;
            next_err = 0;
        end


        SUB1: begin
            if(overflow == 1) begin
                next_state = EIDLE;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 0;
                next_op = '0;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = '0;
                next_err = 1;
            end
            else begin
                next_state = MUL2;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 1;
                next_op = 3'b110;
                next_src1 = 4'b0011;
                next_src2 = 4'b1000;
                next_dest = 4'b0110;
                next_err = 0;
            end
        end

        MUL2: begin
            next_state = ADD2;
            next_cntup = 0;
            next_clear = 0;
            next_modwait = 1;
            next_op = 3'b100;
            next_src1 = 4'b0000;
            next_src2 = 4'b0110;
            next_dest = 4'b0000;
            next_err = 0;
        end

        ADD2: begin
            if(overflow == 1) begin
                next_state = EIDLE;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 0;
                next_op = '0;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = '0;
                next_err = 1;
            end
            else begin
                next_state = MUL3;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 1;
                next_op = 3'b110;
                next_src1 = 4'b0010;
                next_src2 = 4'b1001;
                next_dest = 4'b0110;
                next_err = 0;
            end
        end

        MUL3: begin
            next_state = SUB3;
            next_cntup = 0;
            next_clear = 0;
            next_modwait = 1;
            next_op = 3'b101;
            next_src1 = 4'b0000;
            next_src2 = 4'b0110;
            next_dest = 4'b0000;
            next_err = 0;
        end

        SUB3: begin
            if(overflow == 1) begin
                next_state = EIDLE;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 0;
                next_op = '0;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = '0;
                next_err = 1;
            end

            else begin
                next_state = MUL4;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 1;
                next_op = 3'b110;
                next_src1 = 4'b0001;
                next_src2 = 4'b1010;
                next_dest = 4'b0110;
                next_err = 0;
            end
        end

        MUL4: begin
            next_state = ADD4;
            next_cntup = 0;
            next_clear = 0;
            next_modwait = 1;
            next_op = 3'b100;
            next_src1 = 4'b0000;
            next_src2 = 4'b0110;
            next_dest = 4'b0000;
            next_err = 0;
        end

        ADD4: begin
             if(overflow == 1) begin
                next_state = EIDLE;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 0;
                next_op = '0;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = '0;
                next_err = 1;
            end

            else begin
                next_state = IDLE;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 0;
                next_op = '0;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = '0;
                next_err = 0;
            end
        end


        EIDLE: begin
            if (dr == 1) begin
                next_state = STORE;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 0;
                next_op = 3'b010;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = 4'b0101;
                next_err = 0;
            end

            else if(lc == 1) begin
                next_state = LOAD_COEFF1;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 1;
                next_op = 3'b011;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = 4'b0111;
                next_err = 0;
            end

            else if(dr == 0) begin
                next_state = EIDLE;
                next_cntup = 0;
                next_clear = 0;
                next_modwait = 0;
                next_op = '0;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = '0;
                next_err = 1;
            end


        end
    endcase
end

endmodule

