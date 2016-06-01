module mux8_1 (
	output out,
	input i000, i001, i010, i011, i100, i101, i110, i111,
	input sel0, sel1, sel2
);
	wire v0, v1;
	mux2_1 m0(.out(v0), .i00(i000), .i01(i001), .i10(i010), .i11(i011), .sel0, .sel1);
	mux2_1 m1(.out(v1), .i00(i100), .i01(i101), .i10(i110), .i11(i111), .sel0, .sel1);
	mux2_1 m(.out(out), .i0(v0) , .i1(v1) , .sel(sel2));
endmodule

module mux8_1_testbench();
		reg i000, i001, i010, i011, i100, i101, i110, i111;
		reg sel0, sel1, sel2;
		wire out;
		
		mux8_1 dut (.out, .i000, .i001, .i010, .i011, .i100, .i101, .i110, .i111, .sel0, .sel1, .sel2);
		
		integer counter;
		initial begin
				for (counter = 0; counter < 2048; counter++) begin
						{sel2, sel1, sel0, i000, i001, i010, i011, i100, i101, i110, i111} = counter; #10;
				end
		end
endmodule	