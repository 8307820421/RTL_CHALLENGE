`timescale 1ns / 1ps
/*
  Module Name : Shift_register_operation
  Description : Here, we are implementing the shift register based upon Left shift 
               and right shift operation via the concatenation operation.
*/

module shift_register_operation(
     input [7:0] data_in,
     output [7:0] shifted_left,
     output [7:0] shifted_right
    );
    
    assign  shifted_left  = {data_in[6:0] , 1'b0};
    assign  shifted_right = {1'b0, data_in[7:1]};
endmodule
