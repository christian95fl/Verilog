`default_nettype none
`include "baudgen.vh"
`include "divider.vh"

module tx_sic(clk,tx);
  input wire clk;
  output wire tx;

  wire clk_baud;
  reg [9:0] shifter;
  wire load;
  reg load2;

  parameter M = `B115200;
  parameter M0 = `T_250ms;

  div # (.M(M))
    BAUD (
      .clk_i(clk),
      .clk_o(clk_baud)
      );

  div # (.M(M0))
    DIV(
      .clk_i(clk),
      .clk_o(load)
      );

  always @ (posedge clk_baud)
    if (load2 == 0)
      shifter <= {"C",2'b01}; // Primero se envia el '1' luego el bit '0'(start)
                              // y a continuacion el codigo de "C" del lsb al msb
    else
      shifter <= {1'b1,shifter[9:1]}; // Se pone delante de la cadena un 1 para que sea solo una tx cada load2

  assign tx = (load2 == 0) ? 1:shifter[0]; // tx=1 si load=0 sino tx=shifter[0]

  always @ (posedge clk_baud)
      load2 <= load;


endmodule //
