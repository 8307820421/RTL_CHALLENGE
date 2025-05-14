`timescale 1ns / 1ps
module tb_finoacci_series();
 reg clk;
 reg  reset;
 reg  start; // enable condition
 reg [3:0]index_n; // index values
 wire [31:0] fib_result; // final fibnocci result
 wire  done ;             // acknowledge

// instnatiate the module

fibonacci_series dut_fibonacci_series(
.clk(clk),
.reset(reset),
.start(start),
.index_n(index_n),
.fib_result(fib_result),
.done(done)
);

// clk generator logic
initial begin
   clk = 0;
   forever #5 clk = ~clk;
end

// test case

initial begin
  reset = 1'b1;
  start = 1'b0;
  index_n = 4'd5;// Test for F(5)
  #10
  reset = 1'b0; start = 1'b1;
  @(posedge done);
  $display("F(5) = %d", fib_result);
  #10 
  
   start = 1'b0;   // when it reset or zero give the input 
   index_n = 4'd7;// Test for F(7)
   #10 
     start = 1; // when it enable then actual logic starts
    @(posedge done);// based on output status see the result
    $display("F(7)= %d",  fib_result);
    #10 $stop;
  
end


endmodule
