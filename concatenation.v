 module sample(in1,in2,out);
 input [2:0]in1;
 input [4:0]in2;
 output [7:0]out;
 assign out={in1,in2};
 endmodule
 module test();
 reg [2:0]in1;
 reg [4:0]in2;
 wire [7:0]out;
 sample s1(in1,in2,out);
 initial begin 
 in1=3'b001;
 in2=5'b10101;
 end
 initial begin 
  $monitor("in1=%b,in2=%b,out=%b",in1,in2,out);
 $dumpfile("jkff.vcd");
 $dumpvars();
 end
 endmodule
