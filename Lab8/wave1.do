onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_clk
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_n_rst
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_test_case
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_test_case_num
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_test_data
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_check_tag
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_test_bit_period
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_test_stop_bit
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_mismatch
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_check
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_psel
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_penable
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_pwrite
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_paddr
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_pwdata
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_prdata
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_pslverr
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_serial_in
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_expected_prdata
add wave -noupdate -expand -group {TB VARIABLES} /tb_apb_uart_rx/tb_expected_pslverr
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/serial_in
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/psel
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/paddr
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/penable
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/pwrite
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/pwdata
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/prdata
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/pslverr
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/rx_data
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/data_size
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/bit_period
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/data_read
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/data_ready
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/framing_error
add wave -noupdate -expand -group {DUT VARIABLES} /tb_apb_uart_rx/DUT/overrun_error
add wave -noupdate -expand -group APB_BUS_VARIABLES /tb_apb_uart_rx/BFM/clk
add wave -noupdate -expand -group APB_BUS_VARIABLES /tb_apb_uart_rx/BFM/psel
add wave -noupdate -expand -group APB_BUS_VARIABLES /tb_apb_uart_rx/BFM/paddr
add wave -noupdate -expand -group APB_BUS_VARIABLES /tb_apb_uart_rx/BFM/penable
add wave -noupdate -expand -group APB_BUS_VARIABLES /tb_apb_uart_rx/BFM/pwrite
add wave -noupdate -expand -group APB_BUS_VARIABLES /tb_apb_uart_rx/BFM/pwdata
add wave -noupdate -expand -group APB_BUS_VARIABLES /tb_apb_uart_rx/BFM/prdata
add wave -noupdate -expand -group APB_BUS_VARIABLES /tb_apb_uart_rx/BFM/pslverr
add wave -noupdate -expand -group APB_BUS_VARIABLES /tb_apb_uart_rx/BFM/current_transaction
add wave -noupdate -expand -group APB_BUS_VARIABLES /tb_apb_uart_rx/BFM/new_transaction
add wave -noupdate -expand -group UART_TIMER /tb_apb_uart_rx/DUT/A2/clk
add wave -noupdate -expand -group UART_TIMER /tb_apb_uart_rx/DUT/A2/A2/new_packet_detected
add wave -noupdate -expand -group UART_TIMER /tb_apb_uart_rx/DUT/A2/A2/state
add wave -noupdate -expand -group UART_TIMER -radix unsigned /tb_apb_uart_rx/DUT/A2/A3/C1/count_out
add wave -noupdate -expand -group UART_TIMER -radix unsigned /tb_apb_uart_rx/DUT/A2/A3/C1/rollover_val
add wave -noupdate -expand -group UART_TIMER /tb_apb_uart_rx/DUT/A2/A3/C1/rollover_flag
add wave -noupdate -expand -group UART_TIMER /tb_apb_uart_rx/DUT/A2/A3/enable_timer
add wave -noupdate -expand -group UART_TIMER /tb_apb_uart_rx/DUT/A2/serial_in
add wave -noupdate -expand -group UART_TIMER /tb_apb_uart_rx/DUT/A2/A3/C2/shift_strobe
add wave -noupdate -expand -group UART_TIMER /tb_apb_uart_rx/DUT/A2/A3/packet_done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {92155 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 200
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
WaveRestoreZoom {0 ps} {1057853 ps}
