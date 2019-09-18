module blink4(input wire clk ,output wire [7:0] salida);

wire clk_base;
reg [7:0] dout = 0;
wire [7:0] din;

parameter N0 = 22;

prescaler #(.N(N0))
  PRES(
    .clk_in(clk),
    .clk_out(clk_base)
  );

always @(posedge clk_base)
    dout <= din;

assign din = ~dout;

assign salida = dout;

endmodule
