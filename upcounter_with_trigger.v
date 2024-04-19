module upcounter(trigger,data,load,count,clk,rst);
input [7:0]data;
input clk,rst,load,trigger;
output [7:0]count;
reg [7:0]temp;

always @ (posedge clk)begin
if(!rst)begin 
temp<=8'd0;
end
else if(load)begin 
temp<=data;
end
else if(trigger)begin
temp<=temp+1;
end
else begin
temp<=temp-1;
end
end
assign count=temp;
endmodule

module test();
reg [7:0]data;
reg clk,rst,load,trigger;
wire [7:0]count;

upcounter DUT(.trigger(trigger),.data(data),.load(load),.count(count),.clk(clk),.rst(rst));

always #5 clk=~clk;

initial begin
data<=8'b00101101;
load=1;
clk=0;
rst=1;
trigger=1;
#10;
load=0;
#10;
load=0;
#10;
rst=1;
load=0;
#10;
rst=1;
load=0;
#50;
load=0;
trigger=0;
#100 $stop;
end

initial begin
$monitor("time=%d,trigger=%b,data=%b,load=%b,count=%b,clk=%b,rst=%b",$time,trigger,data,load,count,clk,rst);
$dumpfile("upcounter.vcd");
$dumpvars();
end
endmodule
