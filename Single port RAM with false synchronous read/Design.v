 code for a single-port RAM with "false" synchronous read.
	module raminfr (clk, we, a, di, do);
	input        clk;
	input        we;
	input  [4:0] a;
	input  [3:0] di;
	output [3:0] do;
	reg    [3:0] ram [31:0];
	reg    [3:0] do;
	always @(posedge clk) 
	begin
	   if (we)
	      ram[a] <= di;
	   do <= ram[a];
	end
        endmodule
