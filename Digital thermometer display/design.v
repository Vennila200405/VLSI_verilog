module digital_thermometer (
    input wire clk,
    input wire rst,
  input wire [7:0] temperature,         

    reg [3:0] tens, units;

   
    always @(*) begin
        tens = temperature / 10;
        units = temperature % 10;
    end

    
    function [6:0] bcd_to_7seg;
        input [3:0] bcd;
        case (bcd)
            4'd0: bcd_to_7seg = 7'b1000000;
            4'd1: bcd_to_7seg = 7'b1111001;
            4'd2: bcd_to_7seg = 7'b0100100;
            4'd3: bcd_to_7seg = 7'b0110000;
            4'd4: bcd_to_7seg = 7'b0011001;
            4'd5: bcd_to_7seg = 7'b0010010;
            4'd6: bcd_to_7seg = 7'b0000010;
            4'd7: bcd_to_7seg = 7'b1111000;
            4'd8: bcd_to_7seg = 7'b0000000;
            4'd9: bcd_to_7seg = 7'b0010000;
            default: bcd_to_7seg = 7'b1111111; 
        endcase
    endfunction

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            seg_tens <= 7'b1111111;
            seg_units <= 7'b1111111;
        end else begin
            seg_tens <= bcd_to_7seg(tens);
            seg_units <= bcd_to_7seg(units);
        end
    end

endmodule
