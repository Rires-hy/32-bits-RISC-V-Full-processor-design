module CP5WBsel(data_writeReg,WBSel,q_dmem,ALUout_,InsPlus1_32b);
input [31:0] InsPlus1_32b,ALUout_,q_dmem;
input [1:0] WBSel;
output [31:0] data_writeReg;

MUX41 mym4(data_writeReg,q_dmem,ALUout_,InsPlus1_32b,32'b0,WBSel);

endmodule
