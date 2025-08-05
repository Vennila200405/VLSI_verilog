module digital_clock (
    input  wire clk,    // System clock (50MHz)
    input  wire rst,
    output reg [5:0] seconds,
    output reg [5:0] minutes,
    output reg [4:0] hours
);
    wire clk_1hz;

    // Instantiate Clock Divider
    clock_divider clk_div (
        .clk(clk),
        .rst(rst),
        .clk_1hz(clk_1hz)
    );

    always @(posedge clk_1hz or posedge rst) begin
        if (rst) begin
            seconds <= 0;
            minutes <= 0;
            hours   <= 0;
        end else begin
            // Seconds Increment
            if (seconds == 59) begin
                seconds <= 0;
                // Minutes Increment
                if (minutes == 59) begin
                    minutes <= 0;
                    // Hours Increment
                    if (hours == 23)
                        hours <= 0;
                    else
                        hours <= hours + 1;
                end else
                    minutes <= minutes + 1;
            end else
                seconds <= seconds + 1;
        end
    end
endmodule
