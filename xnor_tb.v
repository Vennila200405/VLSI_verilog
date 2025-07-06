module xnor_gate_tb;
  reg a,b;
  wire y;
  xnor_gate ASI(.a(a),.b(b),.y(y));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor("a=%b b=%b y=%y",a,b,y);
    a=0;b=0;
 #2 a=0;b=1;
 #2 a=1;b=0;
 #2 a=1;b=1;
  end
endmodule
