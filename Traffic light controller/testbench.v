module tb_uart_traffic_light;
    reg clk = 0;
    reg rst = 1;
    reg rx  = 1;
    wire [7:0] rx_data;
    wire rx_data_valid;
    wire red_light, yellow_light, green_light;

   
    uart_rx #(.CLKS_PER_BIT(10)) uart_receiver (
        .clk(clk),
        .rst(rst),
        .rx(rx),
        .data_out(rx_data),
        .data_valid(rx_data_valid)
    );

    
    traffic_light_controller controller (
        .clk(clk),
        .rst(rst),
        .command(rx_data),
        .command_valid(rx_data_valid),
        .red_light(red_light),
        .yellow_light(yellow_light),
        .green_light(green_light)
    );

    
    always #5 clk = ~clk; 

    // UART Byte Send Task
    task uart_send_byte(input [7:0] data);
        integer i;
        begin
            rx = 0; 
            #(10 * 10);
            for (i = 0; i < 8; i = i + 1) begin
                rx = data[i];
                #(10 * 10);
            end
            rx = 1;
            #(10 * 10);
        end
    endtask


    initial begin
        rst = 1;
        #100;
        rst = 0;

         uart_send_byte("R");
        #500;
        $display("Command: R | RED: %b YELLOW: %b GREEN: %b", red_light, yellow_light, green_light);

             uart_send_byte("Y");
        #500;
        $display("Command: Y | RED: %b YELLOW: %b GREEN: %b", red_light, yellow_light, green_light);

             uart_send_byte("G");
        #500;
        $display("Command: G | RED: %b YELLOW: %b GREEN: %b", red_light, yellow_light, green_light);

        $stop;
    end
endmodule
