module CSA32 (a,b,cin,s,cout);
input [31:0] a,b;
input cin;
output [31:0] s;
output cout;

wire c;
wire [15:0] s0,s1;
CSA16 a1(a[15:0],b[15:0],cin,s[15:0],cs);


CSA16 a2(a[31:16],b[31:16],0,s0[15:0],c0);
CSA16 a3(a[31:16],b[31:16],1,s1[15:0],c1);

assign s[31:16] = cs ? s1[15:0] : s0[15:0];
assign cout = cs ? c1 : c0;

endmodule