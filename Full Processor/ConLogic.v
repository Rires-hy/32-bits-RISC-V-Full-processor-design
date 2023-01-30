module ConLogic(
	q_imem,Immsel,ctrl_writeEnable,Bsel,ALUSel,
	wren,WBSel,PCSel,BrNEq,BrLT,Asel, setx, bex, jal, swt_d
);
	input [31:0] q_imem;
	input BrNEq, BrLT;
	output Immsel,ctrl_writeEnable,Bsel,wren,PCSel,Asel,bex, setx,jal, swt_d;
	output [1:0] WBSel;
	output [4:0] ALUSel;
	
	// add, addi [1]
	wire de_code[10:0];
	and a0(de_code[0], ~q_imem[31], ~q_imem[30], ~q_imem[29], ~q_imem[28], ~q_imem[27]); // add[0]
	and a1(de_code[1], ~q_imem[31], ~q_imem[30], q_imem[29], ~q_imem[28], q_imem[27]); // addi[1]
	and a2(de_code[2], ~q_imem[31], ~q_imem[30], q_imem[29], q_imem[28], q_imem[27]); // sw[2]
	and a3(de_code[3], ~q_imem[31], q_imem[30], ~q_imem[29], ~q_imem[28], ~q_imem[27]); // lw[3]
	and a4(de_code[4], ~q_imem[31], ~q_imem[30], ~q_imem[29], ~q_imem[28], q_imem[27]); // jt[4]
	and a5(de_code[5], ~q_imem[31], ~q_imem[30], ~q_imem[29], q_imem[28], ~q_imem[27]); // bne[5]
	and a6(de_code[6], ~q_imem[31], ~q_imem[30], ~q_imem[29], q_imem[28], q_imem[27]); // jal[6]
	and a7(de_code[7], ~q_imem[31], ~q_imem[30], q_imem[29], ~q_imem[28], ~q_imem[27]); // jr[7]
	and a8(de_code[8], ~q_imem[31], ~q_imem[30], q_imem[29], q_imem[28], ~q_imem[27]); // blt[8]
	and a9(de_code[9], q_imem[31], ~q_imem[30], q_imem[29], q_imem[28], ~q_imem[27]); // bex[9]
	and a10(de_code[10], q_imem[31], ~q_imem[30], q_imem[29], ~q_imem[28], q_imem[27]); // setx[10]
	
	assign Immsel = de_code[0] ? 1'b0 : 1'b1;
	or wren_or(ctrl_writeEnable, de_code[0], de_code[1], de_code[3], de_code[6], de_code[10]); //add addi lw jal setx
	
	wire Bsel_;
	or bsel_o(Bsel_, de_code[0], de_code[7]);
	assign Bsel = ~Bsel_;
	
	assign ALUSel = de_code[0] ? q_imem[6:2] : 5'b00000;
	assign wren = de_code[2] ? 1'b1 : 1'b0;
	assign WBSel[1] = de_code[6] ? 1'b1 : 1'b0;
	or wbsel_o(WBSel[0], de_code[0], de_code[1], de_code[10]);//add addi setx
	
	wire PCsel1, PCSel2, ne;
	or o_PCsel(PCsel1, de_code[4], de_code[6], de_code[7]); // jt jal jr
	or o_ne(ne, de_code[5], de_code[9]);
	assign PCSel2 =  ne ? BrNEq : PCsel1; //bne, bex
	assign PCSel =  de_code[8] ? BrLT : PCSel2; //blt
	or o_Asel(Asel , de_code[5], de_code[8]); //bne blt
	assign setx = de_code[10];
	assign bex = de_code[9];
	assign jal = de_code[6];
	//bne jr blt sw
	or switch_o(swt_d, de_code[5], de_code[7],de_code[8], de_code[2]);
	
endmodule
