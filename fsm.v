module mealy11011(in,clk,rst,out,ps,ns);
input in,clk,rst;
output reg out,ps,ns;
parameter s=0,s1=1,s11=2,s110=3,s1101=4,s11011=5;
always @(posedge clk)begin
if(rst)begin
out<=0;
end
else begin
case(ps)

s:begin
ns<=in?s1:s;
out<=0;
end

s1:begin
ns<=in?s11:s;
out<=0;
end

s11:begin
ns<=in?s11:s110;
out<=0;
end

s110:begin
ns<=in?s1101:s;
out<=0;
end

s1101:begin
ns<=in?s11:s;
out<=0;
end

default:begin
ns<=s;
out<=0;
end

endcase 
end 
end

endmodule

module test();
reg in,clk,rst;
wire out,ps,ns;
mealy11011 DUT(.in(in),.clk(clk),.rst(rst),.out(out),.ps(ps),.ns(ns));
initial begin 
clk=0;
forever#2  clk=~clk;
end
initial begin
rst=1;
#10;
rst=0;
#10
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
# 100 $stop;
end
initial begin
$monitor("time=%d,in=%b,clk=%b,rst=%b,ps=%b,ns=%b,out=%b",$time,in,clk,rst,ps,ns,out);
     $dumpfile("mux81.vcd");
     $dumpvars();
 end
 
 endmodule
