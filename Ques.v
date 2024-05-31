
wire [5:0] in;
wire [5:0] out = {in[3:0],2’b0};
wire [5:0] out1 = {2’b0,in[5:3]};
(a) What is the name of the operator used in the above verilog code?
(b) What is the relation between (i) in and out (ii) in and out1?


/* 
 * Do not change Module name 
*/
module a(in,out,out1);
input [5:0]in;
output [5:0]out;
output [5:0]out1;
assign out= {in[3:0],2'b0};
assign out1= {2'b0,in[5:3]};
endmodule

module test();
reg [5:0]in;
wire [5:0]out;
wire [5:0]out1;
a a1(in,out,out1);
initial begin 
in=6'b001000;
#5;
#10 $stop();
end
initial begin
$monitor("time=%0t,in=%b,out=%b,out1=%b",$time,in,out,out1);
$dumpfile("adder_4bit.vcd");
$dumpvars();
end
endmodule

output 
time=0,in=001000,out=100000,out1=000001
main.v:20: $stop called at 15 (1s)
