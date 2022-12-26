module xnor32(C,A,B);
input [31:0] A,B;
output [31:0] C;


	genvar i;
	
	generate 
	for (i=0;i<32;i=i+1) begin: generate_compare
	xnor xnor1(C[i],A[i],B[i]);
	end
	endgenerate


endmodule
