module sx(q_imem,Immsel,aftExt);
//sx sx1(q_imem[16:0],Immsel,aftExt);

input  [16:0] q_imem;
input  Immsel;
output [31:0] aftExt;

reg ext[14:0];
assign aftExt[31:17]=Immsel? 15'b111111111111111:15'b0;
assign aftExt[16:0]= q_imem[16:0];


endmodule
