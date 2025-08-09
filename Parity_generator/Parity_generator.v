module even_parity_generator (
  input  [3:0] data_in,
  output parity_bit
);
endmodule

module odd_parity_generator (
  input  [3:0] data_in,
  output parity_bit
);
  assign parity_bit = ~(^data_in);
endmodule
