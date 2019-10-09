module baud_tb();
  reg clk = 0;
  wire tx;
  reg load = 0;

  baud # (.M(5))
    dut(
      .clk(clk),
      .load(load),
      .tx(tx)
      );

  always #1 clk <= ~clk;

  initial begin
    $dumpfile("baud_tb.vcd");
    $dumpvars(0,baud_tb);
    #10 load <= 0;
    #15 load <=1;
    #400 $display("FIN");
    $finish;
  end

endmodule //
