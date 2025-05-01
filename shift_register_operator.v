`timescale 1ns / 1ps
/*
  Module Name : Shift_register_operator
  Description : Here, we are implementing the shift register based upon Left shift 
               and right shift operator without the concatenation operation.
  Demerits    : It utilize the more FPGA resources hence we need to avoid this.
*/
module shift_register_operator(
     input [7:0] data_in,
     input  [2:0] shift_amt , // shift amount for the shift operator example
     output [7:0] shifted_out_left,
     output [7:0] shifted_out_right
     );
    assign  shifted_out_left  = data_in<<1 ;// left shift LSB to MSB index
    assign  shifted_out_right = data_in>>1; // MSB to LSB index

endmodule
