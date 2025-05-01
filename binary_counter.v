`timescale 1ns / 1ps
/*
   Module Name : Binary Counter
   Description : The binary counter here we are implementing the 4bit.
*/
module binary_counter(
       input clk,
       input reset,
       output reg [3:0] binary_counter_output
    );
    
 always @ (posedge clk or  posedge reset)
 begin
     if (reset)
     begin
         binary_counter_output <= 0;
     end
     else begin
        binary_counter_output <= binary_counter_output+1;
     end
 end
endmodule
