module fby2divider(clk,clk2,rst);
input clk,rst;
output reg clk2;
always @(posedge clk)begin
if(rst)begin
clk2<=0;
end
else begin 
clk2<=~clk2;
end
end
endmodule 

module test();
reg clk,rst;
wire clk2;
wire clk3;
fby2divider DUT(.clk(clk),.clk2(clk2),.rst(rst));
always #1 clk=~clk;
initial begin 
clk=1'b0;
rst=0;
#10;
rst=1;
#20;
rst=0;
#20
rst=0;
#50 $stop;
end

initial begin
  $monitor("time=%d,clk=%b,clk2=%b,rst=%b",$time,clk,clk2,rst);
  $dumpfile("upcounter.vcd");
  $dumpvars();
 end
endmodule
