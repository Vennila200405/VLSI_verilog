module tb_raminfr;

  
    reg clk;
    reg we;
    reg [4:0] a;
    reg [3:0] di;
    wire [3:0] do;

    
    raminfr uut (
        .clk(clk),
        .we(we),
        .a(a),
        .di(di),
        .do(do)
    );

  
    always #5 clk = ~clk; 

    initial begin
        
        clk = 0;
        we = 0;
        a = 0;
        di = 0;

        
        #10;

      
        @(negedge clk);
        we = 1;
        a = 5'd3;
        di = 4'b1001;

       
        @(negedge clk);
        a = 5'd7;
        di = 4'b1100;

       
        @(negedge clk);
        we = 0;

        
        @(negedge clk);
        a = 5'd3;

        @(negedge clk);
        $display("Read do from address 3 = %b", do);

        
        @(negedge clk);
        a = 5'd7;

        @(negedge clk);
        $display("Read do from address 7 = %b", do);

          
        @(negedge clk);
        a = 5'd10;

        @(negedge clk);
        $display("Read do from address 10 = %b", do);

        $finish;
    end
          endmodule
