`timescale 1ns / 1ps
module tb_simple_arbiter();
   reg          clk;
   reg         reset;
   reg   [1:0] requester_round_robin;
   wire  [1:0] grant;
/*-------------------------------------------------------------------------------------*/
 /// instantiate the simple_arbiter/////
 
 simple_round_robin_arbiter dut_simple_round_robin_arbiter(
   .clk(clk),
   .reset(reset),
   .requester_round_robin(requester_round_robin),
   .grant(grant)
 ) ;  

//// stimulus generator ///////
initial  begin
   clk = 0;
   forever #5 clk = ~clk;
end

/// testcase////
initial begin
  reset = 1;
  requester_round_robin = 2'b00; #10;
  reset = 0;#10 
  requester_round_robin = 2'b01;
  #10;
  requester_round_robin = 2'b10; 
  #10;
  requester_round_robin = 2'b11; 
  #10;
  requester_round_robin = 2'b00; 
  #50;
  $stop;
  
end

initial begin
$monitor("Time = %t | requester =  %b | grant = %b ", $time,  requester_round_robin, grant);
end
endmodule
