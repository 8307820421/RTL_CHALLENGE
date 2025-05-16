/*
   Module Name : Odd clock Divider
   Description : This clock divider does not have duty cycle 50%.
                 Here , we use two clock pulse utilization to generate the required 
                 clock pulse.
  Clk_gnerating : divide/3;
                 
*/

`timescale 1ns / 1ps
module odd_clock_divider(
input  odd_clk,
input  odd_reset,
output odd_clk_out
    );
   

reg [1:0] count_reg;
reg odd_clk_out_reg;
/*------------------------------------------------------------------------------------*/
assign  odd_clk_out  = odd_clk_out_reg;
/*--------------------------------------------------------------------------------------*/
always @ (posedge odd_clk or posedge odd_reset)
begin
     if (odd_reset)
     begin
         odd_clk_out_reg <= 0;
         count_reg <=  0;
     end
     
     else begin
          if (count_reg == 0)
          begin
              odd_clk_out_reg <= ~odd_clk_out_reg;
              count_reg       <= count_reg + 1;
          end
          
          else if (count_reg == 2)
          begin
             odd_clk_out_reg  <= ~odd_clk_out_reg;
             count_reg         <= 0;
          end
          
          else begin
              count_reg       <= count_reg +1;
          end
     end
end

endmodule
