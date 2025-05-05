`timescale 1ns / 1ps
/*
 Module Name : rising_edge_detector
 Desription  : This module detect the rising edge from (0 to 1) .
                Here All ports are set to 1 bit and they intialize the input signal with 1.
*/
module rising_edge_detector(
       input clk,
       input signal_in,
       output reg edge_detected
);
reg previous_signal_reg ;

always @(posedge clk)
begin
     edge_detected  <= ((~previous_signal_reg) & signal_in);
     previous_signal_reg <= signal_in;
end
endmodule
