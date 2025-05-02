`timescale 1ns / 1ps

module tb_prng_generator();
reg clk;
reg reset;
wire [3:0] lfsr_out;

/*---------------------------Instantiate the module--------------------------------*/
Prng_generator dut_prng_generator(
.clk(clk),
.reset(reset),
.lfsr_out(lfsr_out)
);
/*---------------------------CLK Generation out--------------------------------*/
initial begin
       clk = 0;
       forever#5 clk = ~clk;
end
/*-----------------------------TestCases--------------------------------*/
initial begin
  $display("Time\treset\lfsr_output");
  $monitor("%0t\t%b\t%d", $time,reset,lfsr_out);
  
  // Testcase1:
  reset = 1; // assert reset
  #10;
  reset = 0; // Deassert reset
  // Testcase2
  repeat(16) @(posedge clk);
  $stop;
  
end

endmodule
