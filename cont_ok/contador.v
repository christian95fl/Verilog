module contad (clk,data);
  input clk;
  wire clk;
  output [7:0] data;
  reg [7:0] data = 0;

  wire clk_int;

  parameter N = 22;

  prescaler #(.N(N))
    Pres(
      .clk_in(clk),
      .clk_out(clk_int)
      );

  always @ (posedge clk_int) begin
    data <= data + 1;
  end
endmodule //
