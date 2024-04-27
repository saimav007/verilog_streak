module octal_to_binary(in,out);
input [7:0]in;
output reg [2:0]out;
always @(*)begin
out[2]=in[7]| in[6]|in[5]|in[4];
out[1]=in[7]|in[6]|in[3]|in[2];
out[0]=in[7]|in[5]|in[3]|in[1];
end
endmodule
module test();
reg [7:0]in;
wire [2:0]out;
octal_to_binary e1(in,out);
initial begin 
in=8'b00000000;
#5;
in=8'b00000001;
#5;
in=8'b00000010;
#5;
in=8'b00000100;
#5;
in=8'b00001000;
#5;
in=8'b00010000;
#5;
in=8'b00100000;
#5;
in=8'b01000000;
#5;
in=8'b10000000;
#5;
#10 $stop();
end
initial begin
    $monitor("time=%0t, in=%b,out=%b", $time,in,out);
    $dumpfile("adder_4bit.vcd");
    $dumpvars();
  end
endmodule

OUTPUT 
VCD info: dumpfile adder_4bit.vcd opened for output.
time=0, in=00000000,out=000
time=5, in=00000001,out=000
time=10, in=00000010,out=001
time=15, in=00000100,out=010
time=20, in=00001000,out=011
time=25, in=00010000,out=100
time=30, in=00100000,out=101
time=35, in=01000000,out=110
time=40, in=10000000,out=111
main.v:152: $stop called at 55 (1s)
