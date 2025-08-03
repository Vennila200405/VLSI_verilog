module flop_pos_ce (
    input clk,      
    input ce,       
    input d,        
    output reg q    
);

    always @(posedge clk) begin
        if (ce)
            q <= d;  // Update q only if clock enable is high
        // else q retains its value (no change)
    end
endmodule