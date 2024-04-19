module usr(po,so,pi,sel,clk,rst,si);
input [1:0]sel;
input [4:0] pi;
input clk,rst,si;
output reg [4:0]po;
output so;
always @(posedge clk)begin
if(rst)
po<=5'b0;
else begin
case(sel)
2'b00: po<= po;
2'b01: po<= {pi[3:0],si};
2'b10: po<= {si,pi[4:1]};
2'b11: po<= pi;
default :po<=0;
endcase
end
end
assign so = (sel==2'b01) ? po[4]:po[0];
endmodule
module test();
reg [1:0]sel;
reg [4:0] pi;
reg clk,rst,si;
wire [4:0]po;
wire so;
usr DUT(.po(po),.so(so),.pi(pi),.sel(sel),.clk(clk),.rst(rst),.si(si));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
#10;
rst=1'b0;
pi<=5'b11010;
sel<=2'b00;
si<=1'b1;
#10;
sel<=2'b01;
#10;
sel<=2'b10;
#10;
sel<=2'b11;
#10;
rst=1'b0;
sel<=2'b01;
#10;
sel<=2'b11;
#10;
rst=1'b0;
sel<=2'b10;
end
initial begin 
$monitor("time=%d,po=%b,so=%b,pi=%b,sel=%b,clk=%b,rst=%b,si=%b",$time,po,so,pi,sel,clk,rst,si);
$dumpfile("usr.vcd");
$dumpvars();
end
initial #100 $finish;
endmodule
