onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DE1_SoC_testbench/CLOCK_50
add wave -noupdate {/DE1_SoC_testbench/SW[9]}
add wave -noupdate {/DE1_SoC_testbench/SW[1]}
add wave -noupdate {/DE1_SoC_testbench/SW[0]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[7]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[6]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[5]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[4]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[3]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[2]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[1]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[0]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[23]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[22]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[21]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[20]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[19]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[18]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[17]}
add wave -noupdate {/DE1_SoC_testbench/GPIO_0[16]}
add wave -noupdate -expand /DE1_SoC_testbench/greenDriver
add wave -noupdate -expand /DE1_SoC_testbench/greenArray
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {19245 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 272
configure wave -valuecolwidth 148
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
WaveRestoreZoom {0 ps} {2787 ps}
