module decoder(sel, out);
   
   input[4:0] sel;
   output [31:0]out;
	
	and a0(out[0], ~sel[4], ~sel[3], ~sel[2], ~sel[1], ~sel[0]); //00000
	and a1(out[1], ~sel[4], ~sel[3], ~sel[2], ~sel[1],  sel[0]); //00001
	and a2(out[2], ~sel[4], ~sel[3], ~sel[2],  sel[1], ~sel[0]); //00010
	and a3(out[3], ~sel[4], ~sel[3], ~sel[2],  sel[1],  sel[0]); //00011
	and a4(out[4], ~sel[4], ~sel[3],  sel[2], ~sel[1], ~sel[0]); //00100
	and a5(out[5], ~sel[4], ~sel[3], sel[2],  ~sel[1],  sel[0]); //00101
	and a6(out[6], ~sel[4], ~sel[3], sel[2],  sel[1],  ~sel[0]); //00110
	
	and a7(out[7], ~sel[4], ~sel[3], sel[2],  sel[1],  sel[0]); //00111
	and a8(out[8], ~sel[4], sel[3], ~sel[2],  ~sel[1],  ~sel[0]); //01000
	and a9(out[9], ~sel[4], sel[3], ~sel[2],  ~sel[1],  sel[0]); //01001
	and a10(out[10], ~sel[4], sel[3], ~sel[2],  sel[1],  ~sel[0]); //01010
	and a11(out[11], ~sel[4], sel[3], ~sel[2],  sel[1],  sel[0]); //01011
	and a12(out[12], ~sel[4], sel[3], sel[2],  ~sel[1],  ~sel[0]); //01100
	
	and a13(out[13], ~sel[4], sel[3], sel[2],  ~sel[1],  sel[0]); //01101
	and a14(out[14], ~sel[4], sel[3], sel[2],  sel[1],  ~sel[0]); //01110
	and a15(out[15], ~sel[4], sel[3], sel[2],  sel[1],  sel[0]); //01111
	and a16(out[16], sel[4], ~sel[3], ~sel[2],  ~sel[1],  ~sel[0]); //10000
	and a17(out[17], sel[4], ~sel[3], ~sel[2],  ~sel[1],  sel[0]); //10001
	and a18(out[18], sel[4], ~sel[3], ~sel[2],  sel[1],  ~sel[0]); //10010
	and a19(out[19], sel[4], ~sel[3], ~sel[2],  sel[1],  sel[0]); //10011
	
	and a20(out[20], sel[4], ~sel[3], sel[2],  ~sel[1],  ~sel[0]); //10100
	and a21(out[21], sel[4], ~sel[3], sel[2],  ~sel[1],  sel[0]); //10101
	and a22(out[22], sel[4], ~sel[3], sel[2],  sel[1],  ~sel[0]); //10110
	and a23(out[23], sel[4], ~sel[3], sel[2],  sel[1],  sel[0]); //10111
	and a24(out[24], sel[4], sel[3], ~sel[2],  ~sel[1],  ~sel[0]); //11000
	and a25(out[25], sel[4], sel[3], ~sel[2],  ~sel[1],  sel[0]); //11001
	and a26(out[26], sel[4], sel[3], ~sel[2],  sel[1],  ~sel[0]); //11010
	and a27(out[27], sel[4], sel[3], ~sel[2],  sel[1],  sel[0]); //11011
	and a28(out[28], sel[4], sel[3], sel[2],  ~sel[1],  ~sel[0]); //11100
	and a29(out[29], sel[4], sel[3], sel[2],  ~sel[1],  sel[0]); //11101
	
	and a30(out[30], sel[4], sel[3], sel[2],  sel[1],  ~sel[0]); //11110
	and a31(out[31], sel[4], sel[3], sel[2],  sel[1],  sel[0]); //11111

   
endmodule
