module RCA_12bit (A, B, c_in, c_out, sum, last_in);

	input [11:0] A,B;
	input c_in;
	output [11:0] sum;
	output c_out, last_in;
	
	wire [10:0] connection;
	
	//4
	FA FA1(.a(A[0]), .b(B[0]), .c_in(c_in), 
			 .sum(sum[0]), .c_out(connection[0])
			);
			
	FA FA2(.a(A[1]), .b(B[1]), .c_in(connection[0]), 
			 .sum(sum[1]), .c_out(connection[1])
			);
	
	FA FA3(.a(A[2]), .b(B[2]), .c_in(connection[1]), 
			 .sum(sum[2]), .c_out(connection[2])
			);
	
	FA FA4(.a(A[3]), .b(B[3]), .c_in(connection[2]), 
			 .sum(sum[3]), .c_out(connection[3])
			);
	
	//8
	FA FA5(.a(A[4]), .b(B[4]), .c_in(connection[3]), 
			 .sum(sum[4]), .c_out(connection[4])
			);
			
	FA FA6(.a(A[5]), .b(B[5]), .c_in(connection[4]), 
			 .sum(sum[5]), .c_out(connection[5])
			);
	FA FA7(.a(A[6]), .b(B[6]), .c_in(connection[5]), 
			 .sum(sum[6]), .c_out(connection[6])
			);
	FA FA8(.a(A[7]), .b(B[7]), .c_in(connection[6]), 
			 .sum(sum[7]), .c_out(connection[7])
			);
	
	//12
	FA FA9(.a(A[8]), .b(B[8]), .c_in(connection[7]), 
			 .sum(sum[8]), .c_out(connection[8])
			);
			
	FA FA10(.a(A[9]), .b(B[9]), .c_in(connection[8]), 
			 .sum(sum[9]), .c_out(connection[9])
			);
	FA FA11(.a(A[10]), .b(B[10]), .c_in(connection[9]), 
			 .sum(sum[10]), .c_out(connection[10])
			);
	and (last_in, connection[10],1'b1);
	FA FA12(.a(A[11]), .b(B[11]), .c_in(connection[10]), 
			 .sum(sum[11]), .c_out(c_out)
			);

endmodule

	