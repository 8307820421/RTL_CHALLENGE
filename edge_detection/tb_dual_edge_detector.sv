`timescale 1ns / 1ps
/*
  Module Name : tb_dual_edge_detector
  Description : Here based upon clk stimulus the logic is written and developed .
                Observe the truth table for edge detected.
*/
module tb_dual_edge_detector();
  reg clk;
  reg signal_in;
  wire dual_edge_detected;
  
/*
   Instantiate the dual edge detector module
*/
dual_edge_detector dut(
.clk(clk),
.signal_in(signal_in),
.dual_edge_detected(dual_edge_detected)
);

initial begin
   clk  = 0;
forever #5 clk = ~clk;
end
initial begin
signal_in = 0;
#12 signal_in = 1;
#10 signal_in = 0;
#10 signal_in = 1;
#10 signal_in = 1;
#10 signal_in = 0;
#10 $stop;
end

// load dump.vcd file
initial begin
  $dumpfile ("dump.vcd");
  $dumpvars;
end
endmodule
