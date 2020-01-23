// $Id: mg117
// File name:   sensor_d.sv
// Created:     1/23/2020
// Author:      Vignesh Ramachandran
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Dataflow Style Sensor Error Dectector.

module sensor_d
(
	input wire[3:0] sensors,
	output wire error
);
	
	wire lowpriority;
	wire lowpriority1;
	wire lowpriority2;
	
	assign lowpriority1 = sensors[1] & sensors[2];
	assign lowpriority2 = sensors[1] & sensors[3];
	assign lowpriority = lowpriority1 | lowpriority2;
	assign error = lowpriority | sensors[0];

endmodule
