`timescale 1ns / 1ps
/*
  Module Name :- Falling edge detector
  Decription  :- This module detect the 1 to 0 (binary with respect to clk) based upon input signal
                 as 1 down to 0 represent the falling edge . 
                 Here , the input signal set initially 0.
                 All the ports are of one bit.
*/
module falling_edge_detector(
        input  clk,
        input signal_in,
        output reg edge_detected
);
reg  previous_signal_reg ;
always @(posedge clk )
begin
         edge_detected <= (previous_signal_reg &(~signal_in));
         previous_signal_reg <= signal_in;
 
end
endmodule
