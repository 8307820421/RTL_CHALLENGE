`timescale 1ns / 1ps
/*
   Module Name : Clk_wizard_ip
   Description : Here , we are gnerating the fractional clock divider via clk wizard ip of xilinx vivado.
   Ports   : Input clk = 100mhz, Desired output 50mhz
             Rst       = 0;
   Other   : The most important thing is  that as it is based upon the PLL (phase locked loop) property and feedback property
             of Voltage Control Oscillator . Hence , the output port or (CLKOUT) will work after a latency of aprrox 250ns.         
             Also, t = 1/f = 10ns(100MHZ)
             and    t= 1/f = 20ns(50MHZ)
                            (for CLKOUT) taking two input clk cycle during transition.
             
*/
/*---------------------------------------------------------------------------------------------------------------------------------------*/

module clk_wizard(
    input wire CLKIN,         // Input clock (e.g., 100 MHz)
    input wire RST,           // Active high reset signal
    output wire CLKOUT     // Divided clock output (e.g., 50 MHz)
   // output wire LOCKED        // PLL lock status
);

   // PLLE3_BASE: Base Phase-Locked Loop (PLL)
   // Kintex UltraScale
   // The configuration divides the input clock by 2.
   PLLE3_BASE #(
      .CLKFBOUT_MULT(2),         // Multiply by 2(M = 2)
      .DIVCLK_DIVIDE(1),         // Divide by 1 (D = 1)
      .CLKIN_PERIOD(10.0),       // Input clock period in ns (100 MHz = 10 ns)
      .CLKOUT0_DIVIDE(4),       // Divide by 4 (O = 4) // it is equal to 2*multiplication factor
      .CLKOUT0_DUTY_CYCLE(0.5),  // 50% duty cycle
      .CLKOUT0_PHASE(0.0),       // No phase shift for CLKOUT0
      .CLKOUT1_DIVIDE(1),        // Not used
      .CLKOUT1_DUTY_CYCLE(0.5),  // Not used
      .CLKOUT1_PHASE(0.0),       // Not used
      .CLKOUTPHY_MODE("VCO_2X"), // Use VCO clock mode
      .IS_CLKFBIN_INVERTED(1'b0),
      .IS_CLKIN_INVERTED(1'b0),
      .IS_PWRDWN_INVERTED(1'b0),
      .IS_RST_INVERTED(1'b0),
      .REF_JITTER(0.0),
      .STARTUP_WAIT("FALSE")     // Don't wait for PLL lock on startup
   )
   PLLE3_BASE_inst (
      // Clock Outputs
      .CLKOUT0(CLKOUT),          // Divided output clock (50 MHz)
    //  .LOCKED(LOCKED),           // PLL locked status
      // Feedback Clocks
      .CLKFBOUT(),               // Feedback clock (not used here)
      .CLKIN(CLKIN),             // Input clock
      // Control Ports
      .RST(RST),                 // Reset signal
      .PWRDWN(1'b0),             // Power down (always 0 here)
      .CLKFBIN(CLKFBOUT)         // Feedback input (connect to feedback output)
   );

endmodule
