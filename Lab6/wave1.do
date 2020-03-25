onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold /tb_rcv_block/tb_clk
add wave -noupdate -color Gold /tb_rcv_block/tb_n_rst
add wave -noupdate -color Gold /tb_rcv_block/tb_serial_in
add wave -noupdate -color Gold /tb_rcv_block/DUT/A3/shift_enable
add wave -noupdate -color Gold /tb_rcv_block/DUT/A1/start_bit_detected
add wave -noupdate -color Gold /tb_rcv_block/DUT/A3/C1/rollover_flag
add wave -noupdate -group tb_variables -color {Dark Orchid} /tb_rcv_block/tb_data_read
add wave -noupdate -group tb_variables -color {Dark Orchid} /tb_rcv_block/tb_test_num
add wave -noupdate -group tb_variables -color {Dark Orchid} /tb_rcv_block/tb_test_data
add wave -noupdate -group tb_variables -color {Dark Orchid} /tb_rcv_block/tb_test_stop_bit
add wave -noupdate -group tb_variables -color {Dark Orchid} /tb_rcv_block/tb_test_bit_period
add wave -noupdate -group tb_variables -color {Dark Orchid} /tb_rcv_block/tb_test_data_read
add wave -noupdate -group rx_data -color {Spring Green} /tb_rcv_block/tb_rx_data
add wave -noupdate -group rx_data -color {Spring Green} /tb_rcv_block/tb_expected_rx_data
add wave -noupdate -group framing_error -color Maroon /tb_rcv_block/tb_framing_error
add wave -noupdate -group framing_error -color Maroon /tb_rcv_block/tb_expected_framing_error
add wave -noupdate -group data_ready -color Orange /tb_rcv_block/tb_data_ready
add wave -noupdate -group data_ready -color Orange /tb_rcv_block/tb_expected_data_ready
add wave -noupdate -group overrun_error /tb_rcv_block/tb_overrun_error
add wave -noupdate -group overrun_error /tb_rcv_block/tb_expected_overrun
add wave -noupdate -expand -group RCV_outputs -color Wheat /tb_rcv_block/DUT/A2/sbc_clear
add wave -noupdate -expand -group RCV_outputs -color Wheat /tb_rcv_block/DUT/A2/sbc_enable
add wave -noupdate -expand -group RCV_outputs -color Wheat /tb_rcv_block/DUT/A2/load_buffer
add wave -noupdate -expand -group RCV_outputs -color Wheat /tb_rcv_block/DUT/A2/enable_timer
add wave -noupdate -group RCV_inputs -color Sienna /tb_rcv_block/DUT/A2/packet_done
add wave -noupdate -group RCV_inputs -color Sienna /tb_rcv_block/DUT/A2/new_packet_detected
add wave -noupdate /tb_rcv_block/DUT/A4/packet_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {299289 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 245
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
configure wave -timelineunits ns
update
WaveRestoreZoom {199163 ps} {200045 ps}
