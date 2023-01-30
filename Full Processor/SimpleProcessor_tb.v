`timescale 1ns/100ps
module SimpleProcessor_tb();
    // inputs
    reg clock, ctrl_reset;

    // outputs
    wire imem_clock, dmem_clock, processor_clock, regfile_clock;
    wire[31:0] data_readRegA, data_readRegB, q_dmem, q_imem;
    wire[4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    wire[31:0] data_writeReg;
	 wire ctrl_writeEnable;

    // Tracking the number of errors
    integer errors;
    integer index;    // for testing...
    integer clk_index;
    reg[31:0] ans_list[0:12];
    // instantiate
    skeleton_test my_skeleton(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock, data_readRegA, data_readRegB, q_dmem, q_imem, ctrl_writeReg, ctrl_readRegA, ctrl_readRegB, data_writeReg,ctrl_writeEnable);


    // setting the initial values of all the reg
    initial
        begin
            $display($time, " << Starting the Simulation >>");
            clock = 1'b0;    // at time 0
            errors = 0;

            ans_list[0] = 5;
            ans_list[1] = 3;
            ans_list[2] = 8;
            ans_list[3] = 2;
            ans_list[4] = 0;
            ans_list[5] = 1;
            ans_list[6] = 3;
            ans_list[7] = 20;
            ans_list[8] = 4;
            ans_list[9] = 345;
            ans_list[10] = 567;
            ans_list[11] = 345;
            ans_list[12] = 567;

            ctrl_reset = 1'b1;    // assert reset
            @(negedge clock);    // wait until next negative edge of clock
            ctrl_reset = 1'b0;    // de-assert reset
            @(posedge clock);
          
            // Begin testing... (loop over registers)
            for (index = 0; index < 20; index = index+1)
                begin
                    for (clk_index = 0; clk_index < 8; clk_index = clk_index+1)
                        begin
                            @(posedge clock);
                        end
                    if (data_readRegA != 0 || data_readRegB != ans_list[index])
                        begin
                            $display("** Error on read index %d exp: %d output: %d **", index, ans_list[index], data_readRegB);
                            errors = errors+1;
                        end
                end


            if (errors == 0) begin
                $display("The simulation completed without errors");
            end
            else begin
                $display("The simulation failed with %d errors", errors);
            end

            $stop;
        end


    // Clock generator
    always
        #10 clock = ~clock;    // toggle

endmodule
