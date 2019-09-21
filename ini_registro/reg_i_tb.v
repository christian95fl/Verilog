module reg_i_tb ();
  reg clk = 0;
  wire [7:0] data;

  reg_i #(.N0(1))
    test(
      .clk(clk),
      .dato(data)
      );

  always #1 clk = ~clk;

  initial begin
   $dumpfile("reg_i_tb.vcd");
   $dumpvars(0,reg_i_tb);
   #30 $display("Fin de la sim.");
   $finish;
  end

endmodule //
