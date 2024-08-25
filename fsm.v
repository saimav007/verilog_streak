module mealy(clk,rst,in,out,ps,ns);
parameter reset=0,s0=1,s01=2,s011=3;
input clk,rst,in;
output reg [2:0]ps,ns;
output reg out;

always@(posedge clk)begin
if(rst)begin 
out<=0;
end
else begin 
ps<=ns;
end
end

always@(ps or in)begin
case(ps)

reset: begin 
ns<=in?reset:s0;
out<=0;
end

s0:begin
ns<=in? s01:s0;
out<=0;
end

s01:begin 
ns<=in? s011:s0;
out<=0;
end

s011:begin 
ns<=in?reset:s0;
out<=in?0:1;
end

default: begin 
ns<=reset;
out<=0;
end

endcase
end
endmodule

module test();
reg clk,rst,in;
wire out;
wire [2:0]ps,ns;
mealy m1(clk,rst,in,out,ps,ns);
initial begin
 clk=0;
 forever #5 clk=~clk;
 end
 
 initial begin
#10;
 rst=0;
 #5;
 in=1;
 #5;
  in=0;
 #5;
  in=0;
 #5;
  in=1;
 #5;
  in=1;
 #5;
  in=0;
 #5;
  in=1;
 #5;
  in=1;
 #5;
  in=0;
 #5;
  in=1;
 #5;
  in=0;
 #5;
  in=1;
 #5;
  in=1;
 #5;
  in=0;
 #5;
 #20 $stop();
 end
 
 initial begin
 $monitor("time=%t, clk=%d,rst=%d,in=%d,ps=%d,ns=%d,out=%d",$time,clk,rst,in,ps,ns,out);
 $dumpfile("mealy.vcd");
 $dumpvars();
 end
 
 endmodule
 
