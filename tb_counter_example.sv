`timescale 1ns / 1ps
/*
 Module Name : tb_binary_counter 
 Desription  : This testbench  is used for both the binary and ring counter.
*/

module tb_counter_example();
  reg clk;
  reg reset;
  wire [3:0] binary_counter_output;
  wire [3:0]ring_counter_output;
  
  /*----------------------Instantiate the Binary counter--------------------------*/
  binary_counter dut_binary_counter(
  .clk(clk),
  .reset(reset),
  .binary_counter_output(binary_counter_output)
  );
/*----------------------Instantiate the Binary counter--------------------------*/
  ring_counter dut_ring_counter(
  .clk(clk),
  .reset(reset), 
  .ring_counter_output(ring_counter_output) 
  );  
/*----------------------clk Generation------------------------------------------*/
 initial clk = 0;
 always #5 clk =  ~clk;
/*----------------------Testcases----------------------------------------------*/
initial begin
 $monitor ($time ,"clk = %b | reset = %b | binary_counter_output = %b | ring_counter_output  = %b",
           clk,reset,binary_counter_output, ring_counter_output);
 reset = 1; #10;
 reset = 0; #100;
 
 $finish;
end

initial begin
$dumpfile ("dump.vcd");
$dumpvars;
end

endmodule
