// This file is:
// The top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input					CLOCK_50; // 50MHz clock
 	output	[6:0]		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output	[9:0]		LEDR;
	input 	[3:0] 		KEY;
	input   [9:0]		SW;

	wire L, R;
	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;

	userInput button(.clk(CLOCK_50), .reset(SW[9]), .leftButton(KEY[3]), .rightButton(KEY[0]), .L(L), .R(R));
	playTugOfWar dut(.clk(CLOCK_50), .reset(SW[9]), .L(L), .R(R), .LEDR(LEDR[9:1]), .display(HEX0));
	
 
endmodule

module DE1_SoC_testbench();
	wire 	   [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire     [9:0] LEDR;
	reg      [3:0] KEY;
	reg      [9:0] SW;
	reg      clk;
	
	DE1_SoC dut (.CLOCK_50(clk), .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);
	
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial clk = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		clk = ~clk;
	end 
	
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin	
									      	@(posedge clk);
											@(posedge clk);
		SW[9]  <= 1; 					 	@(posedge clk);
		SW[9]  <= 0; 					 	@(posedge clk);
		KEY[3] <= 0; 	KEY[0] <= 0;    	@(posedge clk);
		                           			@(posedge clk);
						KEY[0] <= 1;  		@(posedge clk);
											@(posedge clk);
						KEY[0] <= 0;		@(posedge clk);
											@(posedge clk);
						KEY[0] <= 1;  		@(posedge clk);
											@(posedge clk);
						KEY[0] <= 0;		@(posedge clk);
											@(posedge clk);
						KEY[0] <= 1;  		@(posedge clk);
											@(posedge clk);
						KEY[0] <= 0;		@(posedge clk);
											@(posedge clk);
						KEY[0] <= 1;  		@(posedge clk);
											@(posedge clk);
						KEY[0] <= 0;		@(posedge clk);
											@(posedge clk);	
						KEY[0] <= 1;  		@(posedge clk);
											@(posedge clk);
						KEY[0] <= 0;		@(posedge clk);
											@(posedge clk);	
						KEY[0] <= 1;  		@(posedge clk);
											@(posedge clk);
						KEY[0] <= 0;		@(posedge clk);
											@(posedge clk);
						KEY[0] <= 1;		@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
						KEY[0] <= 0;		@(posedge clk);
											@(posedge clk);
						KEY[0] <= 1;		@(posedge clk);
											@(posedge clk);
		KEY[3] <= 1;	KEY[0] <= 0; 		@(posedge clk);
											@(posedge clk);
		KEY[3] <= 0;						@(posedge clk);
		KEY[3] <= 1;              			@(posedge clk);
		KEY[3] <= 0;						@(posedge clk);
		KEY[3] <= 1;              			@(posedge clk);
		KEY[3] <= 0;						@(posedge clk);
		KEY[3] <= 1;              			@(posedge clk);
		KEY[3] <= 0;						@(posedge clk);
		KEY[3] <= 1;              			@(posedge clk);
		KEY[3] <= 0;						@(posedge clk);
		KEY[3] <= 1;              			@(posedge clk);
		KEY[3] <= 0;						@(posedge clk);
		KEY[3] <= 1;              			@(posedge clk);
											@(posedge clk);
		$stop;
	end
endmodule 