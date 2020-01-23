// $Id: mg117
// File name:   sensor_b.sv
// Created:     1/23/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Behavioral Style Sensor Error Dectector

module sensor_b
(
	input reg[3:0] sensors,
	output reg error
);

	reg lowpriority;
	reg lowpriority1;
	reg lowpriority2;

	always_comb
	begin
		lowpriority1 = sensors[1] & sensors[2];
		lowpriority2 = sensors[1] & sensors[3];
		lowpriority = lowpriority1 | lowpriority2;
		error = lowpriority | sensors[0];
	end
endmodule 
