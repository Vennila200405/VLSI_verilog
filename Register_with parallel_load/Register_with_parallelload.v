module parallel_load_register (
   input  wire        clk,   
   input  wire        reset, 
   input  wire        load,  
   input  wire [7:0]  d,     
   output reg  [7:0]  q    );

always @(posedge clk or posedge reset) begin
    if (reset)
   q <= 8'b00000000;
    else if (load)
        q <= d;         
    
end

endmodule
