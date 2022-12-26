module RCA(A,B,cin,s,cout);

input [3:0] A,B;
input cin;
output [3:0] s;
output cout;

wire [3:0] c;
                  
FA fa1(A[0],B[0],cin,s[0],c[1]);
FA fa2(A[1],B[1],c[1],s[1],c[2]);
FA fa3(A[2],B[2],c[2],s[2],c[3]);
FA fa4(A[3],B[3],c[3],s[3],cout);


endmodule
