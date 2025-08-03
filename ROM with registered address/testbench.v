`timescale 1ns/1ps
module rominfr_tb;

reg clk;
reg en;
reg [4:0] addr;


  wire [3:0] data;
rominfr uut (
    .clk(clk),
    .en(en),
    .addr(addr),
    .data(data)
);

always #5 clk = ~clk;

initial begin
    // Initialize Inputs
    clk = 0;
    en = 0;
    addr = 5'b00000;
    #10;
    en = 1;
    addr = 5'b00000;  
    #10;

    addr = 5'b00010;  
    #10;

    addr = 5'b00101; 
    #10;

    addr = 5'b01010;  
    #10;

    addr = 5'b1111;   
    #10;

    addr = 5'b1001;   
    #10;
    addr = 5'b00100;
    #10;
    en = 1;
    addr = 5'b00100;  
    #10;
    $finish;
end
initial begin
    $monitor("Time = %0t | en = %b | addr = %b | raddr = %b | data = %b",
              $time, en, addr, uut.raddr, data);
end

endmodule
