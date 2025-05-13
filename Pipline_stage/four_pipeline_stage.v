/*
  Module Name : Four Pipeline Stage
  Description : This four pipeline stage perform the sets of operation based
                upon inputs and the result of previous stage act as input for 
                next stage.
                
                Also, the last stage output is the  result of (last_stage -1)
                result.
                
                Here , stage1_reg = a+b;
                       stage2_reg = stage1_reg *2
                       stage3_reg = stage2_reg -1;
                       result     = stage3_reg;
*/
/*-------------------------------------------------------------------------*/
`timescale 1ns / 1ps
module four_pipeline_stage(
   input clk,
   input reset,
   input [15:0] a,
   input [15:0] b,
   output reg [15:0] result_last_stage // final stage
);

//  stages ///
 
reg [15:0] stage1_reg;
reg [15:0] stage2_reg;
reg [15:0] stage3_reg;

//// Logic//////
always @ (posedge clk) // synchronous reset
begin
    if (reset)
    begin
        stage1_reg <= 16'b0;
        stage2_reg <= 16'b0;
        stage3_reg <= 16'b0;
    end
   else begin
       stage1_reg  <= a+b;   // stage 1
       stage2_reg  <= stage1_reg *2; // stage 2
       stage3_reg  <= stage2_reg -1; // stage 3

      result_last_stage <= stage3_reg;    // last stage 
   end
end

endmodule
