`timescale 1ns / 1ps
/*
   Module Name : Fractional_clk_divider
   Description : This is based upon the precesion or floating point based clk_divider generation.
                 But this way is not work ideally for FPGA.
                 Hence clock wizard ip based upon PLL and MMCM based used that provide better peroformance.
                 Here , we utilize two clock pulse to gnerate the fractioanl clock divider.
   Gneration   : Divide by 2.5
   Ports       : input clk 100mhz 
                 one clock cycle 10ns.
*/

module fractional_clk_divider(
    input  clk,
    input reset ,
    output  reg clk_out
    
    );
 reg [1:0] counter ;
 reg  toggle_state = 0;   // Toggle state: 0 for 2 cycles, 1 for 3 cycles
     always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;
            toggle_state <= 0; // Start with 2-cycle toggle
        end else begin
          if(counter == 0)
            begin
              clk_out <= ~clk_out;
              counter <= counter + 1;
            end
          else if (counter == 2)
            begin
              clk_out <= ~clk_out;
              counter <= counter + 1; 
            end
          else if (counter == 3)
            begin
              clk_out <= ~clk_out;
             counter <= counter + 1;
            end
          else if (counter == 4)
            begin
              clk_out <= ~clk_out;
              counter <= 0; 
            end
          else
              begin
                counter <= counter + 1;  // Increment counter
            end
        end
    end
endmodule
 

