/* 
 * Do not change Module name 
*/
/* 
 * Do not change Module name --- 3 dflip flops(neg edge asyn reset) with one input x and other 2 inputs are outputs of previous 2 ffs. shortcut code
*/
module fsm(in,clk,rst,out);
input in,clk,rst;
output out;
reg [2:0] q,d;

always @(posedge clk or negedge rst)begin
if(!rst)begin
q<=0;
end
else begin 
q<=d;
end
end
always @(*)begin
d={in,q[2:1]};
end

assign out=(~q[0]) &(~q[1])&(~q[2]);
endmodule


module test();
reg in,clk,rst;
wire out;
// wire [2:0]q ,d;
fsm f1(in,clk,rst,out);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1'b0;
#5;
rst=1'b1;
#5;
in=1;
#5;
rst=1'b0;
#5;
in=1;
#5;
in=0;
#10 $stop();
end
initial begin
$monitor("time=%d,in=%b,clk=%b,rst=%b,out=%b",$time,in,clk,rst,out);
$dumpfile("fsm_moore.vcd");
$dumpvars();
end
endmodule

VCD info: dumpfile barrelshifter.vcd opened for output.
time=                   0,in=x,clk=0,rst=0,out=1
time=                   5,in=x,clk=1,rst=1,out=x
time=                  10,in=1,clk=0,rst=1,out=x
time=                  15,in=1,clk=1,rst=0,out=1
time=                  20,in=1,clk=0,rst=0,out=1
time=                  25,in=0,clk=1,rst=0,out=1
time=                  30,in=0,clk=0,rst=0,out=1
main.v:49: $stop called at 35 (1s)
** VVP Stop(0) **
** Flushing output streams.
** Current simulation time is 35 ticks.
