module t_flipflop (
    input  wire t,
    input  wire clk,
    output reg  q,
    output wire q_bar
);
    assign q_bar = ~q;

    always @(posedge clk) begin
        if (t)
            q <= ~q;  // Toggle when T=1
        else
            q <= q;   // Hold when T=0
    end
endmodule
