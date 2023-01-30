module decoder532(
    input [4:0] a,
    output [31:0] d
    );

	 wire [3:0] w;
	 
	 decoder24 d0(a[4:3],w[3:0]);
	 
	 decoder38 d1(a[2:0],w[0],d[7:0]);
	 decoder38 d2(a[2:0],w[1],d[15:8]);
	 decoder38 d3(a[2:0],w[2],d[23:16]);
	 decoder38 d4(a[2:0],w[3],d[31:24]);
	 
	 endmodule
	 