// Solo Simulacion
module count(data,clk);
  output reg [1:0] data = 0;
  input clk;

  always @ (posedge clk)
    if (data == 2)
      data <= 0;
    else
      data <= data + 1;

endmodule //
