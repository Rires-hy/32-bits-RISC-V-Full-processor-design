# Checkpoint 1

Name: Haoyu Fu

netID: hf83

**Checkpoint 1:**

Firstly, the main addition function was achieved by a **32 bits carry select adder**, which was further implemented by 16 bits CSA, 8 bits CSA and 4bits RCA. I use **cin** and **cout** to be the input and output of this "**CSA32()**" function. The subtraction was reached by applying 2's complement to **wire B**, which was selected by a multiplexer according to the **least significant bits** of ctrl_ALUopcode (after this processing, the input to ALU is "**B[31:0]**"). Besides, if doing subtraction, the carry in should be set as 1 also according to the **least significant bits** of ctrl_ALUopcode. Finally, this design could pass the testbench simulation **without errors**.  



**Checkpoint 2 update:**

The **AND** and **OR** function were easily achieved by add the input to those gates. The **shift** function was reached by applying the Bit-slice, Bit-repeat, and Bit-assemble: `assign c = {5{1'b0}, a[2:0]}`. The difference of arithmetic shift is adding the bits according to the sign bit of A instead of directly give it '0' as logic shift. Besides, the "**NotEqual**" bit was decided by the result of subtract: if all the 32 bits of result are '0', the two input are equal, vice versa. Finally, the **less than** bit was determined by the **xor** of overflow bit and the most significant bit of subtract result.  