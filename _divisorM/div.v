module div(clk_i, clk_o);
  input wire clk_i;
  output wire clk_o;

  parameter M = 12_000_000;
  localparam N = $clog2(M);

  reg [N-1:0] cont = 0;

  always @ (posedge clk_i)
    if (cont == M-1)
      cont <= 0;
    else
      cont <= cont + 1;

  assign clk_o = cont[N-1];

endmodule //
