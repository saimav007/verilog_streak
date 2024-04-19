module divider(clk,rst,count);
input clk,rst;
output [7:0]count;
reg [7:0] temp;
always @(posedge clk)begin
if(rst)begin
temp<=8'b10000000;
end
else begin
temp<= {temp[0],temp[7:1]};
end
end
assign count=temp;
endmodule

module test();
reg clk,rst;
wire [7:0] count;
divider DUT (.clk(clk),.rst(rst),.count(count));
initial clk=0;
always #2 clk=~clk;
initial begin
rst=1;
#10;
rst=0;
#100 $stop;
end
 initial begin
 $monitor("time=%d,clk=%b,rst=%b,count=%b",$time,clk,rst,count);
  $dumpfile("upcounter.vcd");
  $dumpvars();
 end
 endmodule
