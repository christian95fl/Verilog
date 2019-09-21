module reg_i (clk, dato);
  input wire clk;
  output wire [7:0] dato;

  parameter INI = 8'b00001111;
  parameter N0 = 19;

  reg sel = 0;
  reg [7:0] dout;
  wire [7:0] din;
  wire clk_base;

  always @ (posedge clk_base)                  // Registro
    dout <= din;

  assign dato = dout;

  assign din = (sel == 0) ? INI : ~dout;   // MUX

  always @ (posedge clk_base)            // Inicializador
    sel <= 1;

  prescaler #(.N(N0))
    PRE(
      .clk_in(clk),                     // Prescaler
      .clk_out(clk_base)
      );

endmodule //
