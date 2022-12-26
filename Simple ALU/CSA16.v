module CSA16 (a,b,cin,s,cout);
input [15:0] a,b;
input cin;
output [15:0] s;
output cout;

wire c;
wire [7:0] s0,s1;
CSA8 a1(a[7:0],b[7:0],cin,s[7:0],cs);


CSA8 a2(a[15:8],b[15:8],0,s0[7:0],c0);
CSA8 a3(a[15:8],b[15:8],1,s1[7:0],c1);

assign s[15:8] = cs ? s1[7:0] : s0[7:0];
assign cout = cs ? c1 : c0;

endmodule
