onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sampleSequential_testbench/out
add wave -noupdate /sampleSequential_testbench/w
add wave -noupdate /sampleSequential_testbench/clk
add wave -noupdate /sampleSequential_testbench/reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 225
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 100
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1848 ps}
