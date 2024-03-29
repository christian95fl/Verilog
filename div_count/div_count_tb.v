module div_count_tb();

//-- Registro para generar la señal de reloj
reg clk = 0;
wire [3:0] data;

//-- Instanciar el componente y establecer el valor del divisor
//-- Se pone un valor bajo para simular (sino tardaria mucho)
div_count #(10)
  dut(
    .clk(clk),
    .data(data)
  );

//-- Generador de reloj. Periodo 2 unidades
always
  # 1 clk <= ~clk;

//-- Proceso al inicio
initial begin

  //-- Fichero donde almacenar los resultados
  $dumpfile("div_count_tb.vcd");
  $dumpvars(0, div_count_tb);

  # 100 $display("FIN de la simulacion");
  $finish;
end
endmodule
