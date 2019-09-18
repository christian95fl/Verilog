module sr_tb();

  reg clk = 0;
  wire [7:0] data;

  sr #(.N(1))
    test(
      .clk(clk),
      .data(data)
      );

  always #1 clk = ~clk;

  initial begin
    $dumpfile("sr_tb.vcd");
    $dumpvars(0,sr_tb);
    #100 $display("Fin de la simulacion");
    $finish;
  end

endmodule
