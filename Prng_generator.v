`timescale 1ns / 1ps
/*
  module name : prng_gnerator (pseudo random number gnerator) with cyclic shifter via LFSR (4bit)
  Description : This module is used for pseudo random sequence number generator that is used to  generate the random numbers.
  Application : It is used in networking protocol where initail seqnumber need to set . Also other application is Crytographic, signal processing.
                These also work on polynomial functions with power of variables .
  Ports requirement :  Here , there in no input data port required 
  input port           : clk, reset
  output               : lfsr_out.
  
*/
module Prng_generator(
        input clk,
        input reset,
        output reg [3:0] lfsr_out
    );
    
  /*----------------------------------feedback port------------------------------------*/
  wire feedback_wire;
  assign feedback_wire = (lfsr_out[3] ^ lfsr_out[2]);
  
  always @ (posedge clk or posedge reset)
  begin
       if (reset)
       begin
            lfsr_out <= 4'b0001;
       end
       else begin
            lfsr_out <= {lfsr_out[2:0] , feedback_wire}; // append the feedback wire via the shift operation(left shift)
       end
  end
  /*----------------------------------logic------------------------------------*/
endmodule
