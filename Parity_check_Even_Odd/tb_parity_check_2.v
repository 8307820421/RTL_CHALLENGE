`timescale 1ns / 1ps
module tb_parity_check_2();


reg [7:0] data_in;
reg parity_bit;
reg parity_type;   // 0 = even, 1 = odd
wire error;

parity_check_2 dut_parity_check_2_ports (
  .data_in(data_in),
  .parity_bit(parity_bit),
  .parity_type(parity_type),
  .error(error)
);

initial begin
  $dumpfile("parity_check_2.vcd");
  $dumpvars(0, tb_parity_check_2);

  // Test Even Parity
  parity_type = 0;
  data_in = 8'b10000000; parity_bit = 1; #10; // odd #1s, needs parity_bit = 1 for even parity
  data_in = 8'b00001001; parity_bit = 0; #10; // even #1s, parity_bit = 0
  data_in = 8'b00011000; parity_bit = 1; #10; // odd #1s, parity_bit = 1

  // Test Odd Parity
  parity_type = 1;
  data_in = 8'b10000000; parity_bit = 0; #10; // odd #1s, parity_bit = 0 for odd parity
  data_in = 8'b00001001; parity_bit = 1; #10; // even #1s, parity_bit = 1
  data_in = 8'b00011000; parity_bit = 0; #10; // odd #1s, parity_bit = 0

  #100;
  $finish;
end

initial begin
  $monitor("Time = %0dns | data_in = %b | parity_bit = %b | parity_type = %b | error = %b",
            $time, data_in, parity_bit, parity_type, error);
end

endmodule


