module CSA8 (a,b,cin,s,cout);
input [7:0] a,b;
input cin;
output [7:0] s;
output cout;

wire c;
wire [3:0] s0,s1;
RCA a1(a[3:0],b[3:0],cin,s[3:0],cs);


RCA a2(a[7:4],b[7:4],0,s0[3:0],c0);
RCA a3(a[7:4],b[7:4],1,s1[3:0],c1);

assign s[7:4] = cs ? s1[3:0] : s0[3:0];
assign cout = cs ? c1 : c0;

endmodule




