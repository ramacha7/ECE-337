onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_test_case
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_test_case_num
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_test_data
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_check_tag
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_test_bit_period
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_mismatch
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_check
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_clk
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_n_rst
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_psel
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_penable
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_pwrite
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_prdata
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_pwdata
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_pslverr
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_rx_data
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_paddr
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_data_ready
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_overrun_error
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_framing_error
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_data_read
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_data_size
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_bit_period
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_expected_data_read
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_expected_data_size
add wave -noupdate -expand -group {Testbench variables} /tb_apb_slave/tb_expected_data
add wave -noupdate -expand -group {Testbench variables} -radix unsigned /tb_apb_slave/tb_expected_bit_period
add wave -noupdate -expand -group {DUT variables} /tb_apb_slave/DUT/paddr
add wave -noupdate -expand -group {DUT variables} /tb_apb_slave/DUT/pwrite
add wave -noupdate -expand -group {DUT variables} /tb_apb_slave/DUT/data_read
add wave -noupdate -expand -group {DUT variables} /tb_apb_slave/DUT/data_size
add wave -noupdate -expand -group {DUT variables} /tb_apb_slave/DUT/pslverr
add wave -noupdate -expand -group {DUT variables} /tb_apb_slave/DUT/prdata
add wave -noupdate -expand -group {DUT variables} /tb_apb_slave/DUT/psel
add wave -noupdate -expand -group {DUT variables} /tb_apb_slave/DUT/penable
add wave -noupdate -expand -group {DUT variables} /tb_apb_slave/DUT/rx_data
add wave -noupdate -expand -group {DUT variables} /tb_apb_slave/DUT/bit_period
add wave -noupdate -expand -group {DUT variables} /tb_apb_slave/DUT/read_select
add wave -noupdate -expand -group {DUT variables} /tb_apb_slave/DUT/write_select
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1831770 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 216
configure wave -valuecolwidth 139
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
WaveRestoreZoom {267850 ps} {480473 ps}
