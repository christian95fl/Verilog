`include "baudgen.vh"
module div (clk,clk_ena,clk_out);
  input wire clk;
  input wire clk_ena;
  output wire clk_out;
  parameter M = `B115200;
  localparam  N = $clog2(M);
  reg [N-1:0] cont = 0;

  always @ (posedge clk)
  if (clk_ena == 0)
    cont <= M-1;
  else
    cont <= (cont == M-1)? 0:cont+1;


  //assign clk_out <= cont[N-1]
  assign clk_out = (cont==0) ? clk_ena:0;

endmodule //
