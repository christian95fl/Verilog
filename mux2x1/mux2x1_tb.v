module mux2x1_tb ();
  reg clk = 0;
  wire [7:0] data;

  mux2x1 #(.N0(1))
    test(
      .clk(clk),
      .data(data)
      );

  always #1 clk = ~clk;

  initial begin
    $dumpfile("mux2x1_tb.vcd");
    $dumpvars(0,mux2x1_tb);
    #200 $display("fin de la simulacion");
    $finish;
  end

endmodule //
