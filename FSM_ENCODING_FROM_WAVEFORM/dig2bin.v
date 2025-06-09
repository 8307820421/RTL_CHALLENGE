/*
   Module Name : dig2bin
   ///////////////////////
   Description : This module is 12 bit PMOD DA4 DAC Bit SPI Interface.
   //////////////////////////////////////////////////////////////////
   Used case   : This IC specification is given on the Analog Website. From their , you can get the
                 specifcation and waveform w.r.t SPI interface.
                 Through the waveform, you need to decode the FSM states and clk division factor .
                 After decoding develop the SPI interface for this and you can connect the PMOD to FPGA .
  ///////////////////////////////////////////////////////////////////////////////////////////////////////// 
*/
///////////////////////////////////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps
module dig2bin(
 input sys_clk,
 //input rst,
 input [11:0] dac_in,
 input newd,
 output cs,
 output MOSI,
 output sclk,
 output wr_done
);
//////////////////////////////////////////////////////
reg  cs_reg      ;
reg  mosi_reg    ;
reg  sclk_reg  = 0  ; // 1mhz 
reg  wr_done_reg ;
///////////////////////////////////////////////////////////
localparam IDLE          = 3'b00;
localparam INIT_DAC      = 3'b01;
localparam FUNC_DAC      = 3'b10;
localparam WR_DAC        = 3'b11;
reg [1:0] state = IDLE;
/////////////////////////////////////////////////////////////
reg [31:0] data_reg = 32'h0;
reg [31:0] set_up_dac = 32'h0800001; // harcoded
reg dac_init_reg   = 1'b0 ; // control flag for DAC init.
///////////////////////////////////////////////////////////
reg [5:0] count_reg = 0; // for data 
reg [5:0] clk_div_reg = 0; // for 1mhz clock 
///////////////////////////////////////////////////////////


always @ (posedge sys_clk)
begin
     if (clk_div_reg == 49)
     begin
        clk_div_reg <= 0;
        sclk_reg <= ~sclk_reg;
     end
     else begin
       clk_div_reg <= clk_div_reg + 1;
     end
end
//////////////////////////////////////////////////////////////////////////
assign sclk = sclk_reg;
assign cs   = cs_reg;
assign MOSI = mosi_reg;
assign wr_done = wr_done_reg;
/////////////////////////////////////////////////////////////////////////

always @ (posedge sys_clk or negedge newd)
begin
    if (newd == 1'b0)
    begin
         state         <= IDLE ;
         cs_reg        <= 1'b1; // idle 1'b1
         mosi_reg      <= 0;
         count_reg     <= 0;
         wr_done_reg   <= 0;
    end
    else begin
       case (state)
             IDLE : begin
                        cs_reg        <= 1'b1; // idle 1'b1
                        mosi_reg      <= 0;
                        count_reg     <= 0;
                        wr_done_reg   <= 0;
                        if (dac_init_reg == 1'b0)
                        begin
                           state      <= INIT_DAC;
                        end
                        else begin
                           state      <= FUNC_DAC;
                        end
             end  /////
             
             INIT_DAC: begin  /// bit by bit accessing  // 32 bit
                       if (count_reg < 32 )
                       begin
                           cs_reg        <= 1'b0; //  1'b0 // during transmission
                           mosi_reg      <= set_up_dac[31-count_reg]; // bit accessing // MSB to LSB
                           count_reg     <= count_reg + 1;
                       end
                       else begin
                           cs_reg        <= 1'b1; // transmission or bit accesing complete 1'b1
                           count_reg     <= 0;
                           dac_init_reg  <= 1'b1; // this set and taking the dac_in from global to local
                           state         <= FUNC_DAC;
                       end
               end//////////
               
              FUNC_DAC  : begin  // Here concatenating the 12 bit Dac in with some values hardcoded  into register
                    mosi_reg      <= 0;
                    wr_done_reg   <= 0;
                    data_reg      <= {4'h3,  dac_in , 8'h00};  
                    state         <= WR_DAC;  
              end////////////////////////////////////////////
             
             WR_DAC     : begin
                   if (count_reg < 32)
                   begin
                        mosi_reg  <= data_reg [31-count_reg]; // MSB to LSB
                        count_reg <= count_reg +1;
                   end 
                   else begin
                       cs_reg         <= 1'b1;
                       wr_done_reg    <= 1'b1;
                       count_reg      <= 0;
                       mosi_reg       <= 0;
                       state          <= IDLE;
                   end
             end
               ///////////////////////
       endcase
            ////////////////
    end
    /////////////////////
end
///////////////////////
endmodule
