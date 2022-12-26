module MUX41(out,in0,in1,in2,in3,s);
input [1:0] s;
input [31:0] in0, in1, in2, in3;
output [31:0] out;
wire [31:0] w1, w2;

MUX2 m0(w1,in0,in1,s[0]);
MUX2 m1(w2,in2,in3,s[0]);
MUX2 m2(out,w1,w2,s[1]);

endmodule
