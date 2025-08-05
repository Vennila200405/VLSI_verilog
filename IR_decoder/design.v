module ir_decoder (
    input wire clk,
    input wire reset,
    input wire ir_signal,
    output reg [31:0] data_out,
    output reg data_valid
);
    reg [31:0] shift_reg;
    reg [5:0] bit_count;
    reg [19:0] timer;
    reg state;

    localparam IDLE  = 1'b0;
    localparam RECV  = 1'b1;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state      <= IDLE;
            bit_count  <= 0;
            shift_reg  <= 0;
            data_out   <= 0;
            data_valid <= 0;
            timer      <= 0;
        end else begin
            timer <= timer + 1;

            case (state)
                IDLE: begin
                    data_valid <= 0;
                    if (ir_signal == 0) begin // Start Pulse Detected
                        timer <= 0;
                        state <= RECV;
                        bit_count <= 0;
                    end
                end

                RECV: begin
                    if (timer == 1000) begin // Sampling at mid-bit (adjust as per clk freq)
                        shift_reg <= {shift_reg[30:0], ir_signal};
                        bit_count <= bit_count + 1;
                        timer <= 0;
                        if (bit_count == 31) begin
                            data_out <= {shift_reg[30:0], ir_signal};
                            data_valid <= 1;
                            state <= IDLE;
                        end
                    end
                end
            endcase
        end
    end
endmodule
