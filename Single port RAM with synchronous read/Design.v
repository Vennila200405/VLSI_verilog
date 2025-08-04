a single-port RAM with synchronous read (read through).
	module raminfr (clk, we, a, di, do);
	input        clk;
	input        we;
	input  [4:0] a;
	input  [3:0] di;
	output [3:0] do;
	reg    [3:0] ram [31:0];
	reg    [4:0] read_a;
	always @(posedge clk) 
	begin
	   if (we)
	      ram[a] <= di;
	   read_a <= a;
	end
	   assign do = ram[read_a];
        endmodule
