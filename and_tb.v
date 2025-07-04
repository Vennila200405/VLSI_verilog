module andg_tb;
  reg A,B;
  wire Y;
  andg andgate(.A(A),.B(B),.Y(Y));
  initial begin
         A=1'b0;B=1'b0;
         #10 A =1'b0;B= 1'b1;
         #10 A =1'b1;B= 1'b0;
         #10 A =1'b1;B= 1'b1;
         #10
    $finish;
     end
  initial begin
    $display("time =%0t\tINPUT VALUES:\t A=%b B=%b\t output value Y =%b",$time,A,B,Y);
    $dumpfile("dump.vcd");
    $dumpvars;
    
  end
endmodule
