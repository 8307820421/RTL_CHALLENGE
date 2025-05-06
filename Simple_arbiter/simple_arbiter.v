`timescale 1ns / 1ps
/*
   Module Name : Simple_arbiter
   Description : This module is 2bit simple arbiter where there are two requester
                 that request for services and they are granted based upon their
                 highest priority.
  Application  : -->
                1) Arbiters are logic blocks that decide which of several requesters gets access to a shared resource (like a bus or memory) 
                   at any given time.
                2) They are not limited to full-duplex or parallel communication, but are commonly used in such contexts where multiple masters
                   may need concurrent access.
                3) PCIe (Peripheral Component Interconnect Express) and CPU-to-high-speed interface communication (e.g., with memory controllers, DMA engines, or I/O peripherals) 
                   often involve arbitration because multiple agents may want access simultaneously.
*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
module simple_arbiter(
       input wire clk,
       input wire reset,
       input wire [1:0] requester,
       output reg [1:0] grant
    );
    
 /*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
always @(posedge clk or posedge reset)
begin
     if (reset)
     begin
         grant <= 2'b00;
     end
     else begin
         if (requester[0])
         begin
            grant <= 2'b10; // requester 0
         end
         else if (requester[1])
         begin
            grant <= 2'b01; // requester 1
         end
         else begin
            grant <= 2'b00; // no grant as no requester
         end
     end
end
endmodule
