onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -radix unsigned /tb_adder_16bit/tb_test_case_num
add wave -noupdate -color Gold -radix unsigned /tb_adder_16bit/tb_test_case_err
add wave -noupdate -color Gold -radix unsigned /tb_adder_16bit/tb_expected_outs
add wave -noupdate -divider DUT
add wave -noupdate -expand -group Inputs -color Magenta -radix unsigned /tb_adder_16bit/tb_a
add wave -noupdate -expand -group Inputs -color Magenta -radix unsigned /tb_adder_16bit/tb_b
add wave -noupdate -expand -group Inputs -color Magenta -radix unsigned /tb_adder_16bit/tb_carry_in
add wave -noupdate -expand -group Sum -color Turquoise -radix unsigned /tb_adder_16bit/tb_sum
add wave -noupdate -expand -group Sum -color Turquoise -radix unsigned /tb_adder_16bit/tb_expected_sum
add wave -noupdate -expand -group Overflow -color {Orange Red} -itemcolor {Orange Red} -radix unsigned /tb_adder_16bit/tb_expected_overflow
add wave -noupdate -expand -group Overflow -color {Orange Red} -itemcolor {Orange Red} -radix unsigned /tb_adder_16bit/tb_overflow
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10753 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 228
configure wave -valuecolwidth 206
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
WaveRestoreZoom {0 ps} {53550 ps}
