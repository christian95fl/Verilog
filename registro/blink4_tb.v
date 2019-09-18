module blink4_tb ();
  reg clk = 0;
  wire [3:0] salida;

  blink4 #(.N(1))
    top(
      .clk(clk),
      .salida(salida)
      );

  always #1 clk = ~clk;

  initial begin
    $dumpfile("blink4_tb.vcd");
    $dumpvars(0,blink4_tb);
    #100 $display("Fin de la simulacion");
    $finish;
  end

endmodule //
