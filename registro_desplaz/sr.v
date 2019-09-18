module sr (clk, data);
  input wire clk;
  output reg [7:0] data;

  wire clk_base;
  reg load = 0;

  parameter  N = 20;
  parameter din = 1;


  prescaler #(.N(N))
    PRE(
      .clk_in(clk),
      .clk_out(clk_base)
      );

  always @ (posedge clk_base )
    load <= 1;

  always @ (posedge clk_base) begin
    if (load == 0)
      data = din;
    else
      data = {data[6:0],data[7]};
  end

endmodule //
