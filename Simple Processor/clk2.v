module clk2(clk,reset,out,out_bar);

input clk,reset;
output out,out_bar;

//module dffe_reg(q, d, clk, en, clr);
dffe_reg dff1(out,~out,clk,1'b1,reset);
assign out_bar = ~out;

endmodule

