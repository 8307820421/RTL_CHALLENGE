`timescale 1ns / 1ps

module tb_single_port_ram;

  // Parameters
  localparam RAM_WIDTH = 8;
  localparam RAM_DEPTH = 256;
  localparam ADDR_WIDTH = $clog2(RAM_DEPTH);

  // Testbench signals
  reg  [ADDR_WIDTH-1:0] addra;
  reg  [RAM_WIDTH-1:0] dina;
  reg  clka;
  reg  wea;
  reg  rsta;
  wire [RAM_WIDTH-1:0] douta;

  // Instantiate the RAM module
  single_port_ram #(
    .RAM_WIDTH(RAM_WIDTH),
    .RAM_DEPTH(RAM_DEPTH),
    .RAM_PERFORMANCE("HIGH_PERFORMANCE"),
    .INIT_FILE("")
  ) uut (
    .addra(addra),
    .dina(dina),
    .clka(clka),
    .wea(wea),
    .rsta(rsta),
    .douta(douta)
  );

  // Clock generation: 10ns period
  initial clka = 0;
  always #5 clka = ~clka;

  // Stimulus
  initial begin
    $display("Starting simulation...");
    $monitor("Time=%0t | wea=%b | addr=%h | din=%h | douta=%h", 
              $time, wea, addra, dina, douta);

    // Initialize inputs
    addra = 0;
    dina  = 0;
    wea   = 0;
    rsta  = 1;

    // Hold reset
    #10;
    rsta = 0;

    // Write data to RAM
    @(posedge clka);
    addra = 8'h10;
    dina  = 8'hAA;
    wea   = 1;

    @(posedge clka);
    wea   = 0;         // Read operation on next cycle

    @(posedge clka);
    addra = 8'h10;     // Same address to read back
    dina  = 8'h00;     // Don't care in read

    // Wait and observe output
    repeat(3) @(posedge clka);

    // Write another value
    @(posedge clka);
    addra = 8'h20;
    dina  = 8'h55;
    wea   = 1;

    @(posedge clka);
    wea   = 0;
    addra = 8'h20;

    repeat(3) @(posedge clka);

    // Finish
    $display("Simulation done.");
    $finish;
  end

endmodule
