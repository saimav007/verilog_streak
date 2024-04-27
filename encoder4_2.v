module encoder4_2(in,out);
input [3:0]in;
output reg [1:0]out;
always @(*)begin
out[1]=in[3]| in[2];
out[0]=in[3]|in[1];
end
endmodule
module test();
reg [3:0]in;
wire [1:0]out;
encoder4_2 e1(in,out);
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
time=0, in=0000,out=00
time=5, in=0001,out=00
time=10, in=0010,out=01
time=15, in=0100,out=10
time=20, in=1000,out=11
main.v:143: $stop called at 35 (1s)
  
