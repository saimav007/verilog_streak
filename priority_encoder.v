module priorityencoder(y,a);
input [3:0]y;
output reg [1:0]a;
always @(*)begin 
if(y[0]==1'b1 || y[1]==1'b1 || y[2]==1'b1 || y[3]==1'b1)begin
a[1]=y[2]|y[3];
a[0]=y[1]&(~y[2]) | y[3];
end
else begin
$monitor("priority not given to any bit");
end
end
endmodule
module test();
reg [3:0]y;
wire [1:0]a;
priorityencoder DUT(.y(y),.a(a));
initial begin
#10;
y=4'b0001;
#10;
y=4'b0011;
#10;
y=4'b1011;
#10;
y=4'b0101;
#10;
y=4'b1111;
#10;
y=4'b1001;
#10;
y=4'b0000;
#10;
end 
initial begin
$monitor("time=%d,y=%b,a=%b",$time,y,a);
$dumpfile("decimaltoBCD.vcd");
$dumpvars();
end
endmodule
