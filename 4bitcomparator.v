module comparator(in1,in2,out);
input [3:0]in1,in2;
output [5:0]out;
assign out[0] = (in1 == in2);
assign out[1] = (in1 != in2);
assign out[2] = (in1 > in2);
assign out[3] = (in1 < in2);
assign out[4] = (in1 >= in2);
assign out[5] = (in1 <= in2);
endmodule

module test();
reg [3:0]in1,in2;
wire [5:0]out;
comparator c1(in1,in2,out);
initial begin 
in1=4'b0001;
in2=4'b0001;
#5;
in1=4'b0001;
in2=4'b0010;
#5;
in1=4'b0010;
in2=4'b0001;
#5;
in1=4'b0001;
in2=4'b0100;
#5;
in1=4'b0100;
in2=4'b0100;
#5;
in1=4'b0001;
in2=4'b0001;
#5;
#20 $stop();
end
initial begin
    $monitor("time=%0t,in1=%b,in2=%b,out=%b",$time,in1,in2,out);
    $dumpfile("adder_4bit.vcd");
    $dumpvars();
    #100 $finish;
  end
endmodule 

OUTPUT 
VCD info: dumpfile adder_4bit.vcd opened for output.
time=0,in1=0001,in2=0001,out=110001
time=5,in1=0001,in2=0010,out=101010
time=10,in1=0010,in2=0001,out=010110
time=15,in1=0001,in2=0100,out=101010
time=20,in1=0100,in2=0100,out=110001
time=25,in1=0001,in2=0001,out=110001
main.v:49: $stop called at 50 (1s)
** VVP Stop(0) **
** Flushing output streams.
** Current simulation time is 50 ticks.
