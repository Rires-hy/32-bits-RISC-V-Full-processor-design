module brcomp(data_readRegA,data_readRegB,BrNEq,BrLT);
input [31:0] data_readRegA,data_readRegB;
output BrNEq,BrLT;

wire [31:0] data_result;
//wire [4:0] ctrl_ALUopcode, ctrl_shiftamt;
wire isNotEqual, isLessThan, overflow;
alu myalu(data_readRegA, data_readRegB, 5'b00000,5'b00000, data_result, isNotEqual, isLessThan, overflow);

and a1(BrNEq,isNotEqual,1'b1);
and a2(BrLT,isLessThan,1'b1);

endmodule

