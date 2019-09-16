module divcont (clk,data);
  input clk;
  output [7:0] data;
  wire clk;
  reg [7:0] data = 0;
  wire clk_1hz;
  reg [23:0] count = 0;


  always @ ( posedge clk ) begin
    if (count == 12_000_000)
      count <= 0;
    else
      count <= count + 1;

  end
  assign clk_1hz = count[23];
  always @ ( posedge clk_1hz ) begin
    data <= data + 1;
  end


endmodule //
