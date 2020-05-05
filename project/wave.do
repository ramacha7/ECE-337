onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_clk
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_n_rst
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_d_plus
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_d_minus
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_full
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_empty
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_rcving
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_r_error
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_test_num
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_test_case
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_test_bit_period
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_expected_r_data
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_expected_full
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_expected_empty
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_expected_rcving
add wave -noupdate -expand -group TestBench /tb_usb_receiver/tb_expected_r_error
add wave -noupdate /tb_usb_receiver/DUT/d_plus_sync
add wave -noupdate /tb_usb_receiver/DUT/d_minus_sync
add wave -noupdate /tb_usb_receiver/DUT/TIM/shift_enable
add wave -noupdate /tb_usb_receiver/DUT/ED/d_edge
add wave -noupdate /tb_usb_receiver/DUT/EOP/eop
add wave -noupdate /tb_usb_receiver/DUT/DEC/d_orig
add wave -noupdate /tb_usb_receiver/DUT/TIM/rcving
add wave -noupdate /tb_usb_receiver/DUT/TIM/clear
add wave -noupdate /tb_usb_receiver/DUT/TIM/byte_received
add wave -noupdate /tb_usb_receiver/DUT/TIM/FC2/next_count
add wave -noupdate /tb_usb_receiver/DUT/TIM/count
add wave -noupdate /tb_usb_receiver/DUT/SR/rcv_data
add wave -noupdate /tb_usb_receiver/DUT/RCU/state
add wave -noupdate /tb_usb_receiver/DUT/RCU/r_error
add wave -noupdate /tb_usb_receiver/DUT/RCU/w_enable
add wave -noupdate /tb_usb_receiver/DUT/RX/r_data
add wave -noupdate /tb_usb_receiver/DUT/RX/w_data
add wave -noupdate /tb_usb_receiver/DUT/r_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3340909 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 218
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
WaveRestoreZoom {0 ps} {10500 ns}
