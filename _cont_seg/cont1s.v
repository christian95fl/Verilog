`include "divider.vh"

module cont1s(data,clk);
  output wire [3:0] data;
  input wire clk;
  wire clk_1s;
  reg [3:0] dout = 0;

  parameter M = `F_1Hz;
  //parameter M = 12000000;

  div #(M)
    DIV(
      .clk_i(clk),
      .clk_o(clk_1s)
      );

  always @ (posedge clk_1s)
    if (dout == 16)
      dout <= 0;
    else
      dout <= dout + 1;

  assign data = dout;

endmodule //
