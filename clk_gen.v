module clkgen(clk);
output reg clk;
initial begin
clk=1'b0;
repeat(20)
begin 
$display("time=%d,clk=%b",$time,clk);
#1.67 clk=~clk;
end
end
endmodule

OUTPUT 
time=                   0,clk=0
time=                   2,clk=1
time=                   4,clk=0
time=                   6,clk=1
time=                   8,clk=0
time=                  10,clk=1
time=                  12,clk=0
time=                  14,clk=1
time=                  16,clk=0
time=                  18,clk=1
time=                  20,clk=0
time=                  22,clk=1
time=                  24,clk=0
time=                  26,clk=1
time=                  28,clk=0
time=                  30,clk=1
time=                  32,clk=0
time=                  34,clk=1
time=                  36,clk=0
time=                  38,clk=1
