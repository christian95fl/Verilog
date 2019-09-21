module regis_tb();
  reg clk =0;
  wire [7:0] data;

  regis # (.N0(1))
    testR(
      .clk(clk),
      .data(data)
      );

  always #1 clk = ~clk;

  initial begin
    $dumpfile("regis_tb.vcd");
    $dumpvars(0,regis_tb);
    #50 $display("Fin");
    $finish;
  end

endmodule //
