module tb_pwm_generator;

    reg clk;
    reg reset;
    reg [7:0] duty_cycle;
    wire pwm_out;

 
    pwm_generator DUT (
        .clk(clk),
        .reset(reset),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_out)
    );

     
        clk = 0;
        forever #5 clk = ~clk;
    end

  
    initial begin
        // Initialize
        reset = 1;
        duty_cycle = 0;
        #20;

        reset = 0;

       
        duty_cycle = 8'd64;
        #3000;

       
        duty_cycle = 8'd128;
        #3000;

        
        duty_cycle = 8'd192;
        #3000;

        $finish;
    end

    
    initial begin
        $monitor("Time=%0t | duty_cycle=%d | pwm_out=%b", $time, duty_cycle, pwm_out);
    end

endmodule
