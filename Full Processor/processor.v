/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Input
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem ////
    
	 q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem ////
    data,                           // O: The data to write to dmem ////
    wren,                           // O: Write enable for dmem
	 
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
);
	 
	 // Control signals
    input clock, reset;
		
    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;
	 
    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;
	 
    /* YOUR CODE STARTS HERE */
	 //wire declare
	 wire isNotEqual, isLessThan, overflow,Immsel,RegWEn,Bsel,PCSel,BrNEq,BrLT,Asel, setx, bex, jal,swt_d; //MemRW = wren
	 wire [31:0] aftExt,aftBmux,ALUout, ALUout_, overflow_j, overflow_rpt,aftShift2,address_imem_32bits,aftAsel,InsPlus1_32b;
	 wire [4:0] ALUSel,aftoverflow_mux,aftjal_mux, beforectrl_readRegB;
	 wire [11:0] InsPlus1,ALUout12bit,aftPCSel;
	 wire [1:0] WBSel;
	 //pc + 4 output address_imem
	 // address_imem,                   // O: The address of the data to get from imem
	 pc4 plus(address_imem,InsPlus1);
	 //module reg_32(q, d, clk, en, clr);
	 reg_32 PC(address_imem, aftPCSel, clock, 1'b1, reset);
	 
	 //control logic 
	 //ctrl_writeEnable,               // O: Write enable for regfile
	 //wren,                           // O: Write enable for dmem
	 
	 //old control logic:
	 //ConLogic cl1(q_imem,Immsel,ctrl_writeEnable,Bsel,ALUSel,wren,WBSel);
	 //new:
	 ConLogic cl_CP5(q_imem,Immsel,ctrl_writeEnable,Bsel,ALUSel,wren,WBSel,PCSel,BrNEq,BrLT, Asel, setx, bex, jal,swt_d);//WBSel ???????????????
	 
	 //Imem
	 // imem my_imem(address_imem,imem_clock,q_imem);
	 
		
	 //dmem
	 //address_dmem,                   // O: The address of the data to get or put from/to dmem ////
    //data,                           // O: The data to write to dmem ////
	 assign data = data_readRegB;
	 assign address_dmem = ALUout[11:0];
	 //dmem dm1(ALUout[11:0],dmem_clock,data_readRegB,MemRW,aftDmem);
	 
	 
	 // Regfile
	 //    ctrl_writeReg,                  // O: Register to write to in regfile
	 //    ctrl_readRegA,                  // O: Register to read from port A of regfile
	 //    ctrl_readRegB,                  // O: Register to read from port B of regfile
	 assign aftoverflow_mux = overflow ? 5'd30 : q_imem[26:22];
	 //134???mux?????????187???
	 //assign ctrl_readRegA = q	_imem[21:17];
	 //BNE,JR,BLT.SW
	 assign beforectrl_readRegB = swt_d ? q_imem[26:22]:q_imem[16:12];
	 //regfile regf(reg_clock,ctrl_writeEnable,reset,q_imem[26:22],q_imem[21:17],q_imem[16:12],data_writeReg,data_readRegA,data_readRegB);
	
	 //alu
	 alu a1(aftAsel,aftBmux,ALUSel,q_imem[11:7],ALUout,isNotEqual, isLessThan, overflow);
	 
	 //sign extension(sx) 
	 sx sx1(q_imem[16:0],aftExt);
	 
	 //mux for Bsel
	 assign aftBmux = Bsel ? aftExt : data_readRegB;
	
	 
	 //mux for WBsel
	 //    data_writeReg,                  // O: Data to write to for regfile 
	 assign overflow_rpt = q_imem[29]?32'd2:overflow_j;
	 assign overflow_j = q_imem[2]?32'd3:32'd1;
	 assign ALUout_ = overflow ? overflow_rpt : ALUout;
	 //assign data_writeReg = WBSel ? q_dmem : ALUout_;//??????4 to 1 mux(????????????),?????????????????????????????????
	 
	 //pc+4 ???32bits
	 Convert32 pcplus4To32(InsPlus1,InsPlus1_32b);//
	 
	 //????????????
	 CP5WBsel my3to1(data_writeReg,WBSel,q_dmem,ALUout_,InsPlus1_32b);
	 
	 //branch comparator P38,BrEQ???BrNEQ?????????????????????????????????signed
	 brcomp Mybrcomp(data_readRegB,data_readRegA,BrNEq,BrLT);//
	 
	 //left shift 2 ??????bsel????????????Asel?????????branch??????????????????
	 //?????????Asel=1???shift 2??????Asel=0???output=input
//	 leftshift2 Mylefts(aftBmux,Asel,aftShift2);//??????ed???????????????????????????
	 
	 //PC???12bit??????PC(32bits)
	 Convert32 my12to32(InsPlus1,address_imem_32bits);
	 
	 //select between pc+1(32bits) and DataA 
	 assign aftAsel = Asel ? 	address_imem_32bits : data_readRegA;
	 
	 //alu??????12bits
	 Convert12 my32to12(ALUout,ALUout12bit);
	 
	 //PCsel
	 assign aftPCSel = PCSel ? ALUout12bit : InsPlus1;
	 
//	 setx -> addi (Addr???D[26:22]=$rstatus)
	 assign ctrl_writeReg=setx ? 5'd30 : aftjal_mux;
//	 Bex -> bne (Addr???A(B)[26:22]=$rstatus)
	 
	 assign ctrl_readRegB= bex ? 5'd30 :beforectrl_readRegB;
	 
//	 Jal -> ctrl_WriteReg_destination=$31(134????????????mux???
	 assign aftjal_mux=jal ? 5'd31: aftoverflow_mux;
	 
	//use $r0:
	 assign ctrl_readRegA =setx ? 5'd0 :  q_imem[21:17]; 
	 
endmodule
