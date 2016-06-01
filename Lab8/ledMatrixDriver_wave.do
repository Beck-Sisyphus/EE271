onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ledMatrixDriver_testbench/CLOCK_50
add wave -noupdate /ledMatrixDriver_testbench/reset
add wave -noupdate /ledMatrixDriver_testbench/redArray
add wave -noupdate /ledMatrixDriver_testbench/redDriver
add wave -noupdate /ledMatrixDriver_testbench/greenArray
add wave -noupdate /ledMatrixDriver_testbench/greenDriver
add wave -noupdate /ledMatrixDriver_testbench/rowSink
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 260
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {898 ps}
