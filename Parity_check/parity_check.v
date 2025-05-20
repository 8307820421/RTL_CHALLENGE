
/*
  Module Name : Parity Check
  Description : This module develop the parity algorithm based upon the even and odd parity. 
                This is error detection algorithm.
                
  // For even parity: error = (calculated != parity_bit)
  // For odd parity:  error = (calculated == parity_bit)
  
  Ports : The error reflect the result wheather the parity matched or not matched. if matched then no error. If not then error.
*/
/*------------------------------------------------------------------------------------------------------------------------------*/
`timescale 1ns / 1ps
module parity_check(
 input [7:0] data_in,
 input parity_bit,  // this is a single bit that is added with data bit 
 output error
    );
  wire calculated_parity_wire;
  assign calculated_parity_wire = ^(data_in);  // XOR ALL bits for even parity
  assign error = (calculated_parity_wire != parity_bit); // not equal condition 
endmodule

