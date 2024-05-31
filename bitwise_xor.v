/* 
 * Do not change Module name 
*/
module a(in,out);
input [7:0]in;
output out;
assign out= ^in;
endmodule

module test();
reg [7:0]in;
wire out;
a a1(in,out);
initial begin 
in=8'b10111010;
#5;
#10 $stop();
end
initial begin
$monitor("time=%0t,in=%b,out=%b",$time,in,out);
$dumpfile("adder_4bit.vcd");
$dumpvars();
 end
 endmodule

output
time=0,in=10111010,out=1
main.v:17: $stop called at 15 (1s)
