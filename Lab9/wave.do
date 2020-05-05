onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_slave/tb_test_case
add wave -noupdate /tb_ahb_lite_slave/tb_test_case_num
add wave -noupdate /tb_ahb_lite_slave/tb_test_data
add wave -noupdate /tb_ahb_lite_slave/tb_check_tag
add wave -noupdate /tb_ahb_lite_slave/tb_mismatch
add wave -noupdate /tb_ahb_lite_slave/tb_check
add wave -noupdate /tb_ahb_lite_slave/tb_clk
add wave -noupdate /tb_ahb_lite_slave/tb_n_rst
add wave -noupdate /tb_ahb_lite_slave/tb_hresp
add wave -noupdate /tb_ahb_lite_slave/tb_fir_out
add wave -noupdate /tb_ahb_lite_slave/tb_modwait
add wave -noupdate /tb_ahb_lite_slave/tb_err
add wave -noupdate /tb_ahb_lite_slave/tb_coeff_num
add wave -noupdate /tb_ahb_lite_slave/tb_hsel
add wave -noupdate /tb_ahb_lite_slave/tb_htrans
add wave -noupdate /tb_ahb_lite_slave/tb_hsize
add wave -noupdate /tb_ahb_lite_slave/tb_hwrite
add wave -noupdate /tb_ahb_lite_slave/tb_haddr
add wave -noupdate /tb_ahb_lite_slave/tb_hwdata
add wave -noupdate /tb_ahb_lite_slave/tb_hrdata
add wave -noupdate /tb_ahb_lite_slave/tb_sample_data
add wave -noupdate /tb_ahb_lite_slave/tb_data_ready
add wave -noupdate /tb_ahb_lite_slave/tb_new_coeff_set
add wave -noupdate /tb_ahb_lite_slave/tb_fir_coefficient
add wave -noupdate /tb_ahb_lite_slave/tb_expected_data_ready
add wave -noupdate /tb_ahb_lite_slave/tb_expected_sample
add wave -noupdate /tb_ahb_lite_slave/tb_expected_new_coeff_set
add wave -noupdate /tb_ahb_lite_slave/tb_expected_coeff
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_slave/DUT/ws
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_slave/DUT/rs
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_slave/DUT/F0_coeff
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_slave/DUT/F1_coeff
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_slave/DUT/F2_coeff
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_slave/DUT/F3_coeff
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_slave/DUT/sample_data_reg
add wave -noupdate -expand -group {DUT variables} /tb_ahb_lite_slave/DUT/new_coeff_set
add wave -noupdate /tb_ahb_lite_slave/DUT/next_hrdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {236388 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 200
configure wave -valuecolwidth 165
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
WaveRestoreZoom {0 ps} {472317 ps}
