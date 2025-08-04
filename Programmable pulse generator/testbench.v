module tb_programmable_pulse_generator;

    reg clk;
    reg reset;
    reg enable;
    reg [7:0] pulse_interval;
    reg [7:0] pulse_width;
    wire pulse_out;

   
    programmable_pulse_generator DUT (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .pulse_interval(pulse_interval),
        .pulse_width(pulse_width),
        .pulse_out(pulse_out)
    );

  
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        // Initialize
        reset = 1; enable = 0;
        pulse_interval = 10;  
        pulse_width = 3;     
        #20;

        reset = 0;
        enable = 1;

      
        #150;

        
        pulse_interval = 15;
        pulse_width = 5;
        #100;

        
        enable = 0;
        #30;

        $finish;
    end

    
    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | enable=%b | pulse_out=%b", $time, clk, reset, enable, pulse_out);
    end

endmodule
