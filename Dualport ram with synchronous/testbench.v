timescale 1ns/1ps
module raminfr_tb;


reg clk;
reg we;
reg [4:0] a;
reg [4:0] dpra;
reg [3:0] di;


wire [3:0] spo;
  wire [3:0] dpo;
raminfr uut (
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
    a = 5'b00000;
    dpra = 5'b00000;
    di = 4'b0000;

    
    #10;

   
    we = 1;
    a = 5'b00001;
    di = 4'b1010;
    #10; 

  
    a = 5'b00010;
    di = 4'b1100;
    #10; 

    
    we = 0;

     a = 5'b00001;    
    dpra = 5'b00010;   
    #10; 
    dpra = 5'b00001;  
    #10;

  
    #10;

  
    a = 5'b00011;
    di = 4'b1111;
  dpra = 5'b00010;   

    
    we = 0;
    a = 5'b00011;      
    dpra = 5'b00011;   
    #10;

   
    $finish;
end


initial begin
    $monitor("Time=%0t | we=%b | a=%b | dpra=%b | di=%b | spo=%b | dpo=%b", 
              $time, we, a, dpra, di, spo, dpo);
end

endmodule
