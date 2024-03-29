// ECE 337 lab2 2.1.2

module sensor_s
(
	input wire [3:0] sensors,
	output wire error
);
	wire lowpriority1;
	wire lowpriority2;
	wire lowpriority;

	AND2X1 A1 (.Y(lowpriority1),.A(sensors[1]),.B(sensors[2]));
	AND2X1 A2 (.Y(lowpriority2),.A(sensors[1]),.B(sensors[3]));
	OR2X1 O1 (.Y(lowpriority),.A(lowpriority1),.B(lowpriority2));
	OR2X1 O2 (.Y(error),.A(lowpriority),.B(sensors[0]));
		   
endmodule	
	


