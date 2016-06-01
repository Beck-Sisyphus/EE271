// Beck Pang
// This module is primarily focused on taking different user input
// and generate different initial output for two colors.
module playGame (
	input CLOCK_50,    // Clock
	input reset,  	   // Asynchronous reset active low
	input [8:0] SW,    // Input switch decide the pattern
	output reg [7:0][7:0] redArray, greenArray // 2D LED array as input
);
	// wire reset;
	reg [7:0][7:0] nextStateGreen, nextStateRed;
	// Generate clk off of CLOCK_50, whichClock picks rate.
	reg [31:0] clk, clock;
	parameter slowClock = 10;
	clock_divider cdiv (CLOCK_50, clock);

	changeOneColor green(.CLOCK_50(clock[slowClock]), .array(greenArray), .nextState(nextStateGreen));
	changeOneColor red  (.CLOCK_50(clock[slowClock]), .array(redArray),   .nextState(nextStateRed));

	always @(posedge CLOCK_50)
		if (SW[2]) begin
			clk <= 32'b0;
			greenArray <= {
						{8'b00000000},
						{8'b00001100},
						{8'b00010010},
						{8'b00001010},
						{8'b00000100},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000}
						};
			redArray   <= {
						{8'b00000000}, 
						{8'b00000000},
						{8'b00000000},
						{8'b01100000},
						{8'b10010000},
						{8'b01010000},
						{8'b00100000},
						{8'b00000000}
						};			
		end
		else if (SW[3]) begin
			clk <= 32'b0;
			greenArray <= {
						{8'b00000000},
						{8'b01100000},
						{8'b01010000},
						{8'b00100000},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000}
						};
			redArray   <= {
						{8'b00000000}, 
						{8'b00000000},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000},
						{8'b00001100},
						{8'b00001010},
						{8'b00000100}
						};			
		end
		else if (SW[4]) begin
			clk <= 32'b0;
			greenArray <= {
						{8'b00000100},
						{8'b00000100},
						{8'b00000100},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000},
						{8'b11100000},
						{8'b00000000}
						};
			redArray   <= {
						{8'b01000000}, 
						{8'b01000000},
						{8'b01000000},
						{8'b00000000},
						{8'b00000000},
						{8'b00001110},
						{8'b00000000},
						{8'b00000000}
						};			
		end
		else if (SW[5]) begin
			clk <= 32'b0;
			greenArray <= {
						{8'b00000000},
						{8'b00011100},
						{8'b00111000},
						{8'b00000000},
						{8'b00000000},
						{8'b01110000},
						{8'b11100000},
						{8'b00000000}
						};
			redArray   <= {
						{8'b00000000}, 
						{8'b01110000},
						{8'b11100000},
						{8'b00000000},
						{8'b00000000},
						{8'b00001110},
						{8'b00011100},
						{8'b00000000}
						};			
		end
		else if (SW[6]) begin
			clk <= 32'b0;
			greenArray <= {
						{8'b00001100},
						{8'b00001100},
						{8'b00110000},
						{8'b00110000},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000}
						};
			redArray   <= {
						{8'b00000000}, 
						{8'b00000000},
						{8'b00000000},
						{8'b00110000},
						{8'b00110000},
						{8'b00001100},
						{8'b00001100},
						{8'b00000000}
						};			
		end
		else if (SW[7]) begin
			clk <= 32'b0;
			greenArray <= {
						{8'b01000000},
						{8'b00100000},
						{8'b11100000},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000}
						};
			redArray   <= {
						{8'b00000000}, 
						{8'b00000000},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000},
						{8'b00000111},
						{8'b00000100},
						{8'b00000010}
						};			
		end
		else if (SW[8]) begin
			clk <= 32'b0;
			greenArray <= {
						{8'b00000000},
						{8'b00111100},
						{8'b01000100},
						{8'b00000100},
						{8'b01001000},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000}
						};
			redArray   <= {
						{8'b00000000}, 
						{8'b01111000},
						{8'b01000100},
						{8'b01000000},
						{8'b00100100},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000}
						};			
		end
		else if (reset && (~SW[2] || ~SW[3] || ~SW[4] || ~SW[5] || ~SW[6] || ~SW[7] || ~SW[8])) begin
			clk <= 32'b0;
			greenArray <= {
						{8'b01000000},
						{8'b00001100},
						{8'b00010010},
						{8'b00001010},
						{8'b00000100},
						{8'b00000000},
						{8'b00000000},
						{8'b00000000}
						};
			redArray   <= {
						{8'b10101010}, 
						{8'b01010101},
						{8'b10101010},
						{8'b01010101},
						{8'b10101010},
						{8'b01010101},
						{8'b10101010},
						{8'b01010101}
						};			
		end
		else if (clk[slowClock]) begin
			greenArray <= nextStateGreen;
			redArray <= nextStateRed;
			clk <= clk + 32'b1;
		end 
		else begin
			greenArray <= greenArray;
			redArray <= redArray;
			clk <= clk + 32'b1;
		end

endmodule

module playGame_testbench();
	reg	  CLOCK_50;    // Clock
	reg	  reset;  // Asynchronous reset active low
	reg   [8:2] SW;
	wire  [7:0][7:0] redArray, greenArray;

	// When testing, change the slowClock to 6; in normal use, change back to 30.
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial CLOCK_50 = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		CLOCK_50 = ~CLOCK_50;
	end 

	playGame game (.CLOCK_50, .SW, .reset, .redArray, .greenArray);

	integer i;
	initial begin	
				@(posedge CLOCK_50);
				@(posedge CLOCK_50);
				@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
		SW[6] <= 1;		      	@(posedge CLOCK_50);
		SW[6] <= 0;		      	@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
								@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
		for (i = 0; i < 1600; i++) begin
								@(posedge CLOCK_50);
		end
						      	$stop;
	end
endmodule