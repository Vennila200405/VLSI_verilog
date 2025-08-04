module rom_using_file (
  8 address ,
  9 data    , 
 10 read_en , 
 11 ce        
 12 );
 13 input [7:0] address;
 14 output [7:0] data; 
 15 input read_en; 
 16 input ce; 
 17            
 18 reg [7:0] mem [0:255] ;  
 19       
 20 assign data = (ce && read_en) ? mem[address] : 8'b0;
 21 
 22 initial begin
   23   $readmemb("memory.list", mem); 
 24 end
 25 
  26 endmodule
