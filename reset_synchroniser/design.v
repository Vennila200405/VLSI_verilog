module reset_synchronizer (
    input  wire clk,        
  input  wire async_reset,
    reg reset_ff1, reset_ff2;

    always @(posedge clk or posedge async_reset) begin
        if (async_reset) begin
            reset_ff1 <= 1'b1;
            reset_ff2 <= 1'b1;
        end else begin
            reset_ff1 <= 1'b0;
            reset_ff2 <= reset_ff1;
        end
    end

    assign sync_reset = reset_ff2;

endmodule
