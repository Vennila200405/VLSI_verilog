module spi_flash_slave (
    input wire cs,
    input wire sclk,
    input wire mosi,
    output reg miso
);

    reg [7:0] memory [0:255];  
    reg [3:0] bit_cnt;
    reg [7:0] addr;
    reg [7:0] out_data;
    reg [1:0] state;

    localparam IDLE = 2'd0,
               GET_CMD = 2'd1,
               GET_ADDR = 2'd2,
               SEND_DATA = 2'd3;

    initial begin
        memory[8'h0A] = 8'hDE;
        memory[8'h0B] = 8'hAD;
        memory[8'h0C] = 8'hBE;
        memory[8'h0D] = 8'hEF;
    end

    always @(negedge sclk or posedge cs) begin
        if (cs) begin
            state <= IDLE;
            bit_cnt <= 0;
        end else begin
            case (state)
                IDLE: begin
                    bit_cnt <= 7;
                    state <= GET_CMD;
                end
                GET_CMD: begin
                    if (bit_cnt == 0)
                        state <= GET_ADDR;
                    else
                        bit_cnt <= bit_cnt - 1;
                end
                GET_ADDR: begin
                    addr[bit_cnt] <= mosi;
                    if (bit_cnt == 0) begin
                        out_data <= memory[addr];
                        bit_cnt <= 7;
                        state <= SEND_DATA;
                    end else
                        bit_cnt <= bit_cnt - 1;
                end
                SEND_DATA: begin
                    miso <= out_data[bit_cnt];
                    if (bit_cnt == 0)
                        state <= IDLE;
                    else
                        bit_cnt <= bit_cnt - 1;
                end
            endcase
        end
    end
endmodule
