// Diseno de TX continua.
`include "baudgen.vh"
module tx(clk,load,tx);
  input wire clk;
  input wire load;
  output reg tx;
  wire clk_baud;
  reg load_r = 0;
  reg [9:0] shifter;
  parameter M = `B115200;

//Instanciar divisor para generar clk_baud
  div #(.M(M))
    dut(
      .clk(clk),
      .clk_ena(load),
      .clk_out(clk_baud)
      );

//Registrar load
  always @(posedge clk)
    load_r <= load;

//Registro de desplazamiento.Como es tx continua voy desplazando el bit
//menos significativo al mas significativo
  always @(posedge clk)
    if (load_r == 0)
      shifter <= {"C",2'b01};
    else if (clk_baud)
      shifter <= {shifter[0],shifter[9:1]};

//Transmitir. Como tx es de tipo reg ya cumple la condicion de que las salidas
//tienen que estar registradas.
  always @(posedge clk)
    if (load_r == 1)
      tx <= shifter[0];
    else
      tx <= 1'b1;

endmodule //
