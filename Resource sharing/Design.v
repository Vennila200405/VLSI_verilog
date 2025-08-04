Following is the Verilog code for resource sharing.
	module addsub(a, b, c, oper, res);
	input        oper;
	input  [7:0] a;
	input  [7:0] b;
	input  [7:0] c;
	output [7:0] res;
	reg    [7:0] res;
	always @(a or b or c or oper)
	begin
	   if (oper == 1’b0)
	      res = a + b;
	   else
	      res = a - c;
	end
        endmodule
        
