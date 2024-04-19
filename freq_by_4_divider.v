module fby4divider(clka,clkb,reset);
input clka;
input clkb;
output reg reset;
wire x,y;
always @ (posedge clk)begin
fby2divider f1(clka,x,reset);
fby2divider f2(x,clkb,reset);
end
endmodule
module test();
reg clka,reset;
wire clkb;
fby4divider DUT(.clka(clka),.clkb(clkb),.reset(reset));
always #5 clka=~clka;
initial begin
clka=1'b0;
rst=0;
#10;
rst=1;
#20;
rst=0;
#20;
rst=1;
#100 $stop;
end
initial begin
 $monitor("time=%d,clk=%b,clk2=%b,rst=%b",$time,clk,clk2,rst);
 $dumpfile("upcounter.vcd");
  $dumpvars();
 end
endmodule
