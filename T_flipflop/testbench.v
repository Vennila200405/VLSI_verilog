module tb_t_flipflop;
    reg t, clk;
    wire q, q_bar;

    t_flipflop uut (
        .t(t),
        .clk(clk),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        t = 0;

           #10;
        $display("Hold -> T=%b | Q=%b Q_bar=%b", t, q, q_bar);

          t = 1;
        #10;
        $display("Toggle -> T=%b | Q=%b Q_bar=%b", t, q, q_bar);

       
        #10;
        $display("Toggle Again -> T=%b | Q=%b Q_bar=%b", t, q, q_bar);

            t = 0;
        #10;
        $display("Hold Again -> T=%b | Q=%b Q_bar=%b", t, q, q_bar);

        $stop;
    end
endmodule
