module prescaler (clk_in,clk_out);
  input clk_in;
  output clk_out;
  wire clk_out;
  wire clk_in;

  parameter N = 22;

  reg [N-1 : 0] count = 0;

  always @ ( posedge clk_in) begin
    count <= count + 1;
  end

  assign clk_out = count[N-1];

endmodule //
