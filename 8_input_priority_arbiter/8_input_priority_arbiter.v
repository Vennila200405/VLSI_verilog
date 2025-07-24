module priority_arbiter_8bit (
  input  wire [7:0] req,    


assign grant[7] = req[7];
assign grant[6] = ~req[7] & req[6];
assign grant[5] = ~req[7] & ~req[6] & req[5];
assign grant[4] = ~req[7] & ~req[6] & ~req[5] & req[4];
assign grant[3] = ~req[7] & ~req[6] & ~req[5] & ~req[4] & req[3];
assign grant[2] = ~req[7] & ~req[6] & ~req[5] & ~req[4] & ~req[3] & req[2];
assign grant[1] = ~req[7] & ~req[6] & ~req[5] & ~req[4] & ~req[3] & ~req[2] & req[1];
assign grant[0] = ~req[7] & ~req[6] & ~req[5] & ~req[4] & ~req[3] & ~req[2] & ~req[1] & req[0];

endmodule
