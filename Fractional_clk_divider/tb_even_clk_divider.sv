
`timescale 1ns / 1ps
module tb_even_clk_divider();
 
 reg      clk;
 reg      reset;
 wire     clk_out;
 
 /*----------------------------------Instantiate-----------------------------------------------------*/
 fractional_clk_divider dut_fractional_clock_ports(
  .clk(clk),
  .reset(reset),
  .clk_out(clk_out)
 );
 /*------------------------------------------------------------------------------------------------*/
initial begin
   clk     = 0;
   forever #5 clk = ~clk; 
end

initial begin
        // Initialize reset
        $dumpfile("fractional_clock_divider.vcd");
        $dumpvars(0, tb_even_clk_divider);
        
    reset = 1'b1; // assert
    #10;
    reset = 1'b0; // deassert
    #100;
    $finish;           // End simulation
    $display ("The odd clk divider , Time = %0dns |reset = %b|clk = %b |clk_out = %b ",
               $time ,reset, clk, clk_out);
end
endmodule
