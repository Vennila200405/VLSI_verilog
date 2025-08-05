module tb_sr_flipflop;
    reg s, r, clk;
    wire q, q_bar;

    sr_flipflop uut (
        .s(s),
        .r(r),
        .clk(clk),
        .q(q),
        .q_bar(q_bar)
    );

  
    always #5 clk = ~clk;

    initial begin
     
        clk = 0;
        s = 0; r = 0;

        
        #10;
        $display("Hold -> S=%b R=%b | Q=%b Q_bar=%b", s, r, q, q_bar);

      
        s = 1; r = 0;
        #10;
        $display("Set -> S=%b R=%b | Q=%b Q_bar=%b", s, r, q, q_bar);

       
        s = 0; r = 1;
        #10;
        $display("Reset -> S=%b R=%b | Q=%b Q_bar=%b", s, r, q, q_bar);

      
        s = 1; r = 1;
        #10;
        $display("Invalid -> S=%b R=%b | Q=%b Q_bar=%b", s, r, q, q_bar);

        $stop;
    end
endmodule
