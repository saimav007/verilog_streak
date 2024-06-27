module takingand(in1,in2,out);
input in1,in2;
output out;
assign out=in1 & in2;
endmodule

module generateblockuse(a,b,out);
parameter n=5;
input [n-1:0]a,b;
output [n-1:0]out;
genvar i;
generate 
for(i=0;i<n;i=i+1)begin
takingand t1(a[i],b[i],out[i]);
end
endgenerate
// $display("out=%b,a=%b,b=%b",out,a,b);
endmodule

module test();
parameter n=5;
reg [n-1:0]a,b;
wire [n-1:0]out;
generateblockuse g1(a,b,out);
initial begin 
a=0;
b=0;
#5;
a=5'b10010;b=5'b00111;
#5;
a=5'b1110;b=5'b11111;
#5;
a=5'b00000;b=5'b00111;
#5;
a=5'b10110;b=5'b11000;
#5 $stop();
end
initial begin 
 $monitor("time=%d,a=%b,b=%b,out=%b",$time,a,b,out);
 $dumpfile("jkff.vcd");
 $dumpvars();
 end
 endmodule 

time=                   0,a=00000,b=00000,out=00000
time=                   5,a=10010,b=00111,out=00010
time=                  10,a=01110,b=11111,out=01110
time=                  15,a=00000,b=00111,out=00000
time=                  20,a=10110,b=11000,out=10000
main.v:39: $stop called at 25 (1s)
** VVP Stop(0) **
** Flushing output streams.
** Current simulation time is 25 ticks.
