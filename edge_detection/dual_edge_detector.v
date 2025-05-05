`timescale 1ns / 1ps
/*
Module Name : Dual edge detector
Description : This module detect the dual edge (both rising and falling edge).
              Here XOR operator used.
              Here It does not matter that trnasition of 1 to 0 and 0 to 1 the dual edge detected set to 1'b1 ;
*/
module dual_edge_detector(
          input clk,
          input signal_in,
          output reg dual_edge_detected
    );
    
 reg previous_signal_reg ;
 always @(posedge clk)
 begin
    dual_edge_detected <= (previous_signal_reg ^ signal_in);// XOR detects any transition
  
     previous_signal_reg <= signal_in;// Store current signal
 end
endmodule
