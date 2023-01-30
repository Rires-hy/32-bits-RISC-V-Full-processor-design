module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	wire [31:0] befEna,aftEna,triA,triB,r0;
	wire [31:0] q [31:0];
// decide which one to write:
	
	//module decoder532( input [4:0] a,output [31:0] d);
	decoder532 dwrite(ctrl_writeReg[4:0],befEna[31:0]);
	and32 a1(aftEna[31:0],befEna[31:0],ctrl_writeEnable);
	
	//32 32bit reg
	//module reg32(q, d, clk, en, clr);
	genvar i;
	generate for (i=1;i<=31;i=i+1) begin: reg32_32
		reg32 reg1(q[i],data_writeReg[31:0],clock,aftEna[i],ctrl_reset);
		end
		endgenerate
	
	and32sb asb(q[0],0,0); 
	
	
	//readA,readB
	decoder532 dreadA(ctrl_readRegA[4:0],triA[31:0]);
	decoder532 dreadB(ctrl_readRegB[4:0],triB[31:0]);	
	//tristate A
	genvar j;
	generate for (j=0;j<=31;j=j+1) begin: readA
	assign  data_readRegA[31:0]= triA[j] ? q[j] : 32'bz;
	end 
	endgenerate

	//tristate B
		genvar k;
	generate for (k=0;k<=31;k=k+1) begin: readB
	assign  data_readRegB[31:0]= triB[k] ? q[k] : 32'bz;
	end 
	endgenerate

endmodule
