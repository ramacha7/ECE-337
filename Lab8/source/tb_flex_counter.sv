// 337 TA Provided Lab 4 Testbench
// This code serves as a starer test bench for the Flex Counter design
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

// 0.5um D-FlipFlop Timing Data Estimates:
// Data Propagation delay (clk->Q): 670ps
// Setup time for data relative to clock: 190ps
// Hold time for data relative to clock: 10ps

`timescale 1ns / 10ps

module tb_flex_counter();

  // Define local parameters used by the test bench
  localparam  NUM_CNT_BITS  = 4;
  localparam  CLK_PERIOD    = 10;
  localparam  FF_SETUP_TIME = 0.190;
  localparam  FF_HOLD_TIME  = 0.100;
  localparam  CHECK_DELAY   = (CLK_PERIOD - FF_SETUP_TIME); // Check right before the setup time starts
  
  localparam  INACTIVE_VALUE     = 1'b0;
  localparam  RESET_OUTPUT_VALUE = INACTIVE_VALUE;
  
  // Declare DUT portmap signals
  reg tb_clk;
  reg tb_n_rst;
  reg tb_clear;
  reg tb_count_enable;
  reg [NUM_CNT_BITS-1:0] tb_rollover_val;
  reg [NUM_CNT_BITS-1:0] tb_count_out;
  reg tb_rollover_flag;
  
  // Declare test bench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;
  
  // Task for standard DUT reset procedure
  task reset_dut;
  begin
    // Activate the reset
    tb_n_rst = 1'b0;

    // Maintain the reset for more than one cycle
    @(posedge tb_clk);
    @(posedge tb_clk);

    // Wait until safely away from rising edge of the clock before releasing
    @(negedge tb_clk);
    tb_n_rst = 1'b1;

    // Leave out of reset for a couple cycles before allowing other stimulus
    // Wait for negative clock edges, 
    // since inputs to DUT should normally be applied away from rising clock edges
    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask

  task clr_dut;
  begin
    // Activate the reset
    @(negedge tb_clk);
    tb_clear = 1'b1;

    // Maintain the reset for more than one cycle
    @(posedge tb_clk);
    @(posedge tb_clk);

    // Wait until safely away from rising edge of the clock before releasing
    @(negedge tb_clk);
    tb_clear = 1'b0;

    // Leave out of reset for a couple cycles before allowing other stimulus
    // Wait for negative clock edges, 
    // since inputs to DUT should normally be applied away from rising clock edges
  end
  endtask


  // Task to cleanly and consistently check DUT output values
  task check_output;
    input logic[NUM_CNT_BITS-1:0]  expected_value1;
    input logic expected_value2;
    input string check_tag;
  begin
    if(expected_value1 == tb_count_out) begin // Check passed
      $info("Correct count value %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect count value %s during %s test case", check_tag, tb_test_case);
    end

    if(expected_value2 == tb_rollover_flag) begin // Check passed
      $info("Correct rollover flag value %s during %s test case", check_tag, tb_test_case);
    end
 
    else begin // Check failed
      $error("Incorrect rollover flag value %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask

  // Task to cleanly and consistently check for correct values during MetaStability Test Cases
  task check_output_meta;
    input string check_tag;
  begin
    // Only need to check that it's not a metastable value since decays are random
    if((1'b1 == tb_count_out) || (1'b0 == tb_count_out)) begin // Check passed
      $info("Correct synchronizer output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect synchronizer output %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask

  // Clock generation block
  always
  begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end
  
  // DUT Port map
  flex_counter DUT(.clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear), .count_enable(tb_count_enable), .rollover_val(tb_rollover_val),.count_out(tb_count_out), .rollover_flag(tb_rollover_flag));
  
  // Test bench main process
  initial
  begin
    // Initialize all of the test inputs
    tb_n_rst  = 1'b1;              // Initialize to be inactive
   // tb_count_out  = INACTIVE_VALUE; // Initialize input to inactive  value
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    tb_rollover_val = 4'b0101;

    tb_test_num = 0;               // Initialize test case counter
    tb_test_case = "Test bench initializaton";
    tb_stream_test_num = 0;
    tb_stream_check_tag = "N/A";
    // Wait some time before starting first test case
    #(0.1);
    
    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    //tb_async_in  = INACTIVE_VALUE; // Set to be the the non-reset value
    tb_n_rst  = 1'b0;    // Activate reset
     @(negedge tb_clk);
   
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    check_output( RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, 
                  "after reset applied");
    
    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    check_output( RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, 
                  "after clock cycle while in reset");
    
    // Release the reset away from a clock edge
    @(posedge tb_clk);
    #(2 * FF_HOLD_TIME);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    #0.1;
    // Check that internal state was correctly keep after reset release
    check_output( RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, 
                  "after reset was released");


    // ************************************************************************
    // Test Case 2: Rollover for rollover value not a power of two
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Rollover for rollover value of 5";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    reset_dut();

//    clr_dut();
    // Assign test case stimulus

    @(negedge tb_clk);
    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'b0101;


    repeat(17)
        @(posedge tb_clk);

    #(CHECK_DELAY);

    // Check results
    check_output( 4'b0010,1'b0,
                  "after processing delay");


    // ************************************************************************    
    // Test Case 3: Discontinuous counting
    // ************************************************************************
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Discontinuous counting";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear = INACTIVE_VALUE;
    tb_rollover_val = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    reset_dut();
    #(1);

    //clr_dut();
    // Handle setup violation test case stimulus
    // Timing violations require value transisitions on input
    // -> Need to start with input at oppositte value of main stimulus
    // Allow value to feed in to design
    @(posedge tb_clk);
    // Wait until test is inside the setup time before the next rising clock edge
    #(CLK_PERIOD - (FF_SETUP_TIME * 0.5)); 
    // Change the input value
    @(negedge tb_clk);
    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'b0101;

    // Wait for DUT to process the stimulus
    @(posedge tb_clk); 
    @(posedge tb_clk); 
    @(posedge tb_clk);
    // Move away from risign edge and allow for propagation delays before checking
    @(negedge tb_clk);
    tb_count_enable = 1'b0;

    @(posedge tb_clk); 
    @(posedge tb_clk);

    #(CHECK_DELAY);
    check_output(4'b0011,1'b0,"After clearing value is 3");

    @(negedge tb_clk);
    tb_count_enable = 1'b1;
    // Move away from risign edge and allow for propagation delays before checking
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    #(CHECK_DELAY);
    //check_output_meta("after processing delay");
    check_output(4'b0001,1'b0,"After clearing when count value is 1");


    // ************************************************************************
    // Test Case 4: Clear vs count_enable priority
    // ************************************************************************
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "clear vs count_enable priority";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear = INACTIVE_VALUE;
    tb_rollover_val = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    reset_dut();
    #(0.1);

    //clr_dut();
    // Handle setup violation test case stimulus
    // Timing violations require value transisitions on input
    // -> Need to start with input at oppositte value of main stimulus
    // Allow value to feed in to design
    @(posedge tb_clk);
    // Wait until test is inside the setup time before the next rising clock edge
    #(CLK_PERIOD - (FF_SETUP_TIME * 0.5)); 
    // Change the input value
    @(negedge tb_clk);
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'b0101;
    tb_count_enable = 1'b1;

    // Wait for DUT to process the stimulus
    @(posedge tb_clk); 
    @(posedge tb_clk); 
    @(posedge tb_clk);
    // Move away from risign edge and allow for propagation delays before checking

  //  @(negedge tb_clk);
  //  tb_clear = 1'b1;
    clr_dut();
    @(posedge tb_clk); 
    @(posedge tb_clk);
    @(posedge tb_clk);

    #(CHECK_DELAY)
    check_output(4'b0011,1'b0,"Showing priority of clear over count_enable");

   // @(negedge tb_clk);
   // tb_clear = 1'b0;
    // Move away from risign edge and allow for propagation delays before checking
   // @(posedge tb_clk);
   // @(posedge tb_clk);
   // @(posedge tb_clk);

    //check_output(4'b0011,1'b0,"After showing priority count up to 3");


    // ************************************************************************
    // Test Case 5: Rollover for rollover value of 14
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Rollover for rollover value of 14";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    reset_dut();

//    clr_dut();
    // Assign test case stimulus

    @(negedge tb_clk);
    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'b1110;


    repeat(17)
        @(posedge tb_clk);

    #(CHECK_DELAY);

    // Check results
    check_output( 4'b0011,1'b0,
                  "after processing delay");


    // ************************************************************************
    // Test Case 6: Rollover for rollover value 1
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Rollover for rollover value of 1";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    reset_dut();

//    clr_dut();
    // Assign test case stimulus

    @(negedge tb_clk);
    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'b0001;


    repeat(3)
        @(posedge tb_clk);

    #(CHECK_DELAY);

    // Check results
    check_output( 4'b001,1'b1,
                  "after processing delay");




/*
    // ************************************************************************    
    // Test Case 5: Changed roll over value to 15'
    // ************************************************************************
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Setup Violation with Input as a '1'";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_async_in = INACTIVE_VALUE;
    reset_dut();

    // Handle setup violation test case stimulus
    // Timing violations require value transisitions on input
    // -> Need to start with input at oppositte value of main stimulus
    tb_async_in = 1'b0;
    // Allow value to feed in to design
    @(posedge tb_clk);
    // Wait until test is inside the setup time before the next rising clock edge
    #(CLK_PERIOD - (FF_SETUP_TIME * 0.5)); 
    // Change the input value
    tb_async_in = 1'b1;

    // Wait for DUT to process the stimulus
    @(posedge tb_clk); 
    @(posedge tb_clk); 
    // Move away from risign edge and allow for propagation delays before checking
    #(CHECK_DELAY);
    check_output_meta("after processing delay");
    
    // ************************************************************************
    // Test Case 6: Hold Violation with Input as a '0'
    // ************************************************************************
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Hold Violation with Input as a '1'";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_async_in = INACTIVE_VALUE;
    reset_dut();

    // Handle hold violation test case stimulus
    // Timing violations require value transisitions on input
    // -> Need to start with input at oppositte value of main stimulus
    tb_async_in = 1'b1;
    // Allow value to feed in to design
    @(posedge tb_clk);
    // Wait until test is inside the hold time after the current rising clock edge
    #(FF_HOLD_TIME * 0.5);
    // Change the input value 
    tb_async_in = 1'b0;

    // Wait for DUT to process the stimulus
    // ***********************************************************************
    // Test CASE 7: Normal Operation with Input as '0'
    // **********************************************************************

    // STUDENT: Add your additional test cases here
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Normal Operation with Input as a '0'";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_async_in = INACTIVE_VALUE;
    reset_dut();

    // Assign test case stimulus
    tb_async_in = 1'b0;

    // Wait for DUT to process stimulus before checking results
    @(posedge tb_clk); 
    @(posedge tb_clk); 
    // Move away from risign edge and allow for propagation delays before checking
    #(CHECK_DELAY);
    // Check results
    check_output( 1'b0,
                  "after processing delay");

    // ************************************************************************
    // Last Test Case: Steady Stream of Unkown/Metastable inputs 
    //                to showcase random decay behavior
    // ************************************************************************
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Steady Stream of Metastable inputs";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_async_in = INACTIVE_VALUE;
    reset_dut();

    // Synchronize away from rising edges to avoid accidental timing violations
    @(negedge tb_clk);
    // Set the value to be metastable 
    tb_async_in = 1'bx;
    // Wait for metastable input to get pulled in by the first stage
    @(posedge tb_clk);

    // Run for a long time to check for/demonstrate random nature of metastable decays
    for(tb_stream_test_num = 1; tb_stream_test_num <= 100; tb_stream_test_num = tb_stream_test_num + 1)
    begin
      // Update the tag for the current stream iteration
      $sformat(tb_stream_check_tag, "for stream iteration %d", tb_stream_test_num);
      // Allow second stage to pull decayed value
      @(posedge tb_clk);
      // Move away from risign edge and allow for propagation delays before checking
      @(posedge tb_clk); 
      #(CHECK_DELAY);
      check_output_meta(tb_stream_check_tag);
    end
    */
  end
endmodule
