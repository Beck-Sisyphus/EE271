// Module works, 2015.3.7, Beck Pang
module gameRuleOld (
	input CLOCK_50,    // Clock
	input reset,
	input [8:0] cells,// alive or died of the neighbours around it.
	output reg out   // alive or died for the cell
);
	reg [2:0]counter;
	reg [31:0]clk;
// Any live cell with fewer than two live neighbours dies, as if caused by under-population.
// Any live cell with two or three live neighbours lives on to the next generation.
// Any live cell with more than three live neighbours dies, as if by overcrowding.
// Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

	reg [8:0] oldCells = {~9'b0};
	parameter on = 1'b1, off = 1'b0;
	wire [7:0] neighbours;
	assign neighbours = {cells[8:5], cells[3:0]};
	wire centerCell = cells[4];
	reg  hasChecked;


	always @(posedge CLOCK_50) begin
		if(reset || oldCells != cells) begin //
			clk <= 0;
			counter <= 3'b0;
			out <= centerCell;
			oldCells <= cells;
			hasChecked <= 0;
		end
		else begin
			clk <= clk + 1'b1;
			oldCells <= oldCells;
			if(clk < 4'b1000 && !hasChecked) begin
			 	out <= out;
				hasChecked <= hasChecked;
				if (neighbours[clk] == on)
					counter <= counter + 3'b001;
				else 
					counter <= counter;
			end	
			else if (clk == 4'b1000  && !hasChecked) begin
				counter <= counter;
				hasChecked <= 1;
				if 		(centerCell == on && counter < 3'b010)      out <= off;
				else if (centerCell == on && counter ==3'b010)	  out <= on;
				else if (centerCell == on && counter > 3'b011) 	   out <= off;
				else if (counter == 3'b011) 					  out <= on;
				else out <= off;
			end
			else begin
			 	out <= out;
				counter <= counter;
				hasChecked <= hasChecked;
			end
		end
	end

endmodule

module gameRuleOld_testbench();
	reg	  CLOCK_50;    // Clock
	reg   reset;
	reg	  [8:0] cells;  // Asynchronous reset active low
	wire  out;	
	// wire [2:0] counter;
	// wire [3:0] clk;

	// When testing, change the slowClock to 6; in normal use, change back to 30.
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial CLOCK_50 = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		CLOCK_50 = ~CLOCK_50;
	end 

	// gameRule game (.CLOCK_50, .cells,  .out, .counter, .clk);
	gameRuleOld game (.CLOCK_50, .reset, .cells,  .out);
	integer i;

	initial begin	
							@(posedge CLOCK_50);
							@(posedge CLOCK_50);
		reset <= 1;			@(posedge CLOCK_50);
		reset <= 0;			@(posedge CLOCK_50);
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