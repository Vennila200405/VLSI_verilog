
module bcd_counter (
    input  wire clk,
    input  wire rst,
    output reg [3:0] bcd_out
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            bcd_out <= 4'b0000;
        else if (bcd_out == 4'b1001)
            bcd_out <= 4'b0000;
        else
            bcd_out <= bcd_out + 1;
    end
endmodule
