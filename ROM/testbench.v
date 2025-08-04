module tb_rom_using_file;
 
  reg  [7:0] address;
  reg        read_en;
  reg        ce;
  wire [7:0] data;

 
  rom_using_file DUT (
    .address(address),
    .data(data),
    .read_en(read_en),
    .ce(ce)
  );

 
  initial begin
    // Monitor signal values
    $monitor("Time=%0d | Address=%h | CE=%b | Read_EN=%b | Data=%h", $time, address, ce, read_en, data);

   
    ce = 0; read_en = 0; address = 8'h00;
    #10;

   
    ce = 1; read_en = 0; address = 8'h05;
    #10;

  
    ce = 1; read_en = 1; address = 8'h05;
    #10;

    
    address = 8'h0A;
    #10;

   
    ce = 0; read_en = 1; address = 8'h0A;
    #10;

   
    ce = 1; read_en = 1; address = 8'hFF;
    #10;

    $finish;
  end

endmodule
