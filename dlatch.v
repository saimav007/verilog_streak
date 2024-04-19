module dlatch(clk,d,q,rst);
input clk,d,rst;
output reg q;
always @(posedge clk, negedge rst)begin
if(rst==0)begin
q<=0;
end
else begin
q<=~d;
end
end
endmodule
module test();
reg clk,d,rst;
wire q;
dlatch d1(clk,d,q,rst);
initial begin
clk=1'b0;
forever #10 clk=~clk;
end
initial begin
#10;
rst=1'b1;
d=1'b0;
#10;
rst=1'b0;
d=1'b0;
#10;
rst=1'b1;
d=1'b0;
#10;
d=1'b1;
#10;
d=1'b0;
#20 $stop();
end
initial begin 
 $monitor("time=%d,clk=%b,rst=%b,d=%b,q=%b",$time,clk,rst,d,q);
 $dumpfile("jkff.vcd");
 $dumpvars();
 end
 endmodule
