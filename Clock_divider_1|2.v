module clock_divider_by2 (
    input  wire clk_in,    
    input  wire reset,     
    output reg  clk_out    
);

    always @(posedge clk_in) begin
        if (reset)
            clk_out <= 0;
        else
            clk_out <= ~clk_out; 
    end

endmodule
