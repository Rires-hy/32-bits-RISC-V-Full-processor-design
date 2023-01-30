module reg32(q, d, clk, en, clr);
   input clk, en, clr;
   input [31:0] d;
	output [31:0] q;
	
	genvar i;
	generate for (i=0;i<=31;i=i+1) begin:dffe_loop
	dffe_ref d1(q[i],d[i],clk,en,clr);
	end
	endgenerate 
	
	endmodule
	