module barrelshifter(in,n,lr,out);
input [7:0] in;
input [2:0]n;
input lr;
output reg [7:0]out;
always @(*)begin
if(lr) begin
out= in << n;
end
else begin
out=in >> n;
end
end
endmodule
module test();
reg [7:0] in;
reg [2:0]n;
reg lr;
wire [7:0]out;
barrelshifter DUT(.in(in),.n(n),.lr(lr),.out(out));
initial begin 
#10;
in=8'b10110100;n=3'b011;lr=1'b1;
#10;
in=8'b10110100;n=3'b001;lr=1'b0;
#10;
in=8'b10110100;n=3'b010;lr=1'b1;
#10;
in=8'b10110100;n=3'b100;lr=1'b0;
end
initial begin
$monitor("time=%d,in=%b,n=%b,lr=%b,out=%b",$time,in,n,lr,out);
$dumpfile("barrelshifter.vcd");
$dumpvars();
end
endmodule
