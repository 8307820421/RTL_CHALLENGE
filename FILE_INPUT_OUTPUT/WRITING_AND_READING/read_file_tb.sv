/*
 Module Name : read_file_tb
 Description : Here we are reading the multiple columns  after writing .
               If taking the multi array or mem decleration to store individual column data
               the logic for location need to take care.
*/
///////////////////////////////////////////////////////////////STEP(4)/////Reading TWO CCOLUMN ///

//`timescale 1ns / 1ps
// module read_file_tb();
// integer file = 0;
// integer i = 0;
// reg [6:0]mem[51:0]; //with width and address depth
// initial
//  begin
//     file = $fopen("C:/Users/lenovo/OneDrive/Desktop/data.txt", "w");
//     for (i = 0 ; i <= 25; i = i+1)
//     begin
//       $fdisplay(file, "%x\t  %x", i, 5*i); 
//        // $fdisplay(file, "%x", i); 
//     end
//     $fclose(file);
  
//  /////////////////////////////////////////////Read type of operation

//  file = $fopen("C:/Users/lenovo/OneDrive/Desktop/data.txt","r");
//   $readmemh("C:/Users/lenovo/OneDrive/Desktop/data.txt",mem);
//   $fclose(file);   /////////////////////////////////////////////////read type operation end
   
//   /////////////$display

//       for ( i = 0 ; i <=25 ; i = i+1)
//       begin
//           $display("%d", mem[i]); // printing the individual elelment of an array
//       end  //// display on console
   
// end
// endmodule
///////////////////////////////////////////////////////////////////////////////////////// end


///////////////////////////////////////////////////////Create Multi array
`timescale 1ns / 1ps
 module read_file_tb();
 integer file = 0;
 integer i = 0;
 reg [6:0]mem[51:0]; //with width and address depth
 reg [6:0] arr1[25:0];
 reg [6:0] arr2[25:0];
 initial
  begin
     file = $fopen("C:/Users/lenovo/OneDrive/Desktop/data.txt", "w");
     for (i = 0 ; i <= 25; i = i+1)
     begin
       $fdisplay(file, "%x\t  %x", i, 5*i); 
        // $fdisplay(file, "%x", i); 
     end
     $fclose(file);
  
  /////////////////////////////////////////////Read type of operation
   
  file = $fopen("C:/Users/lenovo/OneDrive/Desktop/data.txt","r");
   $readmemh("C:/Users/lenovo/OneDrive/Desktop/data.txt",mem);
   $fclose(file);   /////////////////////////////////////////////////read type operation end
   
   //////////// logic for Multi array based memeory///////////////////////////////////////////
   
       for ( i = 0 ; i <=25 ; i = i+1)
       begin              // 0,1,2,3
           //$display("%d", mem[i]); // printing the individual elelment of an array
           arr1[i]  = 2*i ; // 0,2 ,4,6,8 ------location 
           arr2[i]  = 2*i + 1;// 1,3,5,7-------mem location
       end  //// display on console
   
       for ( i = 0 ; i <=25 ; i = i+1)
       begin              // 0,1,2,3
           $display("%d\t %d", arr1[i],arr2[i]); // printing the individual elelment of an array

       end  //// display on console
   ////////////////////////////////////////////////////////////
 end///////////////////////////////////////////////////////////////////end here
 endmodule
