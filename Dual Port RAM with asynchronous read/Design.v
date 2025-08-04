module raminfr (clk, we, a, dpra, di, spo, dpo);
	input        clk;
	input        we;
	input  [4:0] a;
	input  [4:0] dpra;
	input  [3:0] di;
	output [3:0] spo;
	output [3:0] dpo;
	reg    [3:0] ram [31:0];
	always @(posedge clk) 
	begin
	   if (we)
	      ram[a] <= di;
	end
	   assign spo = ram[a];
	   assign dpo = ram[dpra];
        endmodule
        
