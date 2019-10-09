`include "baudgen.vh"

module baud(clk,load,tx);
  input wire clk;
  output wire tx;
  input wire load;
  wire clk_baud;
  reg [9:0] shifter = 0;

  parameter M = `B115200;

  div # (.M(M))
    BAUD (
      .clk_i(clk),
      .clk_o(clk_baud)
      );

  assign tx = (load == 0) ? 1:shifter[0]; // tx=1 si load=0 sino tx=shifter[0]

  always @ (posedge clk_baud)
    if (load == 0)
      shifter <= {"C",2'b01}; // Primero se envia el '1' luego el bit '0'(start)
                              // y a continuacion el codigo de "C" del lsb al msb
    else
      shifter <= {shifter[0],shifter[9:1]};


endmodule //
