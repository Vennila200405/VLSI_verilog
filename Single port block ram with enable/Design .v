a single-port block RAM with enable.
        module raminfr (clk, en, we, a, di, do);
        input        clk;
        input        en;
        input        we;
        input  [4:0] a;
        input  [3:0] di;
        output [3:0] do;
        reg    [3:0] ram [31:0];
        reg    [4:0] read_a;
        always @(posedge clk)
        begin
           if (en) begin
              if (we)
                 ram[a] <= di;
              read_a <= a;
           end
        end
           assign do = ram[read_a];
        endmodule
        
