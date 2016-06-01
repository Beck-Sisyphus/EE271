module LedDriverTest (
	CLOCK_50, GPIO_0, SW
);
	input		 CLOCK_50;
	output [35:0] GPIO_0;
	input [9:0]	 SW;

	// Generate clk off of CLOCK_50, whichClock picks rate.
	wire    [31:0] clk;
	parameter whichClock = 10;
	clock_divider cdiv (CLOCK_50, clk);

	// Matched with the wire order
	wire [7:0] rowSsink;
	wire [7:0] redDriver;
	wire [7:0] greenDriver;

	assign rowSink    = GPIO_0[23:6];
	assign redDriver  = GPIO_0[15:8];
	assign greenDriver= GPIO_0[7:0];

	reg [7:0][7:0] redArray, greenArray;
	assign redArray  [0] = 8'b11111111;
	assign greenArray[0] = 8'b00000000;
	assign redArray  [5] = 8'b11111111;
	assign greenArray[5] = 8'b00000000;
	ledMatrixDriver matrix (.clk(clk[whichClock]), .redArray(redArray), .greenArray(greenArray), .redDriver(redDriver), .greenDriver(greenDriver), .rowSink(rowSink));

endmodule