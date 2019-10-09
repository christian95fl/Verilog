module echowire1_tb();
  reg dtr = 0;
  reg rts = 0;
  reg rx = 0;
  wire tx, led1, led2;

  echowire1
    dut(
      .dtr(dtr),
      .rts(rts),
      .D1(led1),
      .D2(led2),
      .rx(rx),
      .tx(tx)
      );

  always #1 dtr = ~dtr;
  always #2 rts = ~rts;
  always #3 rx = ~rx;

  initial begin
    $dumpfile("echowire1_tb.vcd");
    $dumpvars(0,echowire1_tb);
    #110 $display("FIN");
    $finish;
  end    
endmodule //
