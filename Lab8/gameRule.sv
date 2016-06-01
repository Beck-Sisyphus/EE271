module gameRule (
	input CLOCK_50,    // Clock
	input [8:0] cells,// alive or died of the neighbours around it.
	output reg out   // alive or died for the cell
);
	parameter on = 1'b1, off = 1'b0;
	reg [2:0] counter;
	wire centerCell = cells[4];

	always @(posedge CLOCK_50)
		counter = cells[8] + cells[7] + cells[6] + cells[5] + cells[3] + cells[2] + cells[1] + cells[0];

	always @(*) begin
		if 		(centerCell == on && counter < 3'b010)    out = off;
		else if (centerCell == on && counter ==3'b010)	  out = on;
		else if (centerCell == on && counter > 3'b011) 	  out = off;
		else if (counter == 3'b011) 					  out = on;
		else out = off;
	end
endmodule

module gameRule_testbench();
	reg	  CLOCK_50;    // Clock
	reg	  [8:0] cells;  // Asynchronous reset active low
	wire  out;	

	// When testing, change the slowClock to 6; in normal use, change back to 30.
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial CLOCK_50 = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		CLOCK_50 = ~CLOCK_50;
	end 

	gameRule game (.CLOCK_50, .cells,  .out);

	integer i;
	initial begin	
							@(posedge CLOCK_50);
							@(posedge CLOCK_50);
		// reset <= 1;			@(posedge CLOCK_50);
		// reset <= 0;			@(posedge CLOCK_50);
							@(posedge CLOCK_50);
		cells <= {
					3'b000,
					3'b000,
					3'b000
					};		@(posedge CLOCK_50);
		for (i = 0; i < 64; i++) begin
							@(posedge CLOCK_50);
		end
		cells <= {
					3'b000,
					3'b010,
					3'b000
					};		@(posedge CLOCK_50);
		for (i = 0; i < 16; i++) begin
							@(posedge CLOCK_50);
		end
		cells <= {
					3'b000,
					3'b101,
					3'b000
					};		@(posedge CLOCK_50);
		for (i = 0; i < 50; i++) begin
							@(posedge CLOCK_50);
		end
		cells <= {
					3'b000,
					3'b111,
					3'b000
					};		@(posedge CLOCK_50);
		for (i = 0; i < 16; i++) begin
							@(posedge CLOCK_50);
		end
		cells <= {
					3'b010,
					3'b101,
					3'b000
					};		@(posedge CLOCK_50);
		for (i = 0; i < 16; i++) begin
							@(posedge CLOCK_50);
		end
		cells <= {
					3'b111,
					3'b111,
					3'b000
					};		@(posedge CLOCK_50);
		for (i = 0; i < 16; i++) begin
							@(posedge CLOCK_50);
		end
						      	$stop;
	end
endmodule