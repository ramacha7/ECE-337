onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_clk
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_n_rst
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_test_case_num
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_test_data
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_check_tag
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_mismatch
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_hsel
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_htrans
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_haddr
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_hsize
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_hwrite
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_hwdata
add wave -noupdate -expand -group {TB variables} -radix unsigned /tb_ahb_lite_fir_filter/tb_hrdata
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_hresp
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_fir_out
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_modwait
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_err
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_coeff_num
add wave -noupdate -expand -group {TB variables} /tb_ahb_lite_fir_filter/tb_expected_hresp
add wave -noupdate -expand -group {TB variables} -radix unsigned /tb_ahb_lite_fir_filter/tb_expected_hrdata
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/clk
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/n_rst
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/one_k_samples
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/AHB/DR/state
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/hsel
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/haddr
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/hsize
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/htrans
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/hwrite
add wave -noupdate -expand -group {DUT variables} -radix decimal /tb_ahb_lite_fir_filter/DUT/hwdata
add wave -noupdate -expand -group {DUT variables} -radix unsigned /tb_ahb_lite_fir_filter/DUT/hrdata
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/hresp
add wave -noupdate -expand -group {DUT variables} -radix unsigned /tb_ahb_lite_fir_filter/DUT/sample_data
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/data_ready
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/new_coeff_set
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/coefficient_num
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/fir_coefficient
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/modwait
add wave -noupdate -expand -group {DUT variables} -radix decimal /tb_ahb_lite_fir_filter/DUT/fir_out
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/err
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_fir_filter/DUT/load_coeff
add wave -noupdate -expand -group {AHB_SLAVE REGISTERS} /tb_ahb_lite_fir_filter/DUT/AHB/sample_data_reg
add wave -noupdate -expand -group {AHB_SLAVE REGISTERS} /tb_ahb_lite_fir_filter/DUT/AHB/F0_coeff
add wave -noupdate -expand -group {AHB_SLAVE REGISTERS} /tb_ahb_lite_fir_filter/DUT/AHB/F1_coeff
add wave -noupdate -expand -group {AHB_SLAVE REGISTERS} /tb_ahb_lite_fir_filter/DUT/AHB/F2_coeff
add wave -noupdate -expand -group {AHB_SLAVE REGISTERS} /tb_ahb_lite_fir_filter/DUT/AHB/F3_coeff
add wave -noupdate -expand -group {AHB_SLAVE REGISTERS} /tb_ahb_lite_fir_filter/DUT/AHB/new_coeff_set
add wave -noupdate -expand -group {AHB_SLAVE REGISTERS} /tb_ahb_lite_fir_filter/DUT/AHB/status
add wave -noupdate -expand -group {AHB_SLAVE REGISTERS} /tb_ahb_lite_fir_filter/DUT/AHB/res
add wave -noupdate -expand -group {COEFF_LOAD VARIABLES} /tb_ahb_lite_fir_filter/DUT/LC/set
add wave -noupdate -expand -group {COEFF_LOAD VARIABLES} /tb_ahb_lite_fir_filter/DUT/LC/state
add wave -noupdate -expand -group {FIR_filter Variables} -expand /tb_ahb_lite_fir_filter/DUT/FIR/A3/RF/regs_matrix
add wave -noupdate -expand -group {FIR_filter Variables} /tb_ahb_lite_fir_filter/DUT/FIR/A1/state
add wave -noupdate -expand -group {FIR_filter Variables} /tb_ahb_lite_fir_filter/DUT/FIR/sample_data
add wave -noupdate -expand -group {FIR_filter Variables} /tb_ahb_lite_fir_filter/DUT/FIR/fir_coefficient
add wave -noupdate -expand -group {FIR_filter Variables} /tb_ahb_lite_fir_filter/DUT/FIR/load_coeff
add wave -noupdate -expand -group {FIR_filter Variables} /tb_ahb_lite_fir_filter/DUT/FIR/data_ready
add wave -noupdate -expand -group {FIR_filter Variables} /tb_ahb_lite_fir_filter/DUT/FIR/one_k_samples
add wave -noupdate -expand -group {FIR_filter Variables} /tb_ahb_lite_fir_filter/DUT/FIR/modwait
add wave -noupdate -expand -group {FIR_filter Variables} /tb_ahb_lite_fir_filter/DUT/FIR/fir_out
add wave -noupdate -expand -group {FIR_filter Variables} /tb_ahb_lite_fir_filter/DUT/FIR/err
add wave -noupdate -expand -group {FIR_filter Variables} /tb_ahb_lite_fir_filter/DUT/FIR/overflow
add wave -noupdate -expand -group {FIR_filter Variables} /tb_ahb_lite_fir_filter/DUT/FIR/cnt_up
add wave -noupdate -expand -group {FIR_filter Variables} /tb_ahb_lite_fir_filter/DUT/FIR/clear
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {948840 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 196
configure wave -valuecolwidth 146
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
WaveRestoreZoom {796623 ps} {1123378 ps}
