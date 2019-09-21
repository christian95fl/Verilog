module mux2x1 (clk, data);
  input wire clk;
  output reg [7:0] data;
  wire sel;
  parameter  D0 = 8'b01010101;
  parameter  D1 = 8'b10101010;
  parameter N0 = 22;

  prescaler #(.N(N0))
    PRE(
      .clk_in(clk),
      .clk_out(sel)
      );

  always @ (sel) begin
    case(sel)
    0: data = D0;
    1: data = D1;
    endcase
  end

endmodule //
