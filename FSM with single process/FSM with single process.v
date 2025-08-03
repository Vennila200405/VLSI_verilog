module fsm (clk, reset, x1, outp);
	input        clk, reset, x1;
	output       outp;
	reg          outp;
	reg    [1:0] state;
	parameter s1 = 2’b00; parameter s2 = 2’b01;
	parameter s3 = 2’b10; parameter s4 = 2’b11;
	always @(posedge clk or posedge reset)
	begin
	   if (reset) begin
	      state <= s1; outp <= 1’b1;
	   end 
	   else begin
	      case (state)
		 s1: begin 
			if (x1 == 1’b1) begin
			   state <= s2;
                           outp  <= 1’b1;
			end
			else begin
			   state <= s3;
                           outp  <= 1’b1;
			end
		     end
		 s2: begin
			state <= s4; 
                        outp  <= 1’b0;
		     end
		 s3: begin
			state <= s4; 
                        outp  <= 1’b0;
		     end
		 s4: begin
			state <= s1; 
                        outp  <= 1’b1;
		     end
	      endcase
	   end
	end
        endmodule
        
