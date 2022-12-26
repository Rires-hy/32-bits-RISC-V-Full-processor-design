module comp(notEqual,A,B);
input [31:0] A,B;
output notEqual;
wire [31:0] C;
xnor32 xn(C[31:0],A[31:0],B[31:0]);
nand32 na(notEqual,C[31:0]);

endmodule
