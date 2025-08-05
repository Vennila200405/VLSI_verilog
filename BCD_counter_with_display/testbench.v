module tb_bcd_counter_display;
    reg clk, rst;
    wire [6:0] seg;

    bcd_counter_display uut (
        .clk(clk),
        .rst(rst),
        .seg(seg)
    );

    // Clock Generation (1Hz slow clock for demo)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #20;
        rst = 0;

        // Run the counter for a few cycles
        repeat(20) begin
            #10;
            $display("7-Segment Output = %b", seg);
        end

        $stop;
    end
