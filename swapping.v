With temp reg ;

always @ (posedge clock)
begin
temp=b;
b=a;
a=temp;
end

Without temp reg;

always @ (posedge clock)
begin
a <= b;
b <= a;
end