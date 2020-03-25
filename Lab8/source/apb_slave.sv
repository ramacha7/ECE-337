// $Id: $mg117
// File name:   apb_slave.sv
// Created:     3/10/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: APB slave interface design

module apb_slave(input wire clk, input wire n_rst, input wire [7:0] rx_data, input wire data_ready, input wire overrun_error, input wire framing_error, input wire psel, input wire[2:0] paddr, input wire penable, input wire pwrite, input wire [7:0] pwdata, output reg data_read, output reg[7:0] prdata, output reg pslverr, output wire [3:0] data_size, output wire[13:0] bit_period);

reg next_dr;       //next state logic for data ready
reg dr_reg;        // status register for data ready
reg [1:0] next_err;   // next state logic for error
reg [1:0] err_reg;    // status register for error
reg [7:0] next_prdata;  // next state logic for prdata
reg [2:0] read_select;  // reading select line for mux
reg [2:0] write_select; // write select mux inputs
reg [3:0] next_ds_reg;  // next state logic for data_size
reg [3:0] ds_reg;      // status register for data_size
reg [13:0] next_bp_reg;  // next state logic for bit period
reg[13:0] bp_reg;      // status register for bit period


always_ff @(posedge clk, negedge n_rst) begin
    if (!n_rst) begin
        dr_reg <= '0;
        err_reg <= '0;
        prdata <= '0;
        ds_reg <= '0;
        bp_reg <= '0;
    end
    else begin
        dr_reg <= next_dr;
        err_reg <= next_err;
        prdata <= next_prdata;
        ds_reg <= next_ds_reg;
        bp_reg <= next_bp_reg;
    end
end


// combinational logic for next state logic of prdata
always_comb begin: PRDATA_NEXT_STATE_LOGIC
    next_prdata = prdata;
    case(read_select)
        3'b000: begin
            next_prdata = 8'd0;
        end
        3'b001: begin
            next_prdata = {7'd0,dr_reg};
        end

        3'b010: begin
            next_prdata = {6'd0,err_reg};
        end

        3'b011: begin
            if (data_size == 4'b0101) begin 
                next_prdata = {3'd0,rx_data[7:3]};
            end

            else if(data_size == 4'b0111) begin
                next_prdata = {1'b0,rx_data[7:1]};
            end

            else begin
                next_prdata = rx_data;
            end
        end

        3'b100: begin
            next_prdata = {2'd0,bp_reg[13:8]};
        end

        3'b101: begin
            next_prdata = bp_reg[7:0];
        end

        3'b110: begin
            next_prdata = {4'd0,ds_reg};
        end
    endcase
end

// combinational logic for next state logic for error input to mux for prdata
always_comb begin: PRDATA_ERROR_INPUT_NEXT_STATE_LOGIC
    next_err = err_reg;

    if(framing_error == 0 && overrun_error == 0) begin
        next_err = '0;
    end

    else if(framing_error == 1 && overrun_error == 0) begin
        next_err = 2'b01;
    end

    else if(overrun_error == 1 && framing_error == 0) begin
        next_err = 2'd2;
    end
end


// combinational logic for next state logic data_ready input to mux for prdata
always_comb begin: PRDAT_DATA_READY_INPUT_NEXT_STATE_LOGIC
    
    if(data_ready == 0) begin
        next_dr = 0;
    end

    else begin
        next_dr = 1;
    end
end


// combinational logic for next state logic for pwdata mux next state outputs
always_comb begin: PWDATA_WRITESELECT_MUX_NEXT_STATE_LOGIC
    
    if(write_select[0] == 1) begin
        next_ds_reg = pwdata;
    end

    else begin
        next_ds_reg = ds_reg;
    end

    if(write_select[1] == 1) begin
        next_bp_reg[13:8] = pwdata[5:0];
    end

    else begin
        next_bp_reg[13:8] = bp_reg[13:8];
    end

    if(write_select[2] == 1) begin
        next_bp_reg[7:0] = pwdata;
    end

    else begin
        next_bp_reg[7:0] = bp_reg[7:0];
    end

end


//combinational logic for address mapping
always_comb begin: ADDRESS_MAPPING
    data_read = 0;
    pslverr = 0;
    read_select = 3'b000;
    write_select = 3'b000;

    if(pwrite == 1) begin
        if((psel && penable) == 1) begin
            if(paddr == 3'b100) begin
                write_select = 3'b001;
            end

            else if(paddr == 3'b010) begin
                write_select = 3'b100;
            end

            else if(paddr == 3'b011) begin
                write_select = 3'b010;
            end

            else begin
                pslverr = 1;
            end
        end
    end

    if(pwrite == 0) begin
        if(psel == 1) begin
            if(paddr == 3'b000) begin
                read_select = 3'b001;
            end
            
            else if(paddr == 3'b001) begin
                read_select = 3'b010;
            end

            else if(paddr == 3'b110) begin
                read_select = 3'b011;
                data_read = 1;
            end

            else if(paddr == 3'b011) begin
                read_select = 3'b100;
            end

            else if(paddr == 3'b010) begin
                read_select = 3'b101;
            end

            else if(paddr == 3'b100) begin
                read_select = 3'b110;
            end
            
         //   else begin
         //       pslverr = 1;
         //   end
        end
    end
end


assign data_size = ds_reg;
assign bit_period = bp_reg;

endmodule
