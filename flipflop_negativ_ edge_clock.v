module flop (
  input  wire clk,
  input  wire d,
  input  wire clr,
  output reg  q
);

  always @(negedge clk or posedge clr) begin
    if (clr)
      q <= 1'b0;  // Asynchronous Clear
    else
      q <= d;     // Capture data on negative edge of clk
  end

endmodule