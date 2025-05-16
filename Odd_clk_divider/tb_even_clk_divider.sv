
`timescale 1ns / 1ps
module tb_odd_clk_divider();
 parameter N= 3;
 reg      odd_clk;
 reg      odd_reset;
 wire     odd_clk_out;
 
 /*----------------------------------Instantiate-----------------------------------------------------*/
 clock_divider #(
 .N(N)
 )dut_odd_clock_ports(
  .odd_clk(odd_clk),
  .odd_reset(odd_reset),
  .odd_clk_out(odd_clk_out)
 );
 /*------------------------------------------------------------------------------------------------*/
initial begin
   odd_clk     = 0;
   forever #5 odd_clk = ~odd_clk; 
end

initial begin
        // Initialize reset
        $dumpfile("fractional_clock_divider.vcd");
 $dumpvars(0, tb_odd_clk_divider);
        
    odd_reset = 1'b1; // assert
    #10;
    odd_reset = 1'b0; // deassert
    #100;
    $finish;           // End simulation
    $display ("The odd clk divider , Time = %0dns |odd_reset = %b|odd_clk = %b |odd_clk_out = %b ",
               $time ,odd_reset, odd_clk, odd_clk_out);
end
endmodule
