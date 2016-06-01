module ledDisplay (
	input CLOCK_50,    // Clock
	input [8:0] SW, // Clock Enable
 	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);
	parameter on = 1'b1, off = 1'b0;

	always @(posedge CLOCK_50)
		if(SW ==  9'b0) begin
			// LIFE
			HEX5 <= 7'b1111111;
			HEX4 <= 7'b1111111;
			HEX3 <= 7'b1000111;
			HEX2 <= 7'b1111001;
			HEX1 <= 7'b0001110;
			HEX0 <= 7'b0000110;
		end
		else if(SW[2] == on) begin
			// Loaf
			HEX5 <= 7'b1111111;
			HEX4 <= 7'b1111111;
			HEX3 <= 7'b1000111;
			HEX2 <= 7'b0100011;
			HEX1 <= 7'b0100000;
			HEX0 <= 7'b0001110;
		end
		else if(SW[3] == on) begin
			// Boat
			HEX5 <= 7'b1111111;
			HEX4 <= 7'b1111111;
			HEX3 <= 7'b0000000;
			HEX2 <= 7'b0100011;
			HEX1 <= 7'b0100000;
			HEX0 <= 7'b0000111;
		end
		else if(SW[4] == on) begin
			// Blinker
			HEX5 <= 7'b0000000;
			HEX4 <= 7'b1000111;
			HEX3 <= 7'b1111011;
			HEX2 <= 7'b0101011;
			HEX1 <= 7'b0001001;
			HEX0 <= 7'b0000110;
		end
		else if(SW[5] == on) begin
			// Toad
			HEX5 <= 7'b1111111;
			HEX4 <= 7'b1111111;
			HEX3 <= 7'b0000111;
			HEX2 <= 7'b0100011;
			HEX1 <= 7'b0100000;
			HEX0 <= 7'b0100001;
		end
		else if(SW[6] == on) begin
			// Beacon
			HEX5 <= 7'b0000000;
			HEX4 <= 7'b0000110;
			HEX3 <= 7'b0100000;
			HEX2 <= 7'b0100111;
			HEX1 <= 7'b0100011;
			HEX0 <= 7'b0101011;
		end
		else if(SW[7] == on) begin
			// Glider
			HEX5 <= 7'b1000010;
			HEX4 <= 7'b1000111;
			HEX3 <= 7'b1111011;
			HEX2 <= 7'b0100001;
			HEX1 <= 7'b0000110;
			HEX0 <= 7'b0101111;
		end
		else if(SW[8] == on) begin
			// LWSS
			HEX5 <= 7'b1111111;
			HEX4 <= 7'b1111111;
			HEX3 <= 7'b1000111;
			HEX2 <= 7'b0001001;
			HEX1 <= 7'b0010010;
			HEX0 <= 7'b0010010;
		end
		else begin
			HEX5 <= 7'b1111111;
			HEX4 <= 7'b1111111;
			HEX3 <= 7'b1111111;
			HEX2 <= 7'b1111111;
			HEX1 <= 7'b1111111;
			HEX0 <= 7'b1111111;
		end
endmodule
