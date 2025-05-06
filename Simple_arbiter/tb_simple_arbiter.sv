`timescale 1ns / 1ps
module tb_simple_arbiter();
   reg          clk;
   reg         reset;
   reg   [1:0] requester;
   wire  [1:0] grant;
/*-------------------------------------------------------------------------------------*/
 /// instantiate the simple_arbiter/////
 
 simple_arbiter dut_simple_arbiter(
   .clk(clk),
   .reset(reset),
   .requester(requester),
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
  requester = 2'b00; #10;
  reset = 0; requester = 2'b01; #10;
  requester = 2'b10; #10;
  requester = 2'b11; #10;
  requester = 2'b00; #10;
  $finish;
  
end

initial begin
$monitor("Time = %t | requester =  %b | grant = %b ", $time, requester, grant);
end
endmodule
