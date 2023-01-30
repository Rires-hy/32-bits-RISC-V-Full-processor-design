module decoder38(
    input [2:0] a,
	 input e,
    output [7:0] d
    );
wire x,y,z;
not g1(z,a[0]);
not g2(y,a[1]);
not g3(x,a[2]);
and g4(d[0],x,y,z,e);
and g5(d[1],x,y,a[0],e);
and g6(d[2],x,a[1],z,e);
and g7(d[3],x,a[1],a[0],e);
and g8(d[4],a[2],y,z,e);
and g9(d[5],a[2],y,a[0],e);
and g10(d[6],a[2],a[1],z,e);
and g11(d[7],a[2],a[1],a[0],e);
endmodule