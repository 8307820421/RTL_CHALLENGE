`timescale 1ns / 1ps
module adder_tb();
reg [7:0] a;
reg [7:0] b;
wire [8:0] y;

adder dut_adder_ports(
.a(a),
.b(b),
.y(y)
);

////////////////////////////////////////Writing operation

integer file ;
integer i = 0;
integer err = 0;
reg [7:0] res = 0;
reg [7:0]mem[74:0];

initial begin
file = $fopen("C:/Users/lenovo/OneDrive/Desktop/data.txt","w");
    for (i = 0 ; i <25 ; i = i+1)
    begin
         $fdisplay(file,"%x\t %x\t %x", i , i, 2*i);
    end
$fclose(file);

//////////////////////////////////////////////Reading data from mem locatyion of write data and giving
////////////////////////////////////////////// as input to ports .

file = $fopen("C:/Users/lenovo/OneDrive/Desktop/data.txt","r");
$readmemh ("C:/Users/lenovo/OneDrive/Desktop/data.txt",mem);
$fclose(file);

#10;

    for (  i = 0 ; i <=24 ; i = i+1)
    begin
        a = mem[3*i];  // indices where data stored based upon rowise indices data stored as coluumn
        b = mem[3*i+1]; // for multicolumn we need to write the logic to acees the indcies at specific
        res = mem[3*i +2]; // case and ports.
      
      #5;
      
          if (res != y)
          begin
              err = err+1;
          end
          
          ////////////////////////////////Comparing temp result to Y
          
          if (err == 0)
          begin
          $display("TEST PASSED");
          end
          else begin
          $display("TEST FAILED");
          end
    end
end

endmodule
