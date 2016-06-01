// This file is:
// The top-level module that defines the I/Os for the DE-1 SoC board

 	output	[6:0]		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output	[9:0]		LEDR;
	input 	[3:0] 	KEY;
	input		[9:0]		SW;
	
	// Set default	values, turns off the HEX displays
	assign HEX0 = 7'b1111111;
	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	
	// set the SW[3] as Mark, and set SW[2,1,0] as U P C
	// Set LEDR[0] as the Discounted light
	// Set LEDR[4:1] all to the stolen light

	assign LEDR[0] = SW[1] | ( SW[2] & SW[0] );
	assign LEDR[3] = ~SW[3] & ~SW[1] & (~SW[0] | SW[2]);
	assign LEDR[4] = ~SW[3] & ~SW[1] & (~SW[0] | SW[2]);
	assign LEDR[5] = ~SW[3] & ~SW[1] & (~SW[0] | SW[2]);
	assign LEDR[6] = ~SW[3] & ~SW[1] & (~SW[0] | SW[2]);	
endmodule

module DE1_SoC_testbench();
	wire 	   [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire     [9:0] LEDR;
	reg      [3:0] KEY;
	reg      [9:0] SW;
	
	DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);
	
	// Try all combinations of inputs/
	integer i;
	initial	begin 
		SW[9] = 1'b0;
		SW[8] = 1'b0;
		SW[7] = 1'b0;
		SW[6] = 1'b0;
		SW[5] = 1'b0;
		SW[4] = 1'b0;
		for (i = 0; i < 16; i++) begin
			SW[3:0] = i; #10;
		end
	end
endmodule 