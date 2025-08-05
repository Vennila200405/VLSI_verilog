module uart_rx_shift (
    input  wire clk,       
    input  wire rst,       
    input  wire rx_line,   
  output reg  [7:0] rx_data, 
  output reg  rx_done    
);
    reg [3:0] bit_count;
    reg [12:0] baud_counter;
    reg [7:0] rx_shift_reg;
    reg receiving;

    parameter BAUD_TICK = 5208; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            bit_count    <= 0;
            baud_counter <= 0;
            rx_shift_reg <= 0;
            rx_done      <= 0;
            receiving    <= 0;
        end else begin
            rx_done <= 0;

          if (!receiving && rx_line == 0) begin 
            receiving <= 1;
                baud_counter <= BAUD_TICK >> 1;  
                bit_count <= 0;
            end else if (receiving) begin
                if (baud_counter == BAUD_TICK) begin
                    baud_counter <= 0;
                    rx_shift_reg <= {rx_line, rx_shift_reg[7:1]};
                    bit_count <= bit_count + 1;
                    if (bit_count == 7) begin
                        rx_data <= {rx_line, rx_shift_reg[7:1]};
                        rx_done <= 1;
                        receiving <= 0;
                    end
                end else
                    baud_counter <= baud_counter + 1;
            end
        end
    end
endmodule
