module xor_gate_tb;
  reg a,b;
  wire c;
  xor_gate DUT(.a(a),.b(b),.c(c));
              initial begin
                $dumpfile("dump.vcd");
                $dumpvars;

                $monitor("a=%b b=%b c=%c,a,b,c");
                a=0;b=0;
          #10
                a=0; b=1;
          #10
                a=1;b=0;
          #10
                a=1;b=1;
              end
              endmodule
                
