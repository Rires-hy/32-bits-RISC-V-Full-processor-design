module Lshift(out,a,s);
input [31:0] a;
input [4:0] s;
output [31:0] out;

wire [31:0] w0; 
wire [31:0] w1; 
wire [31:0] w2; 
wire [31:0] w3; 
wire [31:0] w4;
wire [31:0] o0; 
wire [31:0] o1; 
wire [31:0] o2; 
wire [31:0] o3; 
wire [31:0] o4; 


//s[0]
assign w0[31:0]={a[30:0],{1'b0}};
MUX2 m0(o0[31:0],w0[31:0],a[31:0],~s[0]);

//s[1]
assign w1[31:0]={o0[29:0],2'b00};
MUX2 m1(o1[31:0],w1[31:0],o0[31:0],~s[1]);

//s[2]
assign w2[31:0]={o1[27:0],4'b0000};
MUX2 m2(o2[31:0],w2[31:0],o1[31:0],~s[2]);

//s[3]
assign w3[31:0]={o2[23:0],8'b00000000};
MUX2 m3(o3[31:0],w3[31:0],o2[31:0],~s[3]);

//s[4]
assign w4[31:0]={o3[15:0],16'b0000000000000000};
MUX2 m4(out[31:0],w4[31:0],o3[31:0],~s[4]);

endmodule
