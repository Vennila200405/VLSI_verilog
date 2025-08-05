module tb_digital_clock;
    reg clk, rst;
    wire [5:0] seconds;
    wire [5:0] minutes;
    wire [4:0] hours;

    digital_clock uut (
        .clk(clk),
        .rst(rst),
        .seconds(seconds),
        .minutes(minutes),
        .hours(hours)
    );

  
  always #10 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #50;
        rst = 0;

        
        repeat(500) begin
          #100_000;          
          $display("Time -> %02d:%02d:%02d", hours, minutes, seconds);
        end

        $stop;
    end
endmodule
