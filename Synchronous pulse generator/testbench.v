module tb_pulse_generator;

    reg clk;
    reg reset;
    reg enable;
    wire pulse_out;


    pulse_generator #(5) DUT (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .pulse_out(pulse_out)
    );

  
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
       
        reset = 1; enable = 0;
        #20;
        reset = 0; enable = 1;

      
        #100;

        
        enable = 0;
        #30;

      
        enable = 1;
        #50;

        $finish;
    end

    
    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | enable=%b | pulse_out=%b", $time, clk, reset, enable, pulse_out);
    end

endmodule
