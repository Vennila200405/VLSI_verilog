module tb_edge_detector;

    reg clk;
    reg rst;
    reg signal_in;
    wire rising_edge;
    wire falling_edge;
    edge_detector uut (
        .clk(clk),
        .rst(rst),
        .signal_in(signal_in),
        .rising_edge(rising_edge),
        .falling_edge(falling_edge)
    );

    initial begin
   
        clk = 0;
        rst = 1;
        signal_in = 0;

        
        #25 rst = 0;

  
        #30 signal_in = 1;  
        #40 signal_in = 0;  
        #20 signal_in = 1;  
        #50 signal_in = 0;  
        #40 signal_in = 1; 

        #100;
        $stop;
    end

endmodule
