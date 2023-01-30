module Convert12(ALUout,ALUout12bit);
input [31:0] ALUout;
output [11:0] ALUout12bit;
assign ALUout12bit=ALUout[11:0];

endmodule