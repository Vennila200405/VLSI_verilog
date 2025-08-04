module pulse_generator #(
    parameter PULSE_INTERVAL = 10  
)(
    input  wire clk,
    input  wire reset,
    input  wire enable,
    output reg  pulse_out
);

    reg [$clog2(PULSE_INTERVAL)-1:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter   <= 0;
            pulse_out <= 0;
        end else if (enable) begin
            if (counter == PULSE_INTERVAL - 1) begin
                pulse_out <= 1;
                counter   <= 0;
            end else begin
                pulse_out <= 0;
                counter   <= counter + 1;
            end
        end else begin
            pulse_out <= 0;  // Disable pulse when enable=0
        end
    end

endmodule
