module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
	 //debug
//	 test_data
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;
	
	wire [31:0] read_eA,read_eB, write_e;
	wire [31:0] reg_d[0:31];
	wire [31:0] a_out;
	
	//debug
//	output [31:0] test_data;
//	wire [31:0] read_20;
//	decoder readtest(5'd20, read_20);
//	genvar p;
//	generate 
//		for(p=0;p<32;p=p+1) begin: generate_block4
//			assign test_data = read_20[p] ? reg_d[p] : 32'bz;
//		end
//	endgenerate

//	output [31:0] read_eA,read_eB, write_e;
//	output [31:0] a_out;
	
	//decoder(sel, out);
	decoder readA(ctrl_readRegA, read_eA);
	decoder readB(ctrl_readRegB, read_eB);
	decoder write(ctrl_writeReg, write_e);
	//and a_0(write_e[0],0,0);

   //write reg
	//module reg_32(q, d, clk, en, clr);
	reg_32 reg_32_0(reg_d[0],data_writeReg,clock,0,ctrl_reset);
	
	genvar i;
	generate 
		for(i=1;i<32;i=i+1) begin: generate_block1
			//(q, d, clk, en, clr)
			
			and a_1(a_out[i], write_e[i], ctrl_writeEnable);
			reg_32 reg_32_(reg_d[i],data_writeReg,clock,a_out[i],ctrl_reset);
		end
	endgenerate
	
	genvar j;
	generate 
		for(j=0;j<32;j=j+1) begin: generate_block2
			assign data_readRegA = read_eA[j] ? reg_d[j] : 32'bz;
		end
	endgenerate
	
	
	genvar k;
	generate 
		for(k=0;k<32;k=k+1) begin: generate_block3
			assign data_readRegB = read_eB[k] ? reg_d[k] : 32'bz;
		end
	endgenerate
	
	
	
endmodule
