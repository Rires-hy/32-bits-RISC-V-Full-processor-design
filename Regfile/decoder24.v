module decoder24(
    input [1:0] a,
    output [3:0] d
    );
	 wire an0,an1;
               not(an0,a[0]),(an1,a[1]);
               and(d[0],an0,an1),(d[1],a[0],an1),(d[2],an0,a[1]),(d[3],a[0],a[1]);
endmodule
