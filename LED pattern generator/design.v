module led_pattern_generator (
    input  wire clk,
    input  wire rst,
    input  wire [1:0] mode,
    output reg  [7:0] led
);
  reg [23:0] counter;     always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            led     <= 8'b00000001;
        end else begin
            counter <= counter + 1;

          if (counter == 24'd10_000_000) begin                counter <= 0;
                case (mode)
                    2'b00: begin 
                        led <= (led == 8'b10000000) ? 8'b00000001 : led << 1;
                    end
                    2'b01: begin 
                        led <= (led == 8'b00000001) ? 8'b10000000 : led >> 1;
                    end
                    2'b10: begin 
                        led <= ~led;
                    end
                    2'b11: begin 
                        led <= (led == 8'b10101010) ? 8'b01010101 : 8'b10101010;
                    end
                endcase
            end
        end
    end
endmodule
