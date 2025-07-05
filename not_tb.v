module not_gate_tb;
  reg a;
  wire y;
  not_gate NG(.a(a),.y(y));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor("a=%b y=%b",a,y);
    a=0;
  end
endmodule
