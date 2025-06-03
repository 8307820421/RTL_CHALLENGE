
/*
 Module Name : Restoring Divison
 Description : This module implemented to calculate the Q and R.
             // Here , Numerator is Dividend.
             // Denominator is Divisor.
 
 Algo Logic  : Initially let the R is 0 and Q is 0.
               Then shift R by Left Shift (LSB to MSB).
               At LSB append the DIV[MSB] .
               Then R updated with append bits.
               Then subtract Updated R - Divisor bits.
               Two case :
               1) result is negative then, Q= 0; R = same after shifting (no change).
               2) result is Positive then Q=1 ; R = subtracted Result.
               
 Note       : This process repeat until MSB to LSB of Dividend bit one by one
              by following 1),2) steps each time each time selected DIV[i]         
*/

//-----------------------------------------------------------------------------------
`timescale 1ns / 1ps
module restoring_division(
 input [3:0] dividend,   // 4-bit dividend
 input [3:0] divisor,    // 4-bit divisor
 output  [3:0] quotient,  // 4-bit quotient
 output  [3:0] remainder  // 4-bit remainder
    );
    
//-----------------------------------------------------------------------------------
reg [3:0] quotient_reg; // 4-bit quotient
reg  [3:0] remainder_reg;  // 4-bit remainder   
 assign quotient = quotient_reg;
 assign remainder = remainder_reg;
//-----------------------------------------------------------------------------------
integer i;
always @(*) begin
    remainder_reg = 0;  // Initialize remainder to 0
    quotient_reg  = 0;  // Initialize quotient to 0
    for ( i = 3 ; i >=0 ; i = i-1)
    begin
          // Shift the remainder left and bring down the next bit of the dividend
         remainder_reg = (remainder_reg<<1 |dividend[i]); // shift and append
         //---------------------------------------------------------------------
        // Check if the remainder is greater than or equal to the divisor
        if (remainder_reg >= divisor )
        begin
            remainder_reg = remainder_reg - divisor;  // Subtract the divisor
            quotient_reg[i] = 1;// Set the corresponding quotient bit to 1
        end
        else begin
            quotient_reg[i] = 0;// Set the corresponding quotient bit to 0
        end
        //---------------------------------------------------------------
    end
end




endmodule
