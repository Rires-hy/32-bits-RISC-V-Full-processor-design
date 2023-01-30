module MUX161(out,in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,s);

input [3:0] s;
input [31:0] in0, in1, in2, in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15;
output [31:0] out;
wire [31:0] w1, w2;

MUX81 m0(w1,in0,in1,in2,in3,in4,in5,in6,in7,s[2:0]);
MUX81 m1(w2,in8,in9,in10,in11,in12,in13,in14,in15,s[2:0]);
MUX2 m2(out,w1,w2,s[3]);

endmodule

