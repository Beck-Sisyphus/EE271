module clock_divider (clock, divided_closcks);
	input clock;
	output reg [31:0] divided_closcks;
	
	initial
		divided_closcks = 0;
	
	always @(posedge clock)
		divided_closcks = divided_closcks + 1;
		
endmodule
