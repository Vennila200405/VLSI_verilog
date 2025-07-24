module barrel_shifter_right (
 input  wire [7:0] in,
 input  wire [2:0] shift,
  output wire [7:0] out);


assign out = (shift == 3'd0) ? in :
             (shift == 3'd1) ? {1'b0,   in[7:1]} :
             (shift == 3'd2) ? {2'b00,  in[7:2]} :
             (shift == 3'd3) ? {3'b000, in[7:3]} :
             (shift == 3'd4) ? {4'b0000,in[7:4]} :
             (shift == 3'd5) ? {5'b00000,in[7:5]} :
             (shift == 3'd6) ? {6'b000000,in[7:6]} :
             (shift == 3'd7) ? {7'b0000000,in[7]} :
             8'b00000000;
endmodule
