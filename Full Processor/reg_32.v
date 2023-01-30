module reg_32(q, d, clk, en, clr);
   
   //Inputs
   input clk, en, clr;
   input [31:0] d;
  
   //Output
   output [31:0]q;
	genvar i;
	generate 
		for(i=0;i<32;i=i+1) begin: generate_block
			//(q, d, clk, en, clr)
			dffe_reg dffe_(q[i],d[i],clk,en,clr);
		end
	endgenerate
   
endmodule
