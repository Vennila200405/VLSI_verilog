
module bcd_counter_display (
    input  wire clk,
    input  wire rst,
    output wire [6:0] seg
);
    wire [3:0] bcd_out;

    bcd_counter counter (
        .clk(clk),
        .rst(rst),
        .bcd_out(bcd_out)
    );

    bcd_to_7seg display (
        .bcd_in(bcd_out),
        .seg(seg)
    );
endmodule
