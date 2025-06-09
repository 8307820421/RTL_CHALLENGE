`timescale 1ns / 1ps
module tb_dig2bin();
reg  sys_clk ;
//reg   rst;
reg [11:0] dac_in;
reg  newd;
reg  cs;
reg MOSI;
reg sclk;
reg wr_done;

//////////////////////////////create dut
dig2bin dut_pmod_DA4_ports(
.sys_clk(sys_clk),
//.rst(rst),
.dac_in(dac_in),
.newd(newd),
.cs(cs),
.MOSI(MOSI),
.sclk(sclk),
.wr_done(wr_done)
);
//////////////////////////////////
/*
   ONCE WR_DONE THEN THE TESTBENCH CONTROL WITH RESECT TO THE TEST CASESof DAC_IN.
*/
///////////////////////////////
    // Generate 100 MHz clock
    initial begin
        sys_clk = 0;
        forever #5 sys_clk = ~sys_clk; // 100 MHz clock (10 ns period)
    end



    // Stimulus process
    initial begin
        // Initialize inputs
        newd = 0;
        dac_in = 12'h000;

        // Reset DAC
        @(posedge sclk);
        newd = 1; // Release reset

        // Write first value to DAC
        dac_in = 12'hABC;
        @(posedge wr_done);
        @(posedge sclk);
        // Write second value to DAC
        dac_in = 12'h123;
        @(posedge wr_done);
        @(posedge sclk);
        // Write third value to DAC
        dac_in = 12'hDEF;
        @(posedge wr_done);   
        @(posedge sclk);

        // Finish simulation
        $stop;
    end

    // Monitor outputs


endmodule
