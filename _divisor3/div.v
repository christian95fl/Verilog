module div(clk_i, clk_o);
  input wire clk_i;
  output wire clk_o;
  reg [1:0] cont = 0;

  always @ (posedge clk_i)
    if (cont == 2)
      cont <= 0;
    else
      cont <= cont + 1;

  assign clk_o = cont[1];

endmodule //
