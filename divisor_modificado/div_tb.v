`include "baudgen.vh"
module div_tb();
  reg clk = 0;
  reg clk_ena = 0;
  wire clk_out;
  parameter M0 = `B115200;
  div #(.N($clog2(M0)),.M(M0))
    dut(
      .clk(clk),
      .clk_ena(clk_ena),
      .clk_out(clk_out)
      );


always #1 clk <= ~clk;
initial begin
  $dumpfile("div_tb.vcd");
  $dumpvars(0,div_tb);
  #10 clk_ena <= 1;
  #200 clk_ena <= 0;
  #400$display("FIN");
  $finish;
end
endmodule
