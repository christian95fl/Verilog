module cont1s_tb();
  wire [3:0] data;
  reg clk = 0;

  cont1s #(5)
    CONT(
      .clk(clk),
      .data(data)
      );

  always #1 clk = ~clk;

  initial begin
    $dumpfile("cont1s_tb.vcd");
    $dumpvars(0,cont1s_tb);
    #300 $display("FIN");
    $finish;
  end

endmodule //
