module MUX2(X, A0, A1, S);
   parameter WIDTH=32;     // How many bits wide are the lines

   output [WIDTH-1:0] X;   // The output line

   input [WIDTH-1:0]  A1;  // Input line with id 1'b1
   input [WIDTH-1:0]  A0;  // Input line with id 1'b0
   input 	      S;  // Selection bit
   
   assign X = S  ? A1 : A0;
endmodule // multiplexer_2_1


