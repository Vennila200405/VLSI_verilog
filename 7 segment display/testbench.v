module tb_seven_segment_decoder;

    reg [3:0] bcd;
    wire [6:0] seg;

    
    seven_segment_decoder DUT (
        .bcd(bcd),
        .seg(seg)
    );

    integer i;

    initial begin
        $display("Time | BCD | Segments (a-g)");
        $monitor("%0t | %b  | %b", $time, bcd, seg);

      
        for (i = 0; i < 10; i = i + 1) begin
            bcd = i;
            #10;
        end

   
        #10;

        $finish;
    end

endmodule
