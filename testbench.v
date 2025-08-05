module tb_reset_synchronizer;

    reg clk;
    reg async_rst;
    wire sync_rst;

    reset_synchronizer uut (
        .clk(clk),
        .async_rst(async_rst),
        .sync_rst(sync_rst)
    );

  
    always #10 clk = ~clk; 

    initial begin
      
        clk = 0;
        async_rst = 0;

        
        #15 async_rst = 1;
        #25 async_rst = 0;

        #100;

        #40 async_rst = 1;
        #20 async_rst = 0;

        #100;

        $stop;
    end

endmodule
