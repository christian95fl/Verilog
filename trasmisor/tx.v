`include "baudgen.vh"
module tx(clk,dtr,out);
    input wire clk;
    input wire dtr;
    output reg out;
    parameter M = `B115200;
    //localparam  N = $clog2(M);

    reg load;
    reg [9:0] shifter;
    wire clk_baud;

    always @(posedge clk)
      load <= dtr;

    always @(posedge clk)
      if (load == 0)
        shifter <= {"K",2'b01};
      else if (load == 1 && clk_baud == 1)
        shifter <= {1'b1,shifter[9:1]};

    div #(M)
      divisor(
        .clk(clk),
        .clk_ena(load),
        .clk_out(clk_baud)
        );

    always @(posedge clk)
      if (load == 1)
        out <= shifter[0];
      else
        out <= 1'b1;


endmodule //
