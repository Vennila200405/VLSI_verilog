timescale 1ns/1ps
module raminfr_tb;

reg clk;
reg ena, enb, wea;
reg [4:0] addra, addrb;
reg [3:0] dia;

wire [3:0] doa, dob;


raminfr uut (
    .clk(clk),
    .ena(ena),
    .enb(enb),
    .wea(wea),
    .addra(addra),
    .addrb(addrb),
    .dia(dia),
    .doa(doa),
    .dob(dob)
);
always #5 clk = ~clk;

initial begin
   
    clk = 0;
    ena = 0;
    enb = 0;
    wea = 0;
    addra = 5'b00000;
    addrb = 5'b00000;
    dia = 4'b0000;

    
    #10;
    ena = 1;
    wea = 1;
    addra = 5'b00010;
    dia = 4'b1010;
    #10;

    
    addra = 5'b00100;
    dia = 4'b1100;
    #10;

   
    wea = 0; 
    enb = 1;
    addrb = 5'b00010;
    #10;

   
    addrb = 5'b00100;
    #10;


    ena = 1;
    wea = 0;
    addra = 5'b00010; 
    addrb = 5'b00100; 
    ena = 0;
    enb = 0;
    #10;

  
    $finish;
end


initial begin
    $monitor("Time = %0t | ena = %b | enb = %b | wea = %b | addra = %b | addrb = %b | dia = %b | doa = %b | dob = %b",
              $time, ena, enb, wea, addra, addrb, dia, doa, dob);
end

endmodule
