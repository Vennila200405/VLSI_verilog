module tb_raminfr;

 
    reg clk;
    reg we;
    reg [4:0] a;
    reg [4:0] dpra;
    reg [3:0] di;
    wire [3:0] spo;
    wire [3:0] dpo;


        .clk(clk),
        .we(we),
        .a(a),
        .dpra(dpra),
        .di(di),
        .spo(spo),
        .dpo(dpo)
    );

    
    always #5 clk = ~clk; 

    initial begin
        
        clk = 0;
        we = 0;
        a = 0;
        dpra = 0;
        di = 0;

  
        @(negedge clk);
        we = 1;
        a = 5'd3;
        di = 4'b1010;

        @(negedge clk);
        we = 1;
        a = 5'd10;
        di = 4'b1100;

        @(negedge clk);
        we = 1;
        a = 5'd15;
        di = 4'b1111;

        @(negedge clk);
        we = 0;  

       
        dpra = 5'd3;
        #2;  
        $display("Read dpo from address 3 = %b", dpo);

        dpra = 5'd10;
        #2;
        $display("Read dpo from address 10 = %b", dpo);

        dpra = 5'd15;
        #2;
        $display("Read dpo from address 15 = %b", dpo);

        dpra = 5'd7;  
        #2;
        $display("Read dpo from address 7 = %b", dpo);

        $finish;
    end
endmodule
