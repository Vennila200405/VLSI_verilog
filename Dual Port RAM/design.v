module raminfr (clk, ena, enb, wea, addra, addrb, dia, doa, dob);
	input        clk, ena, enb, wea;
	input  [4:0] addra, addrb;
	input  [3:0] dia;
	output [3:0] doa, dob;
	reg    [3:0] ram [31:0];
	reg    [4:0] read_addra, read_addrb;
	always @(posedge clk) 
	begin
	   if (ena) begin
	      if (wea) begin
		 ram[addra] <= dia;
	      end
	   end
	end

	always @(posedge clk) 
	begin
	   if (enb) begin
	      read_addrb <= addrb;
	   end
	end
	   assign doa = ram[read_addra];
	   assign dob = ram[read_addrb];
        endmodule
        
