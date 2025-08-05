module tb_prng_lfsr;
    reg clk, rst;
    wire [3:0] random_out;

    prng_lfsr uut (
        .clk(clk),
        .rst(rst),
        .random_out(random_out)
    );

    
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #10;
        rst = 0;

        
        repeat(20) begin
            #10;
            $display("Random Number = %b", random_out);
        end

        $stop;
    end
endmodule
