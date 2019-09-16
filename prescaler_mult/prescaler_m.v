module prescaler_m (clk_in,D0,D1,D2,D3,D4,D5,D6,D7);
  input clk_in;
  wire clk_in;
  output D0;
  wire D0;
  output D1;
  wire D1;
  output D2;
  wire D2;
  output D3;
  wire D3;
  output D4;
  wire D4;
  output D5;
  wire D5;
  output D6;
  wire D6;
  output D7;
  wire D7;

  wire clk_base; // Un clk_base para q los otros prescalers no tengan ttantos bits

  parameter N = 20;
  parameter N0 = 1;
  parameter N1 = 2;
  parameter N2 = 3;
  parameter N3 = 4;
  parameter N4 = 5;
  parameter N5 = 6;
  parameter N6 = 7;
  parameter N7 = 8;

  prescaler #(.N(N))
    Presc (
      .clk_in(clk_in),
      .clk_out(clk_base)
      );

  prescaler #(.N(N0))
    Pres0(
      .clk_in(clk_base),
      .clk_out(D0)
      );

  prescaler #(.N(N1))
    Pres1(
      .clk_in(clk_base),
      .clk_out(D1)
      );

  prescaler #(.N(N2))
    Pres2(
      .clk_in(clk_base),
      .clk_out(D2)
      );

  prescaler #(.N(N3))
    Pres3(
      .clk_in(clk_base),
      .clk_out(D3)
      );

  prescaler #(.N(N4))
    Pres4(
      .clk_in(clk_base),
      .clk_out(D4)
      );

  prescaler #(.N(N5))
    Pres5(
      .clk_in(clk_base),
      .clk_out(D5)
      );

  prescaler #(.N(N6))
    Pres6(
      .clk_in(clk_base),
      .clk_out(D6)
      );

  prescaler #(.N(N7))
    Pres7(
      .clk_in(clk_base),
      .clk_out(D7)
      );

endmodule //
