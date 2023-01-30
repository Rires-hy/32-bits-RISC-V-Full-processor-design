module Convert32(InsPlus1,InsPlus1_32b);
input [11:0] InsPlus1;
output [31:0] InsPlus1_32b;
assign InsPlus1_32b={{20'b0},InsPlus1};

endmodule