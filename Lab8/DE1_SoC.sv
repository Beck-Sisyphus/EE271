// This file is:
// The top-level module that defines the I/Os for the DE-1 SoC board
// Beck Pang, Mar. 9th, 2015, University of Washington, Seattle
module DE1_SoC (CLOCK_50, GPIO_0, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);//, greenDriver, greenArray); 
	input	CLOCK_50; // 50MHz clock
	// output  [35:0]		GPIO_0;
	inout 	[35:0] GPIO_0;
 	output	[6:0]		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output	[9:0]		LEDR;
	input 	[3:0] 		KEY;
	input   [9:0]		SW;


	// Generate clk off of CLOCK_50, whichClock picks rate.
	wire    [31:0] clk;
	parameter whichClock = 13;
	clock_divider cdiv (CLOCK_50, clk);

	// Matched with the wire order
	reg [7:0] rowSink, redDriver;
	reg [7:0] greenDriver;

	assign GPIO_0[23:16] = rowSink;
	assign GPIO_0[15:8]  = redDriver;
	assign GPIO_0[7:0]   = greenDriver;

	reg [7:0][7:0] greenArray;
	reg [7:0][7:0] redArray;
	wire reset;
	assign reset = SW[9] || SW[8] || SW[7] || SW[6] || SW[5] || SW[4] || SW[3] || SW[2] || SW[1] || SW[0];
	playGame play(.CLOCK_50(clk[whichClock]), .SW(SW[8:0]), .reset, .redArray, .greenArray);

	ledMatrixDriver matrix (.CLOCK_50(clk[whichClock]), .reset,
			.redArray, .greenArray, 
			.redDriver, .greenDriver, .rowSink);

	ledDisplay display(.CLOCK_50(clk[whichClock]), .SW(SW[8:0]), .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5);
endmodule

// module clock_divider (clock, divided_closcks);
// 	input clock;
// 	output reg [31:0] divided_closcks;
	
// 	initial
// 		divided_closcks = 0;
	
// 	always @(posedge clock)
// 		divided_closcks = divided_closcks + 1;
		
// endmodule

module DE1_SoC_testbench();
	wire 	[6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire 	[35:0] GPIO_0;
	// wire	[7:0] greenDriver;
	// wire	[7:0][7:0] greenArray;
	wire    [9:0] LEDR;
	reg     [3:0] KEY;
	reg     [9:0] SW;
	reg     CLOCK_50;
	
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial CLOCK_50 = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		CLOCK_50 = ~CLOCK_50;
	end 

	DE1_SoC dut (.CLOCK_50, .GPIO_0, .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);//, .greenDriver, .greenArray);
	// Set up the inputs to the design. Each line is a clock cycle.
	integer i;
	initial begin	
						      	@(posedge CLOCK_50);
		SW[9] <= 1;		      	@(posedge CLOCK_50);
		SW[9] <= 0;		      	@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
		SW[1] <= 1;		      	@(posedge CLOCK_50);
		SW[1] <= 0;				@(posedge CLOCK_50);
		SW[0] <= 1;		      	@(posedge CLOCK_50);
		SW[0] <= 0;				@(posedge CLOCK_50);
		SW[2] <= 0;		      	@(posedge CLOCK_50);
		SW[3] <= 0;				@(posedge CLOCK_50);
		SW[4] <= 0;		      	@(posedge CLOCK_50);
		SW[5] <= 0;				@(posedge CLOCK_50);
		SW[6] <= 0;		      	@(posedge CLOCK_50);
		SW[7] <= 0;				@(posedge CLOCK_50);
		SW[8] <= 0;		      	@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
		for (i = 0; i < 1600; i++) begin
								@(posedge CLOCK_50);
		end
						      	$stop;
	end
endmodule
