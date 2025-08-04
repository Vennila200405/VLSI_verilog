module programmable_pulse_generator (
    input  wire clk,
    input  wire reset,
    input  wire enable,
  input  wire [7:0] pulse_interval, 
);

    reg [7:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter   <= 0;
            pulse_out <= 0;
        end else if (enable) begin
            if (counter < pulse_width)
                pulse_out <= 1;
            else
                pulse_out <= 0;

            if (counter == pulse_interval - 1)
                counter <= 0;
            else
                counter <= counter + 1;
        end else begin
            pulse_out <= 0;
        end
    end

endmodule
