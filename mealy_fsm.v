module mealy11011(in,clk,rst,out);
input in,clk,rst;
output reg out;
reg [3:0]state;
parameter s=0,s1=1,s11=2,s110=3,s1101=4;
always @(posedge clk)begin
if(rst)begin
state<=0;
out<=0;
end
else begin
case(state)
s:begin
state<=in?s1:s;
out<=0;
end

s1:begin
state<=in?s11:s;
out<=0;
end

s11:begin
state<=in?s11:s110;
out<=0;
end

s110:begin
state<=in?s1101:s;
out<=0;
end

s1101:begin
state<=in?s11:s;
out<=in?1:0;
end

default:begin
state<=s;
out<=0;
end
endcase 
end 
end
endmodule

module test();
reg in,clk,rst;
wire out;
mealy11011 DUT(.in(in),.clk(clk),.rst(rst),.out(out));
initial begin 
clk=0;
rst=1;
#15 rst=0;
end

initial forever begin 
#5 clk=~clk;
end

initial begin
#15; in=1;
#10 in=1; #10 in=0; #10 in=1; #10 in=1; #10 in=0; #10 in=1;#10 in=1; #10 in=0; #10 in=1; #10 in=1; #10 in=1;

#40 $finish;
end
initial begin
$monitor("time=%d,in=%b,clk=%b,rst=%b,out=%b,state=%d",$time,in,clk,rst,out,DUT.state);
     $dumpfile("mux81.vcd");
     $dumpvars();
 end
endmodule
