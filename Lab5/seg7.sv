// First created in Lab4
// To change the display in the seven segment display windows

module seg7 (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, SW);
 	output reg	[6:0]		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	input		[2:0]		SW;
	reg      [6:0]    nil, A, d, E, h, I, L, o, n, P,  S, t, U;
	
	assign nil = 7'b1111111;
	assign A   = 7'b0001000;
	assign d   = 7'b0100001;
	assign E   = 7'b0000110;
	assign h   = 7'b0001011;
	assign I   = 7'b1111001;
	assign L   = 7'b1000111;
	assign o   = 7'b0100011;
	assign n   = 7'b0101011;
	assign P   = 7'b0001100;
	assign S   = 7'b0010010;
	assign t   = 7'b0000111;
	assign U   = 7'b1000001;
	

	always @(*)
		case (SW)
			3'b000 : begin 
							// Set 000 as UPC code for iPod
							HEX5 = nil;
							HEX4 = nil;
							HEX3 = I;
							HEX2 = P;
							HEX1 = o;
							HEX0 = d;
						end
			3'b001 : begin 
							// Set 001 as UPC code for apple
							HEX5 = nil;
							HEX4 = A;
							HEX3 = P;
							HEX2 = P;
							HEX1 = L;
							HEX0 = E;
						end
			3'b011 : begin 
							// Set 011 as UPC code for Hoodie
							HEX5 = h;
							HEX4 = o;
							HEX3 = o;
							HEX2 = d;
							HEX1 = I;
							HEX0 = E;
						end
			3'b100 : begin 
							// Set 100 as UPC code for suit
							HEX5 = nil;
							HEX4 = nil;
							HEX3 = S;
							HEX2 = U;
							HEX1 = I;
							HEX0 = t;
						end
			3'b101 : begin 
							// Set 101 as UPC code for iPhone
							HEX5 = I;
							HEX4 = P;
							HEX3 = h;
							HEX2 = o;
							HEX1 = n;
							HEX0 = E;
						end
			3'b110 : begin 
							// Set 110 as UPC code for Polo
							HEX5 = nil;
							HEX4 = nil;
							HEX3 = P;
							HEX2 = o;
							HEX1 = L;
							HEX0 = o;
						end
						
			default:  begin 
							// Set default	values, turns off the HEX displays
							HEX5 = nil;
							HEX4 = nil;
							HEX3 = nil;
							HEX2 = nil;
							HEX1 = nil;
							HEX0 = nil;
						end
		endcase
endmodule

module seg7_testbench();
	wire 	   [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	reg      [2:0] SW;
	
	seg7 dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .SW);
	
	// Try all combinations of inputs/
	integer i;
	initial	begin
		for (i = 0; i < 8; i++) begin
			SW[2:0] = i; #10;
		end
	end
endmodule 
