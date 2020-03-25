// $Id: mg117
// File name:   adder_nbit.sv
// Created:     1/23/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: n-bit Full Adder Design

`timescale 1ns / 100ps

module adder_nbit
#(
	parameter BIT_WIDTH = 4
)
(
	input wire[(BIT_WIDTH-1):0] a,
	input wire[(BIT_WIDTH-1):0] b,
	input wire carry_in,
	output wire[(BIT_WIDTH-1):0] sum,
	output wire overflow
);

	wire[BIT_WIDTH:0] carrys;
	genvar i;
	assign carrys[0] = carry_in;
	generate
	for(i = 0; i < BIT_WIDTH; i = i+1) begin
		always @ (a[i],b[i],carry_in) begin
			assert((a[i] == 1'b1) || (a[i] == 1'b0))
			else $error("Input bit of 'a' is not a digital logic value");
		
			assert((b[i] == 1'b1) || (b[i] == 1'b0))
			else $error("Input bit of 'b' is not a digital logic value");
	
			assert((carrys[i] == 1'b1) || (carrys[i] == 1'b0))
			else $error("Input bit of 'carrys' is not a digital logic value");
		end
		adder_1bit IX (.a(a[i]),.b(b[i]),.carry_in(carrys[i]),.sum(sum[i]),.carry_out(carrys[i+1]));

		always @ (a[i],b[i],carrys[i]) begin
			#(2) assert (((a[i] + b[i] + carrys[i]) % 2) == sum[i])
			else $error("Output bit of 1 bit adder is not correct");
		end
	end

	endgenerate

	assign overflow = carrys[BIT_WIDTH];

endmodule
