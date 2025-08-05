module tb_spi_flash_reader;

    reg clk, rst, start;
    reg [7:0] address;
    wire miso_master, mosi_master, sclk_master, cs_master;
    wire [7:0] data_out;
    wire done;

   
    spi_flash_reader master (
        .clk(clk),
        .rst(rst),
        .start(start),
        .address(address),
        .miso(miso_master),
        .mosi(mosi_master),
        .sclk(sclk_master),
        .cs(cs_master),
        .data_out(data_out),
        .done(done)
    );

  
    spi_flash_slave flash (
        .cs(cs_master),
        .sclk(sclk_master),
        .mosi(mosi_master),
        .miso(miso_master)
    );

  
    always #5 clk = ~clk;

    initial begin
        $monitor("Time: %0d | CS: %b | MOSI: %b | MISO: %b | Data_Out: %h | Done: %b", 
                  $time, cs_master, mosi_master, miso_master, data_out, done);
    end

    initial begin
     
        clk = 0;
        rst = 1;
        start = 0;
        address = 8'h0A;

      
        #10 rst = 0;

      
        #10 start = 1;
        #10 start = 0;

        
        wait(done);

       
        #20 address = 8'h0B;
        #10 start = 1;
        #10 start = 0;

        wait(done);

        #20 $finish;
    end

endmodule
