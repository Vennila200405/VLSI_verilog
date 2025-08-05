module tb_vga_controller;
    reg clk, rst;
    wire hsync, vsync;
    wire [3:0] red, green, blue;

  
  vga_test_pattern uut (
        .clk(clk),
        .rst(rst),
        .hsync(hsync),
        .vsync(vsync),
        .red(red),
        .green(green),
        .blue(blue)
    );

    // Generate 25MHz Clock -> Toggle every 20ns
    always #20 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #100;   // Apply Reset
        rst = 0;

        
        repeat(5000) begin
          #40;            $display("Time=%0t HSYNC=%b VSYNC=%b RED=%b GREEN=%b BLUE=%b", $time, hsync, vsync, red, green, blue);
        end

        $stop;
    end
endmodule
