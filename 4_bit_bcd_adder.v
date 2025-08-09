module bcd_adder_4bit(
  input[3:0]a,
  input[3:0]b,
  input cin,
  output[3:0]sum,
  output cout
);
  wire[4:0]raw_sum;
  assign raw_sum=a+b+cin;
  wire[4:0]corrected_sum=(raw_sum>9)?(raw_sum+6):raw_sum;
  assign sum=corrected_sum[3:0];
  assign cout=corrected_sum[4];
endmodule
