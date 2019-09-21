module register(rst,clk,din,dout);
input wire rst;
input wire clk;
input wire [cant_bit - 1 : 0] din;
output reg [cant_bit - 1 : 0] dout;

parameter cant_bit = 4;
parameter INI = 0;

always @ (posedge clk)
  if (rst == 0)
    dout <= INI;
  else
    dout <= din;

endmodule
