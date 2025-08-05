module prng_lfsr (
    input  wire clk,
    input  wire rst,
    output reg [3:0] random_out
);
    wire feedback;

  assign feedback = random_out[3] ^ random_out[2]; 
  always @(posedge clk or posedge rst) begin
        if (rst)
            random_out <= 4'b0001; 
        else
            random_out <= {random_out[2:0], feedback};
    end
endmodule
