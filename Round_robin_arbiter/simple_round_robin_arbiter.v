`timescale 1ns / 1ps
/*
   Module Name : simple_round_robin_arbiter
   Description  : This arbiter follow the cyclic sequence hence the last grant based 
                  upon the last requester is needed.
   Application : The application is same as Simple arbiter.
   Grant depend upon highest priority :-1 2,1,0
                                          
*/
/*-----------------------------------------------------------------------------------------*/
module simple_round_robin_arbiter(
      input clk,
      input reset,
      input [1:0] requester_round_robin,
      output reg [1:0] grant
    );
   reg last_grant_reg ;// Tracks the last granted requester (0 or 1)

   
always @(posedge clk or posedge reset)
begin
      if (reset)
      begin
             grant <= 2'b00;
             last_grant_reg <= 1'b0;
      end
      
      else begin
          case (last_grant_reg )
              1'b0:begin
                  if (requester_round_robin[1])begin
                      grant <= 2'b10;
                      last_grant_reg <= 1;
                  end
                  else if (requester_round_robin[0])
                  begin
                       grant<= 2'b01;
                       last_grant_reg <= 1'b0;
                  end
                  else begin
                      grant <= 2'b00;
                  end
               end
             
             1'b1 : begin
                  if (requester_round_robin[0])begin
                      grant <= 2'b01;
                      last_grant_reg <= 0;
                  end
                  else if (requester_round_robin[1])
                  begin
                       grant<= 2'b10;
                       last_grant_reg <= 1'b1;
                  end
                  else begin
                      grant <= 2'b00;
                  end
               end
        endcase 
     end
  
 end
   
endmodule
