dual-port RAM with false synchronous read.
        module raminfr (clk, we, a, dpra, di, spo, dpo);
        input        clk;
        input        we;
        input  [4:0] a;
        input  [4:0] dpra;
        input  [3:0] di;
        output [3:0] spo;
        output [3:0] dpo;
        reg    [3:0] ram [31:0];
        reg    [3:0] spo;
        reg    [3:0] dpo;
	always @(posedge clk) 
        begin
           if (we)
              ram[a] <= di;

           spo = ram[a];
           dpo = ram[dpra];
        end
        endmodule
        
