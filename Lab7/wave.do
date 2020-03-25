onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Testbench
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_clk
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_n_reset
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_data_ready
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_load_coeff
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_sample
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_coeff
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_one_k_samples
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_modwait
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_err
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} -radix unsigned /tb_fir_filter/tb_fir_out
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_test_case_num
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_test_sample_num
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_std_test_case
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} -radix unsigned /tb_fir_filter/tb_expected_fir_out
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_expected_err
add wave -noupdate -expand -group {Testbench variables} -color {Medium Slate Blue} /tb_fir_filter/tb_expected_one_k_samples
add wave -noupdate -color {Sky Blue} -subitemconfig {{/tb_fir_filter/DUT/A3/RF/regs_matrix[15]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[14]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[13]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[12]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[11]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[10]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[9]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[8]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[7]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[6]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[5]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[4]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[3]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[2]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[1]} {-color {Sky Blue}} {/tb_fir_filter/DUT/A3/RF/regs_matrix[0]} {-color {Sky Blue}}} /tb_fir_filter/DUT/A3/RF/regs_matrix
add wave -noupdate -divider Datapath
add wave -noupdate -expand -group {Datapath variables} -color Firebrick /tb_fir_filter/DUT/A3/outreg_data
add wave -noupdate -expand -group {Datapath variables} -color Firebrick /tb_fir_filter/DUT/A3/overflow
add wave -noupdate -expand -group {Datapath variables} -color Firebrick /tb_fir_filter/DUT/A3/alu_op
add wave -noupdate -expand -group {Datapath variables} -color Firebrick /tb_fir_filter/DUT/A3/w_data_sel
add wave -noupdate -expand -group {Datapath variables} -color Firebrick /tb_fir_filter/DUT/A3/alu_result
add wave -noupdate -expand -group {Datapath variables} -color Firebrick /tb_fir_filter/DUT/A3/src1_data
add wave -noupdate -expand -group {Datapath variables} -color Firebrick /tb_fir_filter/DUT/A3/src2_data
add wave -noupdate -expand -group {Datapath variables} -color Firebrick /tb_fir_filter/DUT/A3/dest_data
add wave -noupdate -divider {State Machine}
add wave -noupdate -expand -group STATES -color {Dark Orchid} /tb_fir_filter/DUT/A1/state
add wave -noupdate -expand -group STATES -color {Dark Orchid} /tb_fir_filter/DUT/A1/next_state
add wave -noupdate -divider Counter
add wave -noupdate -expand -group Counter_output -color Gold /tb_fir_filter/DUT/A2/C1/count_out
add wave -noupdate -expand -group Counter_output -color Gold /tb_fir_filter/DUT/A2/C1/rollover_flag
add wave -noupdate -divider Magnitude
add wave -noupdate -expand -group Magnitude_variables -color Pink /tb_fir_filter/DUT/A4/out
add wave -noupdate -divider DUT
add wave -noupdate -expand -group DUT_variables -color {Spring Green} /tb_fir_filter/DUT/one_k_samples
add wave -noupdate -expand -group DUT_variables -color {Spring Green} /tb_fir_filter/DUT/modwait
add wave -noupdate -expand -group DUT_variables -color {Spring Green} -radix unsigned /tb_fir_filter/DUT/fir_out
add wave -noupdate -expand -group DUT_variables -color {Spring Green} /tb_fir_filter/DUT/err
add wave -noupdate -expand -group DUT_variables -color {Spring Green} /tb_fir_filter/DUT/overflow
add wave -noupdate -expand -group DUT_variables -color {Spring Green} /tb_fir_filter/DUT/cnt_up
add wave -noupdate -expand -group DUT_variables -color {Spring Green} /tb_fir_filter/DUT/clear
add wave -noupdate -expand -group DUT_variables -color {Spring Green} /tb_fir_filter/DUT/op
add wave -noupdate -expand -group DUT_variables -color {Spring Green} /tb_fir_filter/DUT/src1
add wave -noupdate -expand -group DUT_variables -color {Spring Green} /tb_fir_filter/DUT/src2
add wave -noupdate -expand -group DUT_variables -color {Spring Green} /tb_fir_filter/DUT/dest
add wave -noupdate -expand -group DUT_variables -color {Spring Green} /tb_fir_filter/DUT/result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4565000 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 242
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {4258948 ps} {4969847 ps}
