module count_tb();
  reg clk = 0;
  wire [1:0] data;

  count
    CONT(
      .clk(clk),
      .data(data)
      );

  always #1 clk = ~clk;

  initial begin
    $dumpfile("count_tb.vcd");
    $dumpvars(0, count_tb);
    #50 $display("Fin");
    $finish;
  end

endmodule //
