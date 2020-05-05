onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {Main signals} -divider TestBench
add wave -noupdate -expand -group {Main signals} /tb_usb_receiver/tb_test_num
add wave -noupdate -expand -group {Main signals} /tb_usb_receiver/tb_test_case
add wave -noupdate -expand -group {Main signals} /tb_usb_receiver/tb_clk
add wave -noupdate -expand -group {Main signals} /tb_usb_receiver/tb_n_rst
add wave -noupdate -expand -group {Main signals} -divider STATE,PID
add wave -noupdate -expand -group {Main signals} -color Yellow -itemcolor Yellow /tb_usb_receiver/DUT/RCU/state
add wave -noupdate -expand -group {Main signals} -color Yellow -itemcolor Yellow /tb_usb_receiver/DUT/PID
add wave -noupdate -expand -group {Main signals} -divider {Encoded/Decoded Signals}
add wave -noupdate -expand -group {Main signals} -color Orange -itemcolor Orange /tb_usb_receiver/DUT/d_plus_sync
add wave -noupdate -expand -group {Main signals} -color Orange -itemcolor Orange /tb_usb_receiver/DUT/d_minus_sync
add wave -noupdate -expand -group {Main signals} -color Orange -itemcolor Orange /tb_usb_receiver/DUT/DEC/d_orig
add wave -noupdate -expand -group {Main signals} -divider {Timer Signals/d_edge signal}
add wave -noupdate -expand -group {Main signals} -color Magenta -itemcolor Black /tb_usb_receiver/DUT/TIM/rcving
add wave -noupdate -expand -group {Main signals} -color {Sky Blue} -itemcolor {Sky Blue} /tb_usb_receiver/DUT/TIM/shift_enable
add wave -noupdate -expand -group {Main signals} -color {Sky Blue} -itemcolor {Sky Blue} /tb_usb_receiver/DUT/ED/d_edge
add wave -noupdate -expand -group {Main signals} -divider {Timer Count/RCV data}
add wave -noupdate -expand -group {Main signals} -color Thistle -itemcolor {Spring Green} -radix unsigned /tb_usb_receiver/DUT/TIM/count
add wave -noupdate -expand -group {Main signals} -color Thistle -itemcolor {Spring Green} /tb_usb_receiver/DUT/SR/rcv_data
add wave -noupdate -expand -group {Main signals} -divider {Other Signals}
add wave -noupdate -expand -group {Main signals} -color Red -itemcolor Pink /tb_usb_receiver/DUT/RCU/w_enable
add wave -noupdate -expand -group {Main signals} -color Red -itemcolor Pink /tb_usb_receiver/DUT/EOP/eop
add wave -noupdate -expand -group {Main signals} -color Red -itemcolor Pink /tb_usb_receiver/DUT/TIM/byte_received
add wave -noupdate -expand -group {Main signals} -color Red -itemcolor Pink /tb_usb_receiver/DUT/RCU/r_error
add wave -noupdate -expand -group {Main signals} -divider {CRC LFSR}
add wave -noupdate -expand -group {Main signals} -itemcolor Black /tb_usb_receiver/DUT/CRC/crc_out
add wave -noupdate -expand -group {temp signals} /tb_usb_receiver/DUT/stuff_bit
add wave -noupdate -expand -group {temp signals} /tb_usb_receiver/DUT/TIM/clear
add wave -noupdate -expand -group {temp signals} /tb_usb_receiver/DUT/RX/r_data
add wave -noupdate -expand -group {temp signals} /tb_usb_receiver/DUT/RX/w_data
add wave -noupdate -expand -group {temp signals} /tb_usb_receiver/DUT/r_enable
add wave -noupdate -expand -group {temp signals} /tb_usb_receiver/DUT/empty
add wave -noupdate -expand -group {temp signals} /tb_usb_receiver/DUT/full
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {409464 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 218
configure wave -valuecolwidth 133
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
WaveRestoreZoom {0 ps} {2201723 ps}
