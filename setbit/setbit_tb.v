module setbit_tb;

wire A;

setbit SB1 (
 .A (A)
);

initial begin

    $dumpfile("setbit_tb.vcd");

    $dumpvars(0, setbit_tb);

    # 10 if (A != 1)
           $display("---->¡ERROR! Salida no esta a 1");
         else
           $display("Componente ok!");

  # 10 $finish;
end
endmodule
