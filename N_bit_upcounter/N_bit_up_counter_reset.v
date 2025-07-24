module up_counter #(
 parameter N = 8 
)(
    input  wire clk,      
  input  wire reset,    

always @(posedge clk) begin
    if (reset)
        q <= 0;
    else
        q <= q + 1;
end

endmodule
