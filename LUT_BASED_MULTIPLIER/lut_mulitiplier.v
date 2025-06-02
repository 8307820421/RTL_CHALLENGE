
/*
  Module Name : lut_multiplier
  Description : This module is created to know about the working of LUT multiplier 
              // Here , it is purely combitorial LUT based .
              // USED LUT WHen , required low latency but it is limited to small width and in blocks like 4*4;
*/
//------------------------------------------------------------------------------------------------------------------
`timescale 1ns / 1ps
module lut_mulitiplier #(
    parameter A_WIDTH = 4,
    parameter B_WIDTH = 4,
    parameter OUTPUT_WIDTH = A_WIDTH + B_WIDTH
)(
   input [A_WIDTH-1 :0] a,
   input [B_WIDTH-1 :0] b,
   output [OUTPUT_WIDTH - 1:0] result
);
//------------------------------------------------------------------------------------------------------------------
reg [OUTPUT_WIDTH - 1:0] result_reg ;
//------------------------------------------------------------------------------------------------------------------
localparam LUT_MEM = 1<<(OUTPUT_WIDTH); // 2^8
//------------------------------------------------------------------------------------------------------------------
wire [OUTPUT_WIDTH-1:0] lut[0:LUT_MEM];
//------------------------------------------------------------------------------------------------------------------

genvar i , j;
generate
     for ( i = 0 ; i <(1<<A_WIDTH); i = i+1)begin:A_LOOP
         for ( j = 0 ; j <(1<<B_WIDTH); j = j+1)begin:B_LOOP
            assign  lut[{i[ A_WIDTH-1:0],j[ B_WIDTH-1:0]}] = i*j;
         end
     end
endgenerate
//------------------------------------------------------------------------------------------------------------------
always @(*)begin
result_reg = lut[{a,b}];
end
//------------------------------------------------------------------------------------------------------------------
assign result = result_reg;
endmodule
//------------------------------------------------------------------------------------------------------------------