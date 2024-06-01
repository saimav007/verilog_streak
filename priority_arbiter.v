/* 
 * Do not change Module name 
*/
module priority_arbiter #(parameter N=4)(in,out);
input [N-1:0]in;
output [N-1:0]out;
assign out[0]=in[0];
genvar i;
for(i=1;i<N;i=i+1)begin 
assign out[i]=in[i] & ~(|(out[i-1:0]));
end
endmodule

module test();
parameter N=4;
reg [N-1:0]in;
wire [N-1:0]out;
integer i;
priority_arbiter p1(in,out);
initial begin 
in=4'b0000;
#5;
in=4'b0001;
#5;
in=4'b0010;
#5;
in=4'b0100;
#5;
in=4'b1000;
#5;
in=4'b0101;
#5;
in=4'b1011;
#5;
in=4'b1111;
#5;
in=4'b1100;
#5;
#100 $stop();
end
initial begin 
$monitor("time=%d,in=%b,out=%b",$time,in,out);
$dumpfile("barrelshifter.vcd");
$dumpvars();
end
endmodule 

output 
VCD info: dumpfile barrelshifter.vcd opened for output.
time=                   0,in=0000,out=0000
time=                   5,in=0001,out=0001
time=                  10,in=0010,out=0010
time=                  15,in=0100,out=0100
time=                  20,in=1000,out=1000
time=                  25,in=0101,out=0001
time=                  30,in=1011,out=0001
time=                  35,in=1111,out=0001
time=                  40,in=1100,out=0100
main.v:39: $stop called at 145 (1s)
  
