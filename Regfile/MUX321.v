module MUX321(out,in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,
						in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,s);

input [4:0] s;
input [31:0] in0, in1, in2, in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,
						in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31;
output [31:0] out;
wire [31:0] w1, w2;

MUX161 m0(w1,in0, in1, in2, in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,s[3:0]);
MUX161 m1(w2,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,s[3:0]);
MUX2 m2(out,w1,w2,s[4]);

endmodule

