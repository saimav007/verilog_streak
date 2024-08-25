/* 
 * Do not change Module name 
*/
module a(clk,out);
input clk;
output reg [1:0]out;
always @(posedge clk)begin 
out=0;
out<=1;
out<=2;
out<=3;
end
endmodule

module test();
reg clk;
wire [1:0]out;
a a1(clk,out);
initial begin 
clk=1'b0;
#5;
clk=1;
#5;
clk=0;
#5;
clk=1;
#5;
clk=0;

#10 $stop();
end
initial begin 
$monitor("time=%t, clk=%d, out=%d",$time,clk,out);
$dumpfile("a.vcd");
$dumpvars();
end
endmodule


VCD info: dumpfile a.vcd opened for output.
time=                   0, clk=0, out=x
time=                   5, clk=1, out=3
time=                  10, clk=0, out=3
time=                  15, clk=1, out=3
time=                  20, clk=0, out=3
main.v:175: $stop called at 30 (1s)
** VVP Stop(0) **
** Flushing output streams.
** Current simulation time is 30 ticks.
> 
  
