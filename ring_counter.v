`timescale 1ns / 1ps
/*
   Module name : Ring Counter
   Description :- Here we are implementing the 4 bit ring counter and the output of lst flip flop of ring counter
                  is fed to to input of first flip flop.
                  Here , we need to initialize the ring counter output is 4'b0001 under reset at first clock cycle 
                  because of preset and clear.
*/
module ring_counter(
          input  clk,
          input  reset,
          output reg [3:0]ring_counter_output
    );
    
    always @ (posedge clk or posedge reset)
    begin
         if (reset)
         begin
         ring_counter_output <= 4'b0001;
         end
         else begin
              ring_counter_output <= {ring_counter_output[2:0] ,ring_counter_output[3]};
         end
    end
endmodule
