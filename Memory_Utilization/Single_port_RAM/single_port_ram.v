
/* 
  Module Name : single port RAM (from BLOCK RAAM in language template).
  Description : The memory implementation is avilable in language template incase of types and diffrent types of BRAM and distributed
                memeory.
                     ///////////////////////////////////////////////////////   ///////////////////////////////////////////////////////
  Task       : Here , my main task to invoke the utilization resources based upon the language template.
             : By optimize your own HDL or language template based code you can maintain the resources utlization
               report in term of estimation, utlization etc.
               ///////////////////////////////////////////////////////
  Here we do not initiallize any memory file , hence remove the $readmemh and  intialize with index.
*/
    ///////////////////////////////////////////////////////
`timescale 1ns / 1ps
module single_port_ram #(
    parameter RAM_WIDTH = 8,                       // RAM data width
    parameter RAM_DEPTH = 256,                     // RAM depth
    parameter RAM_PERFORMANCE = "HIGH_PERFORMANCE",// "LOW_LATENCY" or "HIGH_PERFORMANCE"
    parameter INIT_FILE = ""                       // Optional initialization file
)(
    input  wire [clogb2(RAM_DEPTH-1)-1:0] addra,   // Address bus
    input  wire [RAM_WIDTH-1:0] dina,              // Input data
    input  wire clka,                              // Clock
    input  wire wea,                               // Write enable
   // input  wire ena,                               // RAM enable
    input  wire rsta,                              // Reset
 //   input  wire regcea,                            // Output register enable
    output wire [RAM_WIDTH-1:0] douta              // Output data
);
    //////////////////////////////////////////////////////////////
  // Declare RAM
  reg [RAM_WIDTH-1:0] ram [RAM_DEPTH-1:0];
  reg [RAM_WIDTH-1:0] ram_data = {RAM_WIDTH{1'b0}};
  reg ena ,regcea;
    // Adjust ena and regcea based on wea
    always @(*) begin
        ena = 1'b1;  // RAM is always enabled
        regcea = ~wea;  // Output register enable only during read operations
    end
    ///////////////////////////////////////////////////////
  // Optional memory initialization
  generate 
      integer ram_index;
      initial begin
        for (ram_index = 0; ram_index < RAM_DEPTH; ram_index = ram_index + 1)
            ram[ram_index] = {RAM_WIDTH{1'b0}};
    end
  endgenerate
    ///////////////////////////////////////////////////////
  // RAM read/write behavior
  always @(posedge clka) begin
    if (ena) begin
      if (wea) begin
        ram[addra] <= dina;
        ram_data <= dina;
      end else begin
        ram_data <= ram[addra];
      end
    end
  end
    ///////////////////////////////////////////////////////
  // Output stage: choose latency/performance
  generate
    if (RAM_PERFORMANCE == "LOW_LATENCY") begin: no_output_register
      assign douta = ram_data;
    end else begin: output_register
      reg [RAM_WIDTH-1:0] douta_reg = {RAM_WIDTH{1'b0}};//
      always @(posedge clka) begin
        if (rsta)
          douta_reg <= {RAM_WIDTH{1'b0}};
        else if (regcea)  // it enable based upon complimment of wea.
          douta_reg <= ram_data;
      end
      assign douta = douta_reg;
    end
  endgenerate
    ///////////////////////////////////////////////////////
  // Address width calculation function
  function integer clogb2;
    input integer depth;
    integer i;
    begin
      clogb2 = 0;
      for (i = depth - 1; i > 0; i = i >> 1)//right shift
        clogb2 = clogb2 + 1;
    end
  endfunction
    ///////////////////////////////////////////////////////
endmodule



