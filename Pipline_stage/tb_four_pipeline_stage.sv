`timescale 1ns / 1ps

module tb_four_pipeline_stage();
  reg clk;
  reg reset;
  reg  [15:0] a;
  reg [15:0] b;
  wire [15:0] result_last_stage ;// final stage
  
  // instnatiate//
  
    four_pipeline_stage pipeline_stage_uut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .result_last_stage(result_last_stage)
    );
  
  // clk logic
  
 initial begin
   clk = 0;
   forever #5 clk = ~clk;
  end
   
   // test stimuli
initial 
begin
   reset = 1'b1 ; 
   a = 0; b = 0;
  #10 
  reset = 1'b0;
      for (int i = 0; i < 15 ; i= i+1)
      begin
          a = $urandom_range(1,5);
          b = $urandom_range(1,5);
  #10;
      end
   #100 $stop;   
 end

    initial begin
      $dumpfile("dump.vcd"); $dumpvars;
     end 

     initial begin
       $dumpfile("dump.vcd"); $dumpvars;
     end
     
endmodule
