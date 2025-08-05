module tb_jk_flipflop;
    reg j, k, clk;
    wire q, q_bar;

    jk_flipflop uut (
        .j(j),
        .k(k),
        .clk(clk),
        .q(q),
        .q_bar(q_bar)
    );

    
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        j = 0; k = 0;

        
        #10;
        $display("Hold -> J=%b K=%b | Q=%b Q_bar=%b", j, k, q, q_bar);

      
        j = 1; k = 0;
        #10;
        $display("Set -> J=%b K=%b | Q=%b Q_bar=%b", j, k, q, q_bar);

        
        j = 0; k = 1;
        #10;
        $display("Reset -> J=%b K=%b | Q=%b Q_bar=%b", j, k, q, q_bar);

        
        j = 1; k = 1;
        #10;
        $display("Toggle -> J=%b K=%b | Q=%b Q_bar=%b", j, k, q, q_bar);

        // Toggle again to verify flip-flop behavior
        #10;
        $display("Toggle Again -> J=%b K=%b | Q=%b Q_bar=%b", j, k, q, q_bar);

        $stop;
    end
endmodule
