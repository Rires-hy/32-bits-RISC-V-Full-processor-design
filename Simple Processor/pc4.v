module pc4(
	address_imem,InsPlus1
);
	input [11:0] address_imem;
	output [11:0] InsPlus1;
	wire  c_out, last_in;
	RCA_12bit adder(address_imem, 12'd1, 1'b0, c_out, InsPlus1, last_in);
endmodule
