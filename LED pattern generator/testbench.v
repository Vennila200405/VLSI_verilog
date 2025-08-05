module tb_led_pattern_generator;
    reg clk, rst;
    reg [1:0] mode;
    wire [7:0] led;

    led_pattern_generator uut (
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .led(led)
    );

   always #10 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        mode = 2'b00;
        #100;
        rst = 0;

        
        mode = 2'b00;
        #200_000;

        
        mode = 2'b01;
        #200_000;

      
        mode = 2'b10;
        #200_000;

        
        mode = 2'b11;
        #200_000;

        $stop;
    end
endmodule
