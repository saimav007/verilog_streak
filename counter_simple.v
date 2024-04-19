module counter(clk,mode,load,rst,out,data);
input clk,mode,rst;
input load;
output reg [3:0]out;
output reg [3:0]data;
always @(posedge clk)begin
if(rst==0)begin 
out<=0;
end
else begin
if(load==1)begin
out<=data;
end
else if(mode==1)begin
out<=out+1;
end
else begin
out<=out-1;
end
end
endmodule

module test();
reg clk,mode,load,rst;
wire [3:0]out;
counter c1(clk,mode,load,rst,out);
initial begin 
clk=1'b0;
rst=1'b0;
forever #10 clk=~clk;
end
initial begin
rst=1'b1;
mode=1'b1;
#10;
rst=1'b0;
mode=1'b0;
#10;
rst=1'b1;
mode=1'b1;
#200 $stop();
end
 initial begin 
 $monitor("clk=%b,rst=%b,mode=%b,out=%b",clk,rst,mode,out);
 $dumpfile("jkff.vcd");
 $dumpvars();
 end
endmodule
