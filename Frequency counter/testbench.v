module tb_frequency_counter;

    reg clk;
    reg reset;
    reg signal_in;
    wire [31:0] frequency_count;

    frequency_counter uut (
        .clk(clk),
        .reset(reset),
        .signal_in(signal_in),
        .frequency_count(frequency_count)
    );

    



    initial begin
        clk = 0;
        reset = 1;
        signal_in = 0;

        #20 reset = 0;

     
        #200000000;  

        $display("Frequency Count = %d", frequency_count);
        $stop;
    end
endmodule
