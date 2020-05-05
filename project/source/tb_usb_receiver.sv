// $Id: $mg117
// File name:   tb_usb_receiver.sv
// Created:     04/22/2020
// Author:      Vignesh Ramachandran
// Lab Section: 4
// Version:     1.0  Initial Design Entry
// Description: TestBench for usb receiver design

`timescale 1ns / 10ps

module tb_usb_receiver();

  // Define parameters
  parameter CLK_PERIOD        = 10.41666667;
  parameter NORM_DATA_PERIOD  = (8 * CLK_PERIOD);
  
  localparam OUTPUT_CHECK_DELAY = (CLK_PERIOD - 0.2);
  localparam WORST_FAST_DATA_PERIOD = (NORM_DATA_PERIOD * 0.965);
  localparam WORST_SLOW_DATA_PERIOD = (NORM_DATA_PERIOD * 1.035);
  
  //  DUT inputs
  reg tb_clk;
  reg tb_n_rst;
  reg tb_d_plus;
  reg tb_d_minus;
  reg tb_r_enable;
  reg tb_set_r_enable;
  
  // DUT outputs
  wire [7:0] tb_r_data;
  wire tb_full;
  wire tb_empty;
  wire tb_rcving;
  wire tb_r_error;
  
  // Test bench debug signals
  // Overall test case number for reference
  integer tb_test_num;
  string  tb_test_case;
  // Test case 'inputs' used for test stimulus
  reg [7:0] tb_sync_byte;
  reg [2:0] tb_eop_packet;
  reg [7:0] tb_test_data;
  reg [7:0] tb_test_data2;
  //reg       tb_test_stop_bit;
  time       tb_test_bit_period;
  reg        tb_test_data_read;
  reg        tb_test_data_read2;
  // Test case expected output values for the test case
  reg [7:0] tb_expected_r_data;
  reg       tb_expected_full;
  reg       tb_expected_empty;
  reg       tb_expected_rcving;
  reg       tb_expected_r_error;
  
  // DUT portmap
  usb_receiver DUT
  (
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .d_plus(tb_d_plus),
    .d_minus(tb_d_minus),
    .r_enable(tb_r_enable),
    .r_data(tb_r_data),
    .empty(tb_empty),
    .full(tb_full),
    .rcving(tb_rcving),
    .r_error(tb_r_error)
  );
  
  // Tasks for regulating the timing of input stimulus to the design
  task send_packet;
    input  [7:0] data;
    input  [3:0] size;
    input  time data_period;
    
    integer i;
  begin
    // First synchronize to away from clock's rising edge
    @(negedge tb_clk)
    
    // Send start bit
   // tb_serial_in = 1'b0;
   // #data_period;
    
    // Send data bits
    for(i = 0; i < size; i = i + 1)
    begin
      tb_d_plus = data[i];
      tb_d_minus = ~data[i];
      #data_period;
    end
    
    // Send stop bit
   // tb_serial_in = stop_bit;
   // #data_period;
  end
  endtask
  
  task send_eop;
    input time data_period;

  begin
      @(negedge tb_clk);

      tb_d_plus = 1'b0;
      tb_d_minus = 1'b0;
      #data_period;

      tb_d_plus = 1'b0;
      tb_d_minus = 1'b0;
      #data_period;

      tb_d_plus = 1'b1;
      tb_d_minus = 1'b0;
      #data_period;

  end
  endtask

  task reset_dut;
  begin
    // Activate the design's reset (does not need to be synchronize with clock)
    tb_n_rst = 1'b0;
    
    // Wait for a couple clock cycles
    @(posedge tb_clk);
    @(posedge tb_clk);
    
    // Release the reset
    @(negedge tb_clk);
    tb_n_rst = 1;
    
    // Wait for a while before activating the design
    @(posedge tb_clk);
    @(posedge tb_clk);
  end
  endtask
  
  task check_outputs;
    //input assert_data_read;
  begin
    // Don't need to syncrhonize relative to clock edge for this design's outputs since they should have been stable for quite a while given the 2 Data Period gap between the end of the packet and when this should be used to check the outputs
    
    // Data recieved should match the data sent
    assert(tb_expected_r_data == tb_r_data)
      $info("Test case %0d: Test data correctly received", tb_test_num);
    else
      $error("Test case %0d: Test data was not correctly received", tb_test_num);
      
    // If and only if a proper stop bit is sent ('1') there shouldn't be a framing error.
    assert(tb_expected_full == tb_full)
      $info("Test case %0d: DUT correctly shows full", tb_test_num);
    else
      $error("Test case %0d: DUT incorrectly shows full", tb_test_num);
    
    // If and only if a proper stop bit is sent ('1') should there be 'data ready'
    assert(tb_expected_empty == tb_empty)
      $info("Test case %0d: DUT correctly asserted the empty flag", tb_test_num);
    else
      $error("Test case %0d: DUT did not correctly assert the empty flag", tb_test_num);

     // If and only if a proper stop bit is sent ('1') should there be 'data ready'
    assert(tb_expected_r_error == tb_r_error)
      $info("Test case %0d: DUT correctly asserted the r_error flag", tb_test_num);
    else
      $error("Test case %0d: DUT did not correctly assert the r_error flag", tb_test_num);
 
    // If and only if a proper stop bit is sent ('1') should there be 'data ready'
    assert(tb_expected_rcving == tb_rcving)
      $info("Test case %0d: DUT correctly asserted the rcving flag", tb_test_num);
    else
      $error("Test case %0d: DUT did not correctly assert the rcving flag", tb_test_num);
 
      
    // Check for the proper overrun error state for this test case
    /*if(1'b0 == tb_expected_overrun)
    begin
      assert(1'b0 == tb_overrun_error)
        $info("Test case %0d: DUT correctly shows no overrun error", tb_test_num);
      else
        $error("Test case %0d: DUT incorrectly shows an overrun error", tb_test_num);
    end
    else
    begin
      assert(1'b1 == tb_overrun_error)
        $info("Test case %0d: DUT correctly shows an overrun error", tb_test_num);
      else
        $error("Test case %0d: DUT incorrectly shows no overrun error", tb_test_num);
    end
    */


    // Handle the case of the test case asserting the data read signal
    /*if(1'b1 == assert_data_read)
    begin
      // Test case is supposed to have data read asserted -> check for proper handling
      // Should synchronize away from rising edge of clock for asserting this input.
      @(negedge tb_clk);
      
      // Activate the data read input 
      tb_data_read <= 1'b1;
      
      // Wait a clock cycle before checking for the flag to clear
      @(negedge tb_clk);
      tb_data_read <= 1'b0;
      
      // Check to see if the data ready flag cleared
      assert(1'b0 == tb_data_ready)
        $info("Test case %0d: DUT correctly cleared the data ready flag", tb_test_num);
      else
        $error("Test case %0d: DUT did not correctly clear the data ready flag", tb_test_num);
    end
    */
  end
  endtask
  
/*  always begin: R_ENABLE_SET
      tb_r_enable = 1'b0;
      if(tb_set_r_enable == 1'b1) begin
        @(posedge tb_clk);
        @(posedge tb_clk);
        tb_r_enable = 1;
        @(posedge tb_clk);
        tb_r_enable = 0;
      end
  end
*/


  always
  begin : CLK_GEN
    tb_clk = 1'b0;
    #(CLK_PERIOD / 2);
    tb_clk = 1'b1;
    #(CLK_PERIOD / 2);
  end

  // Actual test bench process
  initial
  begin : TEST_PROC
    // Initialize all test bench signals
    tb_test_num               = -1;
    tb_test_case              = "TB Init";
    tb_test_bit_period        = NORM_DATA_PERIOD;
    tb_expected_r_data       = '1;
    tb_expected_r_error      = 1'b0; 
    tb_expected_rcving       = 1'b0;
    tb_expected_full         = 1'b0;
    tb_expected_empty        = 1'b0;
    // Initilize all inputs to inactive/idle values
    tb_n_rst      = 1'b1; // Initially inactive
    tb_d_plus                 = 1'b1;
    tb_d_minus                = 1'b0;
    tb_r_enable               = 1'b0;
    //tb_set_r_enable           = 1'b0;
    
    // Get away from Time = 0
    #0.1; 
    
    // Test case 0: Basic Power on Reset
    tb_test_num  = 0;
    tb_test_case = "Power-on-Reset";
    
    // Power-on Reset Test case: Simply populate the expected outputs
    // These values don't matter since it's a reset test but really should be set to 'idle'/inactive values
    tb_d_plus = 1'b1 ;
    tb_d_minus = 1'b0;
    tb_test_bit_period  = NORM_DATA_PERIOD;
    
    // Define expected ouputs for this test case
    // Note: expected outputs should all be inactive/idle values
    // For a good packet RX Data value should match data sent
    tb_expected_r_data       = '1;
    // Valid stop bit ('1') -> Valid data -> Active data ready output
    tb_expected_r_error    = 1'b0; 
    // Framing error if and only if bad stop_bit ('0') was sent
    tb_expected_rcving = 1'b0;
    // Not intentionally creating an overrun condition -> overrun should be 0
    tb_expected_full       = 1'b0;
    
    tb_expected_empty =  1'b1;
    // DUT Reset
    reset_dut;
    
    // Check outputs
    check_outputs(); 

    // Test case 1: sending sync byte,1 byte of data and EOP
    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "SyncByte followed by EOP";
 
    tb_d_plus = 1'b1;
    tb_d_minus = 1'b0;
    tb_test_bit_period = NORM_DATA_PERIOD;

    reset_dut;

    send_packet(8'b00101010,4'd8, tb_test_bit_period);

    send_packet(8'b10101101,4'd8, tb_test_bit_period);

    send_eop(tb_test_bit_period);

    //Test Case 2: sending sync byte, less than 1 byte of data, then EOP
    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "SyncByte followed by bad EOP";
 
    tb_d_plus = 1'b1;
    tb_d_minus = 1'b0;
    tb_test_bit_period = NORM_DATA_PERIOD;

    reset_dut;

    send_packet(8'b00101010,4'd8, tb_test_bit_period);

    send_packet(5'b01101,4'd5, tb_test_bit_period);

    send_eop(tb_test_bit_period);

    //Test Case 3: sending wrong sync byte, then sending data, then sending correct sync byte, then correct data

    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "Wrong SyncByte followed by good Syncbyte";
 
    tb_d_plus = 1'b1;
    tb_d_minus = 1'b0;
    tb_test_bit_period = NORM_DATA_PERIOD;

    reset_dut;

    send_packet(8'b10101110,4'd8, tb_test_bit_period);    //sending wrong syncbyte

    send_packet(8'b10101101,4'd8, tb_test_bit_period);

    send_eop(tb_test_bit_period);

    send_packet(8'b00101010,4'd8,tb_test_bit_period);     // sending right syncbyte

    send_packet(8'b00101001,4'd8,tb_test_bit_period);  // 1st byte of data

   send_packet(8'b11001010,4'd8,tb_test_bit_period);   //2nd byte of data

    #(CLK_PERIOD);
    tb_r_enable = 1'b1;
    #(CLK_PERIOD);
    tb_r_enable = 1'b0;

    send_packet(8'b01011100,4'd8,tb_test_bit_period);  // 3rd byte of data

    #(CLK_PERIOD);
    tb_r_enable = 1'b1;
    #(CLK_PERIOD);
    tb_r_enable = 1'b0;
 
    send_eop(tb_test_bit_period);

    
    //Test 4: Good Syncbyte without data (Good EOP)

    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "Good SyncByte followed by EOP immediately";
 
    tb_d_plus = 1'b1;
    tb_d_minus = 1'b0;
    tb_test_bit_period = NORM_DATA_PERIOD;

    reset_dut;

    send_packet(8'b00101010,4'd8, tb_test_bit_period);    //sending wrong syncbyte

    send_eop(tb_test_bit_period);   //send eop

    //Test Case 5: sending wrong sync byte, then sending data, then sending correct sync byte, then correct data with faster clock

    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "Wrong SyncByte followed by good Syncbyte with faster clock";
 
    tb_d_plus = 1'b1;
    tb_d_minus = 1'b0;
    tb_test_bit_period = WORST_FAST_DATA_PERIOD;

    reset_dut;

    send_packet(8'b10101110,4'd8, tb_test_bit_period);    //sending wrong syncbyte

    send_packet(8'b10101101,4'd8, tb_test_bit_period);

    send_eop(tb_test_bit_period);

    send_packet(8'b00101010,4'd8,tb_test_bit_period);     // sending right syncbyte

    send_packet(8'b0110101,4'd8,tb_test_bit_period);  // 1st byte of data

   send_packet(8'b11101011,4'd8,tb_test_bit_period);   //2nd byte of data

    #(CLK_PERIOD);
    tb_r_enable = 1'b1;
    #(CLK_PERIOD);
    tb_r_enable = 1'b0;

    send_packet(8'b01011100,4'd8,tb_test_bit_period);  // 3rd byte of data

    #(CLK_PERIOD);
    tb_r_enable = 1'b1;
    #(CLK_PERIOD);
    tb_r_enable = 1'b0;
 
    send_eop(tb_test_bit_period);

    send_packet(8'b00101010,4'd8, tb_test_bit_period); //secnd good syncbyte

    send_packet(7'b1001101,4'd7, tb_test_bit_period);    // BAD EOP

    send_eop(tb_test_bit_period);

    //Test Case 6: sending right sync byte then right EOP with slower clock

    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "Wrong SyncByte followed by good Syncbyte with slower clock";
 
    tb_d_plus = 1'b1;
    tb_d_minus = 1'b0;
    tb_test_bit_period = WORST_SLOW_DATA_PERIOD;

    reset_dut;

    send_packet(8'b00101010,4'd8,tb_test_bit_period);     // sending right syncbyte

    send_packet(8'b0110101,4'd8,tb_test_bit_period);  // 1st byte of data

   send_packet(8'b11101011,4'd8,tb_test_bit_period);   //2nd byte of data


    send_packet(8'b01011100,4'd8,tb_test_bit_period);  // 3rd byte of data
    send_packet(8'b10110110,4'd8,tb_test_bit_period);  // 4th byte of data

    send_eop(tb_test_bit_period);


    #(CLK_PERIOD);
    tb_r_enable = 1'b1;
    #(CLK_PERIOD);
    tb_r_enable = 1'b0;
    

  end

endmodule
