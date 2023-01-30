module FA(a, b, c_in, sum, c_out);
	input a, b, c_in;
	output sum, c_out;
	wire c, d, e;
	
	xor xor1(c, a, b);
	xor xor2(sum, c, c_in);
	and and1(d, c, c_in);
	and and2(e, a, b);
	or or1(c_out, d, e);
	
endmodule
