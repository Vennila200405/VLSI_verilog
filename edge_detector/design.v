module rising_edge_detector (
    input  wire clk,
    input  wire signal_in,
    output reg  rising_edge
);
    reg signal_d;

    always @(posedge clk) begin
        signal_d <= signal_in; 
        rising_edge <= signal_in & ~signal_d; // Detect 0->1 transition
    end
endmodule
