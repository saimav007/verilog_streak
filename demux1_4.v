module demux1_4(in,sel,out,en);
input in,en;
input [1:0]sel;
output reg [3:0]out;
always @(*) begin
if(en)begin
out=0;
end
else if(sel==2'b00)begin
out[0]=in;
end
else if(sel==2'b01)begin
out[1]=in;
end
else if(sel==2'b10)begin
out[2]=in;
end
else if(sel==2'b11)begin
out[3]=in;
end
end
endmodule
module test();
reg in,en;
reg [1:0]sel;
wire [3:0]out;
demux1_4 d1(in,sel,out,en);
initial begin
en=1;
#5;
en=0;
in=1'b1;
sel=2'b00;
#5;
en=1;
#5;
en=0;
in=1'b1;
sel=2'b10;
#5;
en=1;
#5;
en=0;
in=1'b1;
sel=2'b11;
#5;
en=1;
#5;
en=0;
in=1'b1;
sel=2'b01;
#5;
#10 $stop();
end
initial begin
    $monitor("time=%0t, in=%b,sel=%b,out=%b,en=%b", $time,in,sel,out,en);
    $dumpfile("adder_4bit.vcd");
    $dumpvars();
  end
endmodule


OUTPUT 
VCD info: dumpfile adder_4bit.vcd opened for output.
time=0, in=x,sel=xx,out=0000,en=1
time=5, in=1,sel=00,out=0001,en=0
time=10, in=1,sel=00,out=0000,en=1
time=15, in=1,sel=10,out=0100,en=0
time=20, in=1,sel=10,out=0000,en=1
time=25, in=1,sel=11,out=1000,en=0
time=30, in=1,sel=11,out=0000,en=1
time=35, in=1,sel=01,out=0010,en=0
main.v:111: $stop called at 50 (1s)
