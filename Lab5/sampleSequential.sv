// Beck Pang, University of Washington, Seattle
// Feb. 5th, 2015
module sampleSequential (clk, reset, w, out);
	input			clk, reset, w;
	output reg  out;
	
	reg [1:0] ps;
	reg [1:0] ns;
	
	// States encoding
	parameter [1:0] A = 2'b00, B = 2'b01, C =2'b10;
	
	// Next state logic
	always @(*)
		case (ps)
			A: if (w) 	ns = B;
				else		ns = A;
			B: if (w)	ns = C;
				else 		ns = A;
			C: if (w)	ns = C;
				else		ns = A;
			default: 	ns = 2'bxx;
		endcase
		
	// Output logic
	assign out = (ps == C);
	
	// D Flip-flops
	always @(posedge clk)
		if (reset)
			ps <= A;
		else 
			ps <= ns;
endmodule

module sampleSequential_testbench();
	reg 		clk, reset, w;
	wire 		out;
	
	sampleSequential dut (clk, reset, w, out);
	
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
		reset <= 1;    	   @(posedge clk);
		reset <= 0; w <= 0;  @(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
						w <= 1;  @(posedge clk);
						w <= 0; 	@(posedge clk);
						w <= 1;  @(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
						w <= 0; 	@(posedge clk);
									@(posedge clk);
		$stop;
	end
endmodule


	