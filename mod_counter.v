module modcounter(data,load,clk,rst,count);
input [7:0]data;
input clk,rst,load;
output [7:0]count;
reg [7:0]temp;
reg [7:0]temp2;
always @(posedge clk)begin 
if(!rst | temp<8'd10)begin
temp<=8'd10;
end
else if(load)begin 
temp<=data;
end
else if(temp<8'd98)begin 
temp<=temp+1;
temp2<=temp;
end
else if(temp2>8'b10)begin
temp2<=temp2-1;
temp<=temp2;
end
end
assign count=temp;
endmodule

module test();
reg [7:0]data;
reg clk,rst,load;
wire [7:0] count;
modcounter DUT(.data(data),.load(load),.clk(clk),.rst(rst),.count(count));
always #1 clk=~clk;
initial begin 
data=8'b00001110;
load=1;
clk=0;
rst=0;
#5;
rst=1;
#10;
load=0;
#400 $stop;
end
initial begin
 $monitor("time=%d,data=%b,load=%b,clk=%b,rst=%b,count=%b",$time,data,load,clk,rst,count);
 $dumpfile("upcounter.vcd");
 $dumpvars();
 end
 endmodule
