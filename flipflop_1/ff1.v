module ff1 (d,clk,q,q_bar);
  input d,clk;
  output q,q_bar;
  reg q,q_bar;
  always @ (posedge clk) begin
    q <= #1 d;
    q_bar <= #1 !d;
  end
endmodule // 
