module MUX81(out,in0,in1,in2,in3,in4,in5,in6,in7,s);

input [2:0] s;
input [31:0] in0, in1, in2, in3,in4,in5,in6,in7;
output [31:0] out;
wire [31:0] w1, w2;

MUX41 m0(w1,in0,in1,in2,in3,s[1:0]);
MUX41 m1(w2,in4,in5,in6,in7,s[1:0]);
MUX2 m2(out,w1,w2,s[2]);

endmodule

