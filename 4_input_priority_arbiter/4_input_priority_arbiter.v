module priority_arbiter_4bit(
  input  wire [3:0] req,     
  output wire [3:0] grant    


assign grant[3] = req[3];
assign grant[2] = ~req[3] & req[2];
assign grant[1] = ~req[3] & ~req[2] & req[1];
assign grant[0] = ~req[3] & ~req[2] & ~req[1] & req[0];

endmodule
