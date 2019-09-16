module inv_tb();
reg din;
wire dout;

inv NOT1 (
 .A (din),
 .B (dout)
);

initial begin

  $dumpfile("inv_tb.vcd");
  $dumpvars(0, inv_tb);


  #5 din = 0;

  # 5 if (dout != 1)
        $display("---->¡ERROR! Esperado: 1. Leido: %d", dout);

  # 5 din = 1;
     
  # 5 if (dout != 0)
        $display("---> ¡ERROR! Esperado: 0. Leido: %d", dout);

  # 5 $display("FIN de la simulacion");
  # 10 $finish;
end
endmodule
