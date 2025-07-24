module logical_shift (
  input  wire [7:0] in,       
   input  wire       dir,        
  output wire [7:0] out         

assign out = (dir == 1'b0) ? (in << shift_amt) : (in >> shift_amt);

endmodule
