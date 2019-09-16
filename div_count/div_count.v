`include "divid.vh"
module div_count(clk,data);
  input clk;
  wire clk;
  output [7:0] data;
  wire [7:0] data;
  //reg [7:0] data = 0;
  parameter M = `F_1Hz;

  wire clk_1hz;
  reg [7:0] cont = 0;
  //Instanciar el divisor
  divid #(M)
    DIV (
      .clk_in (clk),
      .clk_out(clk_1hz)
      );

  always @ ( posedge clk_1hz ) begin
    cont <= cont + 1;
  end
  assign data = cont;

endmodule //
