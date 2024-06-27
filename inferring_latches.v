basically when the value of the output is held on hold or stored because of the input being not avaoilable/ held / not mentioned in the sensitivity list a latch inferring happens ....basically the output is stored the way atch stores values.

Eg 1
always @(x or y)begin 
  y=x &z ;
end
// here z is not explicitely defined in the sensitivity list hence when value of z is not avaailable the y (output) is kept on hold (latch inferring happens0

Eg 2
always @* begin 
  if(x==1)begin 
    out=y & z;
  end
end
// here there is no else condition for x==1 hence when the value of x=0 the latch gets infered and previous output value has to be held 
