module ledMatrixDriver (
	input CLOCK_50,    // Clock
	input reset,
	input [7:0][7:0] redArray, greenArray, // 2D LED array as input
	output reg [7:0] redDriver, greenDriver, rowSink
);
	reg [2:0] count;

	always @(posedge CLOCK_50)
		if (reset)
			count <= 3'b000;
		else 
			count <= count + 3'b001;

	always @(*)
		case (count)
			3'b000:	  rowSink = 8'b11111110;
			3'b001:   rowSink = 8'b11111101;
			3'b010:   rowSink = 8'b11111011;
			3'b011:   rowSink = 8'b11110111;
			3'b100:   rowSink = 8'b11101111;
			3'b101:   rowSink = 8'b11011111;
			3'b110:   rowSink = 8'b10111111;
			3'b111:   rowSink = 8'b01111111;
		endcase

	assign redDriver   = redArray[count];
	assign greenDriver = greenArray[count];
endmodule

module ledMatrixDriver_testbench();
	reg     CLOCK_50;
	reg		reset;
	reg 	[7:0][7:0] redArray, greenArray;
	wire 	[7:0]	redDriver, greenDriver, rowSink;

	
	// Set up the clock
	parameter CLOCK_PERIOD = 100;
	initial CLOCK_50 = 1;
	always begin
		#(CLOCK_PERIOD / 2);
		CLOCK_50 = ~CLOCK_50;
	end 

	ledMatrixDriver test (.CLOCK_50, .reset, .redArray, .greenArray, .redDriver, .greenDriver, .rowSink);
	// Set up the inputs to the design. Each line is a clock cycle.
	integer i;
	initial begin	
						      	@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
		reset <= 1;		      	@(posedge CLOCK_50);
		reset <= 0;		      	@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
		greenArray <= {
						{~8'b0},
						{~8'b0},
						{~8'b0},
						{~8'b0},
						{~8'b0},
						{~8'b0},
						{~8'b0},
						{~8'b0}
						};		@(posedge CLOCK_50);
		redArray <= {
						{8'b0}, 
						{8'b0},
						{8'b0},
						{8'b0},
						{8'b0},
						{8'b0},
						{8'b0},
						{8'b0}
						};		@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
						      	@(posedge CLOCK_50);
		for (i = 0; i < 1024; i++) begin
								@(posedge CLOCK_50);
		end
						      	$stop;
	end
endmodule
