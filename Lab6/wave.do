onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold /tb_rcv_block/tb_clk
add wave -noupdate -color Gold /tb_rcv_block/tb_n_rst
add wave -noupdate -color Gold /tb_rcv_block/tb_serial_in
add wave -noupdate -color Gold /tb_rcv_block/DUT/A1/start_bit_detected
add wave -noupdate -color Gold /tb_rcv_block/DUT/A3/C1/rollover_flag
add wave -noupdate -expand -group tb_variables -color {Dark Orchid} /tb_rcv_block/tb_data_read
add wave -noupdate -expand -group tb_variables -color {Dark Orchid} -subitemconfig {{/tb_rcv_block/tb_test_num[31]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[30]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[29]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[28]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[27]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[26]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[25]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[24]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[23]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[22]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[21]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[20]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[19]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[18]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[17]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[16]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[15]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[14]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[13]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[12]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[11]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[10]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[9]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[8]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[7]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[6]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[5]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[4]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[3]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[2]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[1]} {-color {Dark Orchid}} {/tb_rcv_block/tb_test_num[0]} {-color {Dark Orchid}}} /tb_rcv_block/tb_test_num
add wave -noupdate -expand -group tb_variables -color {Dark Orchid} /tb_rcv_block/tb_test_data
add wave -noupdate -expand -group tb_variables -color {Dark Orchid} /tb_rcv_block/tb_test_stop_bit
add wave -noupdate -expand -group tb_variables -color {Dark Orchid} /tb_rcv_block/tb_test_bit_period
add wave -noupdate -expand -group tb_variables -color {Dark Orchid} /tb_rcv_block/tb_test_data_read
add wave -noupdate -expand -group rx_data -color {Spring Green} /tb_rcv_block/tb_rx_data
add wave -noupdate -expand -group rx_data -color {Spring Green} /tb_rcv_block/tb_expected_rx_data
add wave -noupdate -expand -group framing_error -color Maroon /tb_rcv_block/tb_framing_error
add wave -noupdate -expand -group framing_error -color Maroon /tb_rcv_block/tb_expected_framing_error
add wave -noupdate -expand -group data_ready -color Orange /tb_rcv_block/tb_data_ready
add wave -noupdate -expand -group data_ready -color Orange /tb_rcv_block/tb_expected_data_ready
add wave -noupdate -expand -group overrun_error /tb_rcv_block/tb_overrun_error
add wave -noupdate -expand -group overrun_error /tb_rcv_block/tb_expected_overrun
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {882 ps}
