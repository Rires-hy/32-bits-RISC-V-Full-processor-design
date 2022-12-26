module ConLogic(
	q_imem,Immsel, RegWEn, 
	Bsel, ALUSel, MemRW, WBSel
);
	input [31:0] q_imem;
	output Immsel, RegWEn, Bsel, MemRW, WBSel;
	output [4:0] ALUSel;
	
	assign Immsel = q_imem[16];
	assign RegWEn = ~q_imem[28];
	or or1(Bsel, q_imem[31],q_imem[30],q_imem[29],q_imem[28], q_imem[27]);
	assign ALUSel = Bsel ? 5'b00000 : q_imem[6:2];
	assign MemRW = q_imem[28]; //sw 001'1'1
	assign WBSel = q_imem[30]; // lw 0'1'000
	//assign WBSel = 1'b1;
	
endmodule
