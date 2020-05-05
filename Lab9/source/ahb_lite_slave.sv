// $Id: $
// File name:   ahb_lite_slave.sv
// Created:     3/31/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Design of AHB slave

module ahb_lite_slave (input wire clk, input wire n_rst, input reg [1:0] set, output reg[15:0] sample_data, output reg data_ready, output reg new_coefficient_set, input reg[1:0] coefficient_num, output reg[15:0] fir_coefficient, input reg modwait, input reg[15:0] fir_out, input reg err, input reg hsel, input reg[3:0] haddr, input reg hsize, input reg [1:0] htrans, input reg hwrite, input reg[15:0] hwdata, output reg[15:0] hrdata, output reg hresp);

// Next state variables for hwdata
reg [15:0] next_sample_data;
reg [15:0] next_F0;
reg [15:0] next_F1;
reg [15:0] next_F2;
reg [15:0] next_F3;
reg [7:0] next_new_coeff;
reg [10:0] next_ws;

// Register output varaibles for hwdata
reg [15:0] sample_data_reg;
reg [15:0] F0_coeff;
reg [15:0] F1_coeff;
reg [15:0] F2_coeff;
reg [15:0] F3_coeff;
reg [7:0] new_coeff_set;
reg [10:0] ws;     // write select

//Next state variables for hrdata
//reg [15:0] next_hrdata;
reg [15:0] next_status;
reg [15:0] next_res;

// Register output variables for hrdata
reg [4:0] next_rs;
reg [15:0] status;
reg [15:0] res;
reg [4:0] rs;     //read select

reg dr;



// Assignment of output variables of ahb slave
always_comb begin
    sample_data = sample_data_reg;
    new_coefficient_set = new_coeff_set[0];
end

//Assignment of fir_coefficient variable going to FIR filter
always_comb begin
    if(coefficient_num == 2'd1) begin
        fir_coefficient = F1_coeff;
    end
    else if(coefficient_num == 2'd2) begin
        fir_coefficient = F2_coeff;
    end
    else if(coefficient_num == 2'd3) begin
        fir_coefficient = F3_coeff;
    end
    else begin
        fir_coefficient = F0_coeff;
    end
end

//Register block assignments
always_ff @ (posedge clk, negedge n_rst) begin
    if (!n_rst) begin
        //hrdata <= '0;
        res <= '0;
        rs <= '0;
        status <= '0;
        sample_data_reg <= '0;
        F0_coeff <= '0;
        F1_coeff <= '0;
        F2_coeff <= '0;
        F3_coeff <= '0;
        new_coeff_set <= '0;
        ws <= '0;
    end
    else begin
        //hrdata <= next_hrdata;
        res <= next_res;
        rs <= next_rs;
        status <= next_status;
        sample_data_reg <= next_sample_data;
        F0_coeff <= next_F0;
        F1_coeff <= next_F1;
        F2_coeff <= next_F2;
        F3_coeff <= next_F3;
        if(set == 2'd0) begin
            new_coeff_set <= 8'd0;
        end
        else begin
            new_coeff_set <= next_new_coeff;
        end
        ws <= next_ws;
    end
end

dr_controller DR (.clk(clk), .n_rst(n_rst), .dr(dr), .modwait(modwait), .data_ready(data_ready));

//Address mapping block combinational logic
always_comb begin
    next_rs = '0;
    next_ws = '0;
    hresp = '0;
    dr = '0;

    if (hsel == 1 && htrans == 2) begin
        // IF the transaction is a write transaction
        if (hwrite == 1) begin
            //IF the size of data to write is 16 bits
            if (hsize == 1) begin
                if(haddr == 4'd4 || haddr == 4'd5) begin
                    next_ws = 11'b00000000011;
                    dr = 1;
                end
                else if (haddr == 4'd6 || haddr == 4'd7) begin
                    next_ws = 11'b00000001100;
                end
                else if (haddr == 4'd8 || haddr == 4'd9) begin
                    next_ws = 11'b00000110000;
                end
                else if (haddr == 4'd10 || haddr == 4'd11) begin
                    next_ws = 11'b00011000000;
                end
                else if(haddr == 4'd12 || haddr == 4'd13) begin
                    next_ws = 11'b01100000000;
                end
                else if (haddr == 4'd14) begin
                    next_ws = 11'b10000000000;
                end
                else begin
                    hresp = 1;
                end
            end
            
            // IF the size of the data to write is 8 bits
            else begin
                if (haddr == 4'd4) begin
                    next_ws = 11'b00000000001;
                    dr = 1;
                end
                else if (haddr == 4'd5) begin
                    next_ws = 11'b00000000010;
                    dr = 1;
                end
                else if (haddr == 4'd6) begin
                    next_ws = 11'b00000000100;
                end
                else if (haddr == 4'd7) begin
                    next_ws = 11'b00000001000;
                end
                else if (haddr == 4'd8) begin
                    next_ws = 11'b00000010000;
                end
                else if (haddr == 4'd9) begin
                    next_ws = 11'b00000100000;
                end
                else if (haddr == 4'd10) begin
                    next_ws = 11'b00001000000;
                end
                else if (haddr == 4'd11) begin
                    next_ws = 11'b00010000000;
                end
                else if (haddr == 4'd12) begin
                    next_ws = 11'b00100000000;
                end
                else if (haddr == 4'd13) begin
                    next_ws = 11'b01000000000;
                end
                else if (haddr == 4'd14) begin
                    next_ws = 11'b10000000000;
                end
                else begin
                    hresp = 1;
                end
            end
        end
    
        //IF the transaction is a read transaction

        else begin
            //IF the data to read is 16 bits
            if (hsize == 1) begin
                if (haddr == 4'd0 || haddr == 4'd1) begin
                    next_rs = 5'b00001;
                end
                else if (haddr == 4'd2 || haddr == 4'd3) begin
                    next_rs = 5'b00010;
                end
                else if (haddr == 4'd4 || haddr == 4'd5) begin
                    next_rs = 5'b00011;
                end
                else if (haddr == 4'd6 || haddr == 4'd7) begin
                    next_rs = 5'b00100;
                end
                else if (haddr == 4'd8 || haddr == 4'd9) begin
                    next_rs = 5'b00101;
                end
                else if (haddr == 4'd10 || haddr == 4'd11) begin
                    next_rs = 5'b00110;
                end
                else if (haddr == 4'd12 || haddr == 4'd13) begin
                    next_rs = 5'b00111;
                end
                else if (haddr == 4'd14) begin
                    next_rs = 5'b01000;
                end
                else begin
                    hresp = 1'b1;
                end
            end

            //IF the data to read is 8 bits
            else begin
                if (haddr == 4'd0) begin
                    next_rs = 5'b10001;
                end
                else if(haddr == 4'd1) begin
                    next_rs = 5'b10010;
                end
                else if(haddr == 4'd2) begin
                    next_rs = 5'b10011;
                end
                else if(haddr == 4'd3) begin
                    next_rs = 5'b10100;
                end
                else if(haddr == 4'd4) begin
                    next_rs = 5'b10101;
                end
                else if(haddr == 4'd5) begin
                    next_rs = 5'b10110;
                end
                else if(haddr == 4'd6) begin
                    next_rs = 5'b10111;
                end
                else if(haddr == 4'd7) begin
                    next_rs = 5'b11000;
                end
                else if(haddr == 4'd8) begin
                    next_rs = 5'b11001;
                end
                else if(haddr == 4'd9) begin
                    next_rs = 5'b11010;
                end
                else if(haddr == 4'd10) begin
                    next_rs = 5'b11011;
                end
                else if(haddr == 4'd11) begin
                    next_rs = 5'b11100;
                end
                else if(haddr == 4'd12) begin
                    next_rs = 5'b11101;
                end
                else if(haddr == 4'd13) begin
                    next_rs = 5'b11110;
                end
                else if(haddr == 4'd14) begin
                    next_rs = 5'b11111;
                end
                else begin
                    hresp = 1'b1;
                end
            end
        end 
    end

end

// Combinational block for status register
always_comb begin
    next_status = 16'd0;
    if(modwait == 0 && err == 0 && set == 2'd2) begin
        next_status = 16'd0;
    end
    else if((set == 2'd1 || modwait == 1) && err == 0) begin
        next_status = 16'd1;
    end
    else if(err == 1) begin
        next_status = 16'd256;
    end
end


//Combinational block for result register
always_comb begin
    next_res = fir_out;
end

//Combinational Logic to set hwdata to corresponding register based on write select
always_comb begin
    next_sample_data = sample_data_reg;
    next_F0 = F0_coeff;
    next_F1 = F1_coeff;
    next_F2 = F2_coeff;
    next_F3 = F3_coeff;
    next_new_coeff = new_coeff_set;

    case(ws)
        11'b00000000011: begin
            next_sample_data = hwdata;
        end
        11'b00000001100: begin
            next_F0 = hwdata;
        end
        11'b00000110000: begin
            next_F1 = hwdata;
        end
        11'b00011000000: begin
            next_F2 = hwdata;
        end
        11'b01100000000: begin
            next_F3 = hwdata;
        end
        11'b10000000000: begin
            next_new_coeff = hwdata[7:0];
        end
        11'b00000000001: begin
            next_sample_data[7:0] = hwdata[7:0];
        end
        11'b00000000010: begin
            next_sample_data[15:8] = hwdata[15:8];
        end
        11'b00000000100: begin
            next_F0[7:0] = hwdata[7:0];
        end
        11'b00000001000: begin
            next_F0[15:8] = hwdata[15:8];
        end
        11'b00000010000: begin
            next_F1[7:0] = hwdata[7:0];
        end
        11'b00000100000: begin
            next_F1[15:8] = hwdata[15:8];
        end
        11'b00001000000: begin
            next_F2[7:0] = hwdata[7:0];
        end
        11'b00010000000: begin
            next_F2[15:8] = hwdata[15:8];
        end
        11'b00100000000: begin
            next_F3[7:0] = hwdata[7:0];
        end
        11'b01000000000: begin
            next_F3[15:8] = hwdata[15:8];
        end
        /*11'b10000000000: begin
            next_new_coeff = hwdata[7:0];
        end*/
    endcase
end


//Combinational Logic to set hrdata to corresponding register based on read select
always_comb begin
    hrdata = '0;
    case(rs)
        5'b00001: begin
            hrdata = status;
        end
        5'b00010: begin
            hrdata = res;
        end
        5'b00011: begin
            hrdata = sample_data_reg;
        end
        5'b00100: begin
            hrdata = F0_coeff;
        end
        5'b00101: begin
            hrdata = F1_coeff;
        end
        5'b00110: begin
            hrdata = F2_coeff;
        end
        5'b00111: begin
            hrdata = F3_coeff;
        end
        5'b01000: begin
            hrdata = {8'd0,new_coeff_set};
        end
        5'b10001: begin
            hrdata = {8'd0,status[7:0]};
        end
        5'b10010: begin
            hrdata = {status[15:8],8'd0};
        end
        5'b10011: begin
            hrdata = {8'd0,res[7:0]};
        end
        5'b10100: begin
            hrdata = {res[15:8],8'd0};
        end
        5'b10101: begin
            hrdata = {8'd0,sample_data_reg[7:0]};
        end
        5'b10110: begin
            hrdata = {sample_data_reg[15:8],8'd0};
        end
        5'b10111: begin
            hrdata = {8'd0,F0_coeff[7:0]};
        end
        5'b11000: begin
            hrdata = {F0_coeff[15:8],8'd0};;
        end
        5'b11001: begin
            hrdata = {8'd0,F1_coeff[7:0]};
        end
        5'b11010: begin
            hrdata = {F1_coeff[15:8],8'd0};
        end
        5'b11011: begin
            hrdata = {8'd0,F2_coeff[7:0]};
        end
        5'b11100: begin
            hrdata = {F2_coeff[15:8], 8'd0};
        end
        5'b11101: begin
            hrdata = {8'd0,F3_coeff[7:0]};
        end
        5'b11110: begin
            hrdata = {F3_coeff[15:8],8'd0};
        end
        5'b11111: begin
            hrdata = {8'd0,new_coeff_set};
        end
    endcase
end


endmodule
