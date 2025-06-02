/*
Module Name : Add Shit Multiplier 
Description : This module is used to first shift the first input (a)  based upon the bit position of b indexing.
              The a is shifting based upon the bit index of b but where the bit position of b is 1'b1; Otherwise 
              keep the value same.
             And then add them each resultant output to get the multiplication result.
*/
//----------------------------------------------------------------------------------------------------------------------------------
`timescale 1ns / 1ps
module add_shift_multiplier(
    input [3:0] a,
    input [3:0] b,
    output reg [7:0] result // width depend upon a+b
    );
  reg [7:0] a_extended; // during shifting
  integer i = 0;
  always @(*)begin
       result = 0;
       a_extended = {4'h0,a}; // intial value that stored in temp reg.
       for (i = 0; i <4 ; i = i+1)
       begin
           if (b[i] == 1)
           begin
               result = result + (a_extended<<i);
           end
       end
  end
  
endmodule
