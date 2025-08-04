module tb_clock_divider;

    reg clk_in;
    reg reset;
    wire clk_out;

  
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out)
    );

  
        clk_in = 0;
        forever #10 clk_in = ~clk_in;
    end

    
    initial begin
        
        reset = 1;
        #25;  
        reset = 0;

  
    end

 
    initial begin
        $monitor("Time=%0t | clk_in=%b | clk_out=%b | reset=%b", $time, clk_in, clk_out, reset);
    end

endmodule
