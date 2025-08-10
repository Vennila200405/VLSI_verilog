module parity_checker (
  input  [7:0] data,
  input parity_bit,
  input parity_type,  
  output parity_error);
  wire parity_calc;
  assign parity_calc = ^data;
  assign parity_error = (parity_calc ^ parity_bit) ^ parity_type;
endmodule
