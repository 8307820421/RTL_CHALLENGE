/*
  Module Name : file_tb
  Description : Adding the text file and creating the unique file descriptor id .
  Function used : $fopen and $fclose for opening and closing of file.
  
  
  Description for read : -- if we are storing the multiple columns of data then increase the depth size of memory array.
*/
//////////////////////STEP (!)/////////////////////////////////////////////////////////////////
//`timescale 1ns / 1ps
//module file_tb( );
//integer file = 0;
//initial begin
//file = $fopen("C:/Users/lenovo/OneDrive/Desktop/data.txt", "w");
//$fclose(file);
//end
//endmodule
//////////////////////////////////////////////////////////////////////opening and closing of file 

//////////////////////STEP(2)////////////////////////////////////////////////Adding data to file 
//`timescale 1ns / 1ps
//module file_tb( );
//integer file = 0;
//integer i = 0;
//initial begin

//file = $fopen("C:/Users/lenovo/OneDrive/Desktop/data.txt", "w");

//for ( i = 0 ; i <= 25 ; i = i+1)
//begin
//    //$fdisplay(file, "%x", i);  // file id, format specifier, source of data.(for writing once).
//    $fdisplay(file, "%x\t %x\t %x", i, 5*i, i*i);  // adding data via three arguments (columns).
//end

//$fclose(file);
//end
//endmodule///////////////////////////////////////////////end

//////////////////////STEP(3)////////////////////////////////////////////////Reading the data from file
`timescale 1ns / 1ps
 module file_tb();
 integer file = 0;
 integer i = 0;
 reg [4:0]mem[25:0]; //with width and address depth
 initial
  begin
     file = $fopen("C:/Users/lenovo/OneDrive/Desktop/data.txt", "w");
     for (i = 0 ; i <= 25; i = i+1)
     begin
       //  $fdisplay(file, "%x\t %x\t %x", i, 5*i, i*i); 
         $fdisplay(file, "%x", i); 
     end
     $fclose(file);
  
  /////////////////////////////////////////////Read type of operation
  file = $fopen("C:/Users/lenovo/OneDrive/Desktop/data.txt","r");
   $readmemh("C:/Users/lenovo/OneDrive/Desktop/data.txt",mem);
   $fclose(file);   /////////////////////////////////////////////////read type operation end
   
   /////////////$display
       for ( i = 0 ; i <=25 ; i = i+1)
       begin
           $display("%d", mem[i]); // printing the individual elelment of an array
       end  //// display on console
   
 end
 endmodule