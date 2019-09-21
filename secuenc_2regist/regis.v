module regis (clk, data);
  input wire clk;
  output wire [7:0] data;
  wire clk_base;
  reg rst = 0;
  wire [7:0] dout0;
  wire [7:0] dout1;

  parameter N0 = 23;

  prescaler #(.N(N0))
    pre(
      .clk_in(clk),
      .clk_out(clk_base)
      );

  parameter n = 8;
  parameter INI0 = 8'b01010101;
  parameter INI1 = 8'b10101010;

  always @(posedge clk_base)
    rst <= 1;

  register #(.cant_bit(n), .INI(INI0))
    REG0(
      .rst(rst),
      .clk(clk_base),
      .dout(dout0),
      .din(dout1)
      );

  register #(.cant_bit(n), .INI(INI1))
    REG1(
      .clk(clk_base),
      .din(dout0),
      .rst(rst),
      .dout(dout1)
      );

  assign data = dout1;

endmodule //
