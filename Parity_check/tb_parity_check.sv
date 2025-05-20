`timescale 1ns / 1ps
module tb_parity_check();
reg [7:0]data_in;
reg parity_bit;
wire error;
/*---------------------------------------------------------------------------------------------*/
/*
   instantiate the dut
*/
/*---------------------------------------------------------------------------------------------*/
parity_check dut_parity_check_ports(
.data_in(data_in),
.parity_bit(parity_bit),
.error(error)
);

/*---------------------------------------------------------------------------------------------*/
initial begin
 $dumpfile("parity_check.vcd");
        $dumpvars(0, tb_parity_check);
        
 data_in = 8'b10000000;
 parity_bit = 1'b1;
 #10;
 data_in = 8'b00001001;
 parity_bit = 1'b0;
 #10;
 data_in = 8'b00011000;
 parity_bit = 1'b1;
 #10;
 
 #100;
 $finish;


end

/*---------------------------------------------------------------------------------------------*/
initial begin
$monitor ("The parity status , Time = %dns | data_in = %b | parity_bit = %b | error = %b ",$time,
           data_in , parity_bit, error);
end
/*---------------------------------------------------------------------------------------------*/
endmodule
