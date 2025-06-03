`timescale 1ns / 1ps
module tb_restoring_division();
 reg [3:0] dividend;   // 4-bit dividend
 reg [3:0] divisor;    // 4-bit divisor
 wire [3:0] quotient;  // 4-bit quotient
 wire [3:0] remainder;  // 4-bit remainder
 //-------------------------------------------------------------------------------------

// create instance
restoring_division dut_restoring_algo_ports(
.dividend(dividend),
.divisor(divisor),
.quotient(quotient),
.remainder(remainder)
); 
 
 // create testcase:
 
 initial begin
   dividend = 0;
   divisor =  0;
   #10;
   dividend = 4'b0101;
   divisor  = 4'b0010;
   #10;
   $finish;
 end
 
 // monitor
 initial begin
 $monitor ("the restoring divisor output : Time = %dns | dividend = %d | divisor = %d |  quotient = %d | remainder = %d", 
           $time, dividend, divisor, quotient, remainder);

 end
endmodule
