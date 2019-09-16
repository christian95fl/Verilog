module inic(input wire clk,output in);
  reg in = 0;
  always @ ( posedge clk ) begin
    in <= 1;
  end

endmodule //
