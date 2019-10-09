module tx_sic_tb();
  reg clk = 0;
  wire tx;

  tx_sic # (.M(104),.M0(4000))
    dut(
      .clk(clk),
      .tx(tx)
      );

  always #1 clk <= ~clk;

  initial begin
    $dumpfile("tx_sic_tb.vcd");
    $dumpvars(0,tx_sic_tb);
    #40000$display("FIN");
    $finish;
  end

endmodule //
