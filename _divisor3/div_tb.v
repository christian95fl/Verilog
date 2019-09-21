module div_tb();
  reg clk = 0;
  wire clk3;

  div
    DIV(
      .clk_i(clk),
      .clk_o(clk3)
      );

  always #1 clk = ~clk;

  initial begin
    $dumpfile("div_tb.vcd");
    $dumpvars(0,div_tb);
    #50 $display("Fin");
    $finish;
  end
endmodule //
