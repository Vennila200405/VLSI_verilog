module tb_raminfr;
    reg clk;
    reg we;
    reg en;
    reg [4:0] addr;
    reg [3:0] di;
    wire [3:0] do;

      
    raminfr uut (
        .clk(clk),
        .we(we),
        .en(en),
        .addr(addr),
        .di(di),
        .do(do)
    );

    
    always #5 clk = ~clk; 

    initial begin
       
        clk = 0;
        we = 0;
        en = 0;
        addr = 0;
        di = 0;

        
        #10;

        
        @(negedge clk);
        en = 1;
        we = 1;
        addr = 5'd6;
        di = 4'b1010;

        
        @(negedge clk);
        addr = 5'd12;
        di = 4'b1100;

        
        @(negedge clk);
        we = 0;
        addr = 5'd6;

        @(negedge clk);
        $display("Read do from address 6 = %b", do);

        
        @(negedge clk);
        addr = 5'd12;

        @(negedge clk);
        $display("Read do from address 12 = %b", do);

          
        @(negedge clk);
        en = 0;
        addr = 5'd0; 

        @(negedge clk);
        $display("No-Change Mode Output do = %b", do);

        $finish;
    end
          endmodule
