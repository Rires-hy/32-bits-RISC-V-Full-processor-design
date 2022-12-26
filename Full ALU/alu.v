module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan,overflow;

   // YOUR CODE HERE //
	wire cin,cout;
	wire [31:0] B;
	wire [31:0] resAdSb;
	wire [31:0] resAnd;
	wire [31:0] resOr;
	wire [31:0] resSLL;
	wire [31:0] resSRA;
	wire [31:0] unUse1,unUse2;
	
	////2 to 1 Mux, decision for add/sub,and solve cin 
	m21 m1(cin,0,1,ctrl_ALUopcode[0]);
	MUX2 mux2(B[31:0],data_operandB[31:0],~data_operandB[31:0],ctrl_ALUopcode[0]);
	
	//do add or sub
	CSA32 csa1(data_operandA[31:0],B[31:0],cin,resAdSb[31:0],cout);
	
	//do AND , OR
	and32 and1(resAnd[31:0],data_operandA[31:0],data_operandB[31:0]);
	or32 or1(resOr[31:0],data_operandA[31:0],data_operandB[31:0]);
	
	//do both shift op
	Lshift sll(resSLL[31:0],data_operandA[31:0],ctrl_shiftamt[4:0]);
	Rshift sra(resSRA[31:0],data_operandA[31:0],ctrl_shiftamt[4:0]);
	
	//8 to 1 Mux:module MUX81(out,in0,in1,in2,in3,in4,in5,in6,in7,s);
	MUX81 m81(
	data_result[31:0],
	resAdSb[31:0],
	resAdSb[31:0],
	resAnd[31:0],
	resOr[31:0],
	resSLL[31:0],
	resSRA[31:0],
	unUse1[31:0],
	unUse2[31:0],
	ctrl_ALUopcode[2:0]);
	
	//information signal value:
	//overflow
	xnor xnor1(overflow,data_operandA[31],B[31],cout,~data_result[31]);
	
	//	//less than
	xor xor1(isLessThan,overflow,resAdSb[31]);
	
	//not equal
	comp compare(isNotEqual,data_operandA[31:0],data_operandB[31:0]);
	
endmodule
