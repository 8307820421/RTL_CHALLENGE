`timescale 1ns / 1ps
module tb_lut_multipler();
parameter A_WIDTH = 4;
parameter B_WIDTH = 4;
parameter OUTPUT_WIDTH = A_WIDTH + B_WIDTH;

reg [A_WIDTH-1:0] a;
reg [B_WIDTH-1:0] b;
wire [OUTPUT_WIDTH -1:0] result; // width depend upon a+b

//-------------------------------dut creation------------------------------------------
lut_mulitiplier  #(
.A_WIDTH(A_WIDTH),
.B_WIDTH(B_WIDTH),
.OUTPUT_WIDTH(OUTPUT_WIDTH)
) dut_ports(
.a(a),
.b(b),
.result(result)
);
//--------------------------------------------------------------------------------------

initial begin

     for ( int i = 0 ; i <4 ; i = i+1)
     begin
         a    = $urandom_range(0,4); 
         b    = $urandom_range(0,4); 
         #10;
       end
   #10;
   $finish;
 end
 //------------------------------------------------------------------------------------------------------------------
//end

initial begin
$monitor ("The output  product : Time = %dns | a = %d | b = %d | result = %d " , $time, a,b,result);
end
//------------------------------------------------------------------------------------------------------------------
endmodule
