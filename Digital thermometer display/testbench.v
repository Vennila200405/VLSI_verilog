module tb_digital_thermometer;
  reg clk, rst;
    reg [7:0] temperature;
    wire [6:0] seg_tens, seg_units;

  
    digital_thermometer uut (
        .clk(clk),
        .rst(rst),
        .temperature(temperature),
        .seg_tens(seg_tens),
        .seg_units(seg_units)
    );

   
    always #5 clk = ~clk;

    initial begin
        $monitor("Time: %0d | Temp: %d | Tens Seg: %b | Units Seg: %b", 
                  $time, temperature, seg_tens, seg_units);
    end

    initial begin
      
        clk = 0;
        rst = 1;
        temperature = 8'd0;

       
        #10 rst = 0;

       
        #10 temperature = 8'd25;
        #10 temperature = 8'd37;
        #10 temperature = 8'd48;
        #10 temperature = 8'd59;
        #10 temperature = 8'd64;
        #10 temperature = 8'd75;
        #10 temperature = 8'd88;
        #10 temperature = 8'd99;

        
        #20 $finish;
    end

endmodule
