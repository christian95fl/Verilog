module register(rst,clk,din,dout);
input wire rst;
input wire clk;
input wire [N-1:0] din;
output reg [N-1:0] dout;

parameter N = 4;
parameter INI = 0;

always @ (posedge clk)
  if (rst == 0)
    dout <= INI;
  else
    dout <= din;

endmodule
