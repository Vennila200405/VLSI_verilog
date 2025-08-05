module tb_uart_shift;
    reg clk, rst, tx_start;
    reg [7:0] tx_data;
    wire tx_line, rx_done;
    wire [7:0] rx_data;

    uart_tx_shift uart_tx (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx_line(tx_line),
        .tx_busy()
    );

    uart_rx_shift uart_rx (
        .clk(clk),
        .rst(rst),
      .rx_line(tx_line), 
      .rx_data(rx_data),
        .rx_done(rx_done)
    );

   
    always #10 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        tx_start = 0;
        tx_data = 0;
        #100;
        rst = 0;

      
      tx_data = 8'hA5;
        tx_start = 1;
        #20;
        tx_start = 0;

       
        wait (rx_done);
        $display("Received Data = %h", rx_data);

        $stop;
    end
endmodule
