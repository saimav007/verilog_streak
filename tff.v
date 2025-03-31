module tff(t,clk,rst,q);
input t,clk,rst;
output reg q;
always @(posedge clk) begin
if(rst==1)begin
q<=0;
end
else if(t==0)begin
q<=q;
end
else begin
q<=~q;
end
end
endmodule

module test();
reg t,clk,rst;
wire q;
tff t1(t,clk,rst,q);
initial begin
clk=1'b0;
forever #10 clk=~clk;
end
initial begin
rst=1'b1;
#10;
t=1'b0;
#10;
t=1'b0;
rst=1'b0;
#10;
t=1'b0;
#10;
t=1'b1;
#10;
t=1'b1;
#10;
t=1'b1;
#10;
t=1'b0;
#10;
t=1'b1;
#10;
#50 $stop();
end
 initial begin 
 $monitor("time=%t,t=%b,clk=%b,rst=%b,q=%b",$time,t,clk,rst,q);
 $dumpfile("jkff.vcd");
 $dumpvars();
 end
endmodule
