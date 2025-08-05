module edge_detector (
    input  wire clk,
    input  wire rst,
    input  wire signal_in,
    output wire rising_edge,
    output wire falling_edge
);

    reg prev_signal;

    always @(posedge clk or posedge rst) begin
        if (rst)
            prev_signal <= 0;
        else
            prev_signal <= signal_in;
    end

    assign rising_edge  = (signal_in & ~prev_signal);
    assign falling_edge = (~signal_in & prev_signal);

endmodule
