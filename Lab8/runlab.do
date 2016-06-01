# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./DE1_SoC.sv"
vlog "./ledMatrixDriver.sv"
vlog "./playGame.sv"
vlog "./gameRule.sv"
vlog "./changeOneColor.sv"
#vlog "./ledDisplay.sv"
#vlog "./oldLab/Lab7/playTugOfWar.sv"
#vlog "./oldLab/Lab7/victory.sv"
#vlog "./oldLab/Lab7/button.sv"
#vlog "./oldLab/Lab7/playField.sv"
#vlog "./oldLab/Lab7/LSDR.sv"
#vlog "./oldLab/Lab7/adder.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work gameRule_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do gameRule_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
