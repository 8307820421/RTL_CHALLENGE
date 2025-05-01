`timescale 1ns / 1ps

/*
   Module Name : tb_shift_register_example
   Description : This module is testbench that develop thee testcases for both operator and concatenate based  shift register.
*/

module tb_shift_register_example();
  reg  [7:0] data_in;
  reg  [2:0] shift_amt;// shift amount for the shift operator example
  wire [7:0] shifted_out_left;
  wire [7:0] shifted_out_right;
  wire [7:0] shifted_left;
  wire [7:0] shifted_right;
  
  /*--------------------Instantiate the shift register operator-----------------------------*/
  shift_register_operator dut_shift_register_operator(
   .data_in(data_in),
   .shift_amt(shift_amt),
   .shifted_out_left(shifted_out_left),
   .shifted_out_right(shifted_out_right)
  );
   /*--------------------Instantiate the shift register operation-----------------------------*/
   shift_register_operation dut_shift_register_operation(
   .data_in(data_in),
   .shifted_left(shifted_left),
   .shifted_right(shifted_right)
   );
   /*-------------------------------------Testcases--------------------------------------------*/
   initial begin
        // Test case 1: Input data = 8'b10101010, shift_amt = 3 (only for shifted_outl and shifted_outr)
     data_in = 8'b10101010;
     shift_amt = 3;
     #10;
     $display("testcases1 : shift 3");
     $display(" shift_register_operator : data_in = %b --> shifted_out_left = %b , shifted_out_right = %b ",
               data_in , shifted_out_left,shifted_out_right); 
     $display(" shift_register_operation : data_in = %b --> shifted_left = %b , shifted_right = %b ",
              data_in , shifted_left,shifted_right);     
              
     // Testcase 2:
     data_in = 8'b11001100;
     shift_amt = 1;
     #10;   
     $display("testcases2 : shift 1");
     $display(" shift_register_operator : data_in = %b --> shifted_out_left = %b , shifted_out_right = %b ",
               data_in , shifted_out_left,shifted_out_right); 
     $display(" shift_register_operation : data_in = %b --> shifted_left = %b , shifted_right = %b ",
              data_in , shifted_left,shifted_right);  
              
     // Testcase 3 
     data_in = 8'b11110000;
     shift_amt = 0;
     #10   ;
     $display("testcases3 : shift 0");
     $display(" shift_register_operator : data_in = %b --> shifted_out_left = %b , shifted_out_right = %b ",
               data_in , shifted_out_left,shifted_out_right); 
     $display(" shift_register_operation : data_in = %b --> shifted_left = %b , shifted_right = %b ",
              data_in , shifted_left,shifted_right); 
              
    $finish;
     
     
   end
endmodule
