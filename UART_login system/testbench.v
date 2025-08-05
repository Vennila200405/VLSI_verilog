module tb_uart_login;
    reg clk = 0;
    reg rst = 1;
    reg rx  = 1;
    wire [7:0] rx_data;
    wire rx_data_valid;
    wire login_success, login_fail;

  uart_rx #(.CLKS_PER_BIT(10)) uart_receiver ( 
    .clk(clk),
        .rst(rst),
        .rx(rx),
        .data_out(rx_data),
        .data_valid(rx_data_valid)
    );

    login_system login_module (
        .clk(clk),
        .rst(rst),
        .rx_data(rx_data),
        .rx_data_valid(rx_data_valid),
        .login_success(login_success),
        .login_fail(login_fail)
    );

    always #5 clk = ~clk; 

    task uart_send_byte(input [7:0] data);
        integer i;
        begin
            rx = 0; 
          #(10 * 10); 
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

     
        uart_send_byte("s");
        uart_send_byte("e");
        uart_send_byte("r");

     
        uart_send_byte("a");
        uart_send_byte("s");
        uart_send_byte("s");

        #1000;

        if (login_success)
            $display("Login Successful!");
        else if (login_fail)
            $display("Login Failed!");

        $stop;
    end
endmodule
