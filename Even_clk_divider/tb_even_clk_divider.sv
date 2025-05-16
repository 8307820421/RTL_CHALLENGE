
`timescale 1ns / 1ps
module tb_even_clk_divider();
 parameter N= 3;
 reg      even_clk;
 reg      even_reset;
 wire     even_clk_out;
 
 /*----------------------------------Instantiate-----------------------------------------------------*/
 clock_divider #(
 .N(N)
 )dut_even_clock_ports(
  .even_clk(even_clk),
  .even_reset(even_reset),
  .even_clk_out(even_clk_out)
 );
 /*------------------------------------------------------------------------------------------------*/
initial begin
   even_clk     = 0;
   forever #5 even_clk = ~even_clk; 
end

initial begin
        // Initialize reset
        $dumpfile("fractional_clock_divider.vcd");
        $dumpvars(0, tb_even_clk_divider);
        
    even_reset = 1'b1; // assert
    #10;
    even_reset = 1'b0; // deassert
    #100;
    $finish;           // End simulation
    $display ("The even clk divider , Time = %0dns |even_ reset = %b|even_clk = %b |even_clk_out = %b ",
               $time ,even_reset, even_clk, even_clk_out);
end
endmodule
