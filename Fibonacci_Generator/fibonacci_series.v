/*
   Module NBame ---> Fibnoacci Series
   Description ----> In this module the output of next bit index is the sum of present value at (present index)
                     and past value (at partcular index).
                     Here, we need to hold the two index values in intermediate
                     register . f[0] and f[1].
                     Because the f[2] is the sum of f[0] + f[1].
                     similarly   f[3] is f[1] + f[2]. and so on
*/
`timescale 1ns / 1ps
module fibonacci_series(
 input clk,
 input reset,
 input  start ,  // enable condition
 input [3:0] index_n , // index values
 output [31:0] fib_result, // final fibnocci result
 output done              // acknowledge
 );
 reg [31:0] fib_zeroth_index_reg ;
 reg [31:0] fib_first_index_reg  ;
 reg [3:0] count ; // <n-1
 
 reg done_ack_reg ; 
 reg [31:0] fib_output_reg;
 
 //// continous assignment ///
 assign fib_result = fib_output_reg;
 assign done       = done_ack_reg;
 ///////////////////////////////
 /// logic //
 always @ (posedge clk)  // synchronous reset
 begin
     if (reset)     // during reset
     begin
          fib_zeroth_index_reg    <= 32'd0 ; // n == 0
           fib_first_index_reg    <= 32'd1;  // n == 1
           fib_output_reg         <= 32'd0;
           count                  <= 0;
           done_ack_reg           <= 1'b0;
     end
     else if (!start)
     begin
         done_ack_reg             <= 1'b0;
     end
     else if (start && !done_ack_reg)
     begin
          if (index_n == 0)
          begin
             fib_output_reg <= 32'd0;
             done_ack_reg   <= 1'b1;
          end
          else if (index_n == 1)
          begin
             fib_output_reg <= 32'd1;
             done_ack_reg   <= 1'b1;
          end
          else if (count < index_n - 1)
          begin
               fib_output_reg <= fib_zeroth_index_reg +fib_first_index_reg;
                fib_zeroth_index_reg    <= fib_first_index_reg;
                fib_first_index_reg  <=   fib_zeroth_index_reg+ fib_first_index_reg ;
                count                   <= count + 1;
          end
          
          else begin
              done_ack_reg   <= 1'b1;
          end
     end
 end
endmodule
