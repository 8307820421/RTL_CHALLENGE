/*
   Module Name : Clock Divider
   Description : Here , the clock divider we are making is even clock divider .
                 Hence the duty cycle is 50%.
                 Also, clk divider is considering divide/4;
                 The input clk is 100Mhz.
  Latecny      :
                one clock cycle = 10ns ,(100Mhz)
                so divide/4     = 40ns (two clock cycle off and two clock cycle on).
   
   Parmeter Vaule : If you are buliding the logic to specific clock cycle then you need to take care of counter bits based on clock cycle
                    If you have N number of counter bits or bytes then you need to little bit modify your logic that I have done.
*/

`timescale 1ns / 1ps
module clock_divider #(
 parameter N = 3
)
(
  input even_clk,
  input even_reset,
  output even_clk_out
  
);

reg [N-1:0] count_reg ;
reg       clk_out_reg;
/*------------------------------------------------------------------------------*/
assign even_clk_out  = clk_out_reg;
/*------------------------------------------------------------------------------*/
always @ (posedge even_clk or posedge even_reset)
begin
     if (even_reset)
     begin
        count_reg <= 0;
        clk_out_reg <= 0;
     end
     else begin
      if (count_reg == 1) begin
          clk_out_reg  <= ~clk_out_reg;
          count_reg <= count_reg + 1;
      end
      else if (count_reg ==  3)begin
              clk_out_reg <= ~clk_out_reg ;
              count_reg <= 0;                      // if you doing this ,then it does not matter how much bits or byte is your counter
             // count_reg   <= count_reg + 1;n    // If you are doing this then you need to take care of your counter bits. with respect to clkcyle                                        
      end
      else begin
             count_reg    <= count_reg +1;
      end
     end
end
endmodule
