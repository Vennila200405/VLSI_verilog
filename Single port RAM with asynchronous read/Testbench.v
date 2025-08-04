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
        a = 5'd4;
        di = 4'b1010;

        
        @(negedge clk);
        a = 5'd8;
        di = 4'b1100;

        
        @(negedge clk);
        we = 0;

        
        #2; 
        a = 5'd4;
        #2;
        $display("Read do from address 4 = %b", do);

       
        #2;
        a = 5'd8;
        #2;
        $display("Read do from address 8 = %b", do);

          
        #2;
        a = 5'd15;
        #2;
        $display("Read do from address 15 = %b", do);

        $finish;
    end
          endmodule
