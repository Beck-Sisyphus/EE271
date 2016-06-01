module seaTacLight (clk, SW, inputLED);
    input            clk;
    input      [1:0] SW;
    output     [2:0] inputLED;

    reg [2:0] ps;   // two present states bits, four states
    reg [2:0] ns;

    // States and Output encoding
    parameter [2:0] nil = 3'bxxx,
                    M = 3'b010;
						  
	 // wire [2:0] R = M >> 1, L = M << 1;

    // Next State logic
    always @(*)
        case (ps)
            ~M:     if      (~SW[1] & ~SW[0]) ns = M;     // 00
                    else if (~SW[1] & SW[0])  ns = M >> 1;     // 01 
                    else if (SW[1] & ~SW[0])  ns = M << 1;     // 10
                    else                      ns = nil;
            M >> 1:      if      (~SW[1] & ~SW[0]) ns = ~M;  
                    else if (~SW[1] & SW[0])  ns = M;     // 01 again, to M
                    else if (SW[1] & ~SW[0])  ns = M << 1;     // 10 again, back to L
                    else                      ns = nil;
            M:      if      (~SW[1] & ~SW[0]) ns = ~M;  
                    else if (~SW[1] & SW[0])  ns = M << 1;     
                    else if (SW[1] & ~SW[0])  ns = M >> 1;     // 10 again, to R
                    else                      ns = nil;
            M << 1:      if      (~SW[1] & ~SW[0]) ns = ~M;  
                    else if (~SW[1] & SW[0])  ns = M >> 1;     
                    else if (SW[1] & ~SW[0])  ns = M;     
                    else                      ns = nil;
            default:    ns = ~M;
        endcase

    // Output logic
    assign inputLED = ps;

    // DFFs
    always @(posedge clk)
            ps <= ns;

endmodule

module seaTacLight_testbench();
	reg 		  clk;
	//reg	reset;
	reg  [1:0] SW;
	wire [2:0] inputLED;
	
	//seaTacLight dut (.clk, .reset, .SW, .inputLED);
	seaTacLight dut (.clk, .SW, .inputLED);
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
		SW[1] <= 0; SW[0] <= 0;    @(posedge clk);
		                           @(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);									
		SW[1] <= 0; SW[0] <= 1;    @(posedge clk);
		                           @(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
		SW[1] <= 1; SW[0] <= 0;    @(posedge clk);
		                           @(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
		SW[1] <= 1; SW[0] <= 1;    @(posedge clk);
		                           @(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
		$stop;
	end
endmodule
