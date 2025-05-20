
/*
Module Name : parity_check_2
Description : This module is developed to check or implement both even and odd parity error status.
Ports       : 1) Parity_bit : This is added with the data and then XOR calcuated .
              2) Parity Type : it can be parametric also if possible.
              3) error : indicated that parity match or not .
*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/
`timescale 1ns / 1ps
module parity_check_2(
 input [7:0] data_in,
 input parity_bit,  // this is a single bit that is added with data bit 
 input parity_type, // 0 for even parity type  // 1 for odd parity type
 output error
    );
 wire calculated_parity_wire;
 assign calculated_parity_wire = ^{data_in,parity_bit};  // XOR ALL bits for even parity with parity bit 
 assign error = (parity_type == 1'b0)?  // even parity //
                (calculated_parity_wire != 1'b0): // true condition // for even parity status
                (calculated_parity_wire != 1'b1); // false condition // odd parity status for error
endmodule
