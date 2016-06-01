module playTugOfWar (
	input clk,    // Clock
	input reset,  // Asynchronous reset active low
	input L,
	input R,
	output [8:0] LEDR,
	output reg [6:0] display
);

// Don't know how to code the leftest and rightest lights
normalLight light9 (.clk, .reset, .L, .R, .NL(1'b0),    .NR(LEDR[7]), .lightOn(LEDR[8]) ); 
normalLight light8 (.clk, .reset, .L, .R, .NL(LEDR[8]), .NR(LEDR[6]), .lightOn(LEDR[7]) ); 
normalLight light7 (.clk, .reset, .L, .R, .NL(LEDR[7]), .NR(LEDR[5]), .lightOn(LEDR[6]) );
normalLight light6 (.clk, .reset, .L, .R, .NL(LEDR[6]), .NR(LEDR[4]), .lightOn(LEDR[5]) ); 
centerLight center (.clk, .reset, .L, .R, .NL(LEDR[5]), .NR(LEDR[3]), .lightOn(LEDR[4]) ); 
normalLight light4 (.clk, .reset, .L, .R, .NL(LEDR[4]), .NR(LEDR[2]), .lightOn(LEDR[3]) ); 
normalLight light3 (.clk, .reset, .L, .R, .NL(LEDR[3]), .NR(LEDR[1]), .lightOn(LEDR[2]) ); 
normalLight light2 (.clk, .reset, .L, .R, .NL(LEDR[2]), .NR(LEDR[0]), .lightOn(LEDR[1]) ); 
normalLight light1 (.clk, .reset, .L, .R, .NL(LEDR[1]), .NR(1'b0),    .lightOn(LEDR[0]) ); 

victory dut (.clk, .reset, .leftest(LEDR[8]), .L, .rightest(LEDR[0]), .R, .display);

endmodule

module playTugOfWar_testbench();
	reg 		clk, reset, L, R;
	wire [8:0]  LEDR;
	wire [6:0]  display;
	
	playTugOfWar dut (.clk, .reset, .L, .R, .LEDR, .display);
	
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
		reset <= 1;					@(posedge clk);
		reset <= 0; L <= 0;	R <= 0;	@(posedge clk);
									@(posedge clk);
					L <= 1;			@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 1; R <= 1;	@(posedge clk);
									@(posedge clk);
					L <= 0;			@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 1; 		@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 0;			@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 0; R <= 1;	@(posedge clk);
									@(posedge clk);
					L <= 1;			@(posedge clk);
									@(posedge clk);
									@(posedge clk);
					L <= 1; 		@(posedge clk);
									@(posedge clk);
							R <= 0; @(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
		$stop;
	end
endmodule