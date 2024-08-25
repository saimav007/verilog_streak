module jkff(j,k,o,clk);
input j,k,clk;
output reg o;
always @(posedge clk)
begin 
if(clk==0)begin
o<=o;
end
else begin
if(j==0 && k==0)begin 
o<=o;
end
else if(j==0 && k==1)begin
o<=0;
end
else if(j==1 && k==0)begin
o<=1;
end
else if(j==1 && k==1)begin
o<=~o;
end
end
end
endmodule

//or 

module jkff(j,k,clk,out);
input j,k,clk;
output reg out;
always@(posedge clk)begin 
case({j,k})
2'b00: out=out;
2'b01: out=0;
2'b10: out=1;
2'b11: out=~out;
endcase
end
endmodule


module test();
reg j,k,clk;
wire o;
jkff a1(j,k,o,clk);
initial begin
clk=1'b0;
forever #10 clk =~clk;
end
initial begin 
#10;
j=1'b0;
k=1'b0;
#10;
j=1'b0;
k=1'b1;
#10;
j=1'b1;
k=1'b0;
#10;
j=1'b1;
k=1'b1;
#20 $stop();
end
initial begin
$monitor("time=%d,j=%b,k=%b,clk=%b,o=%b",$time,j,k,clk,o);
$dumpfile("jkff.vcd");
$dumpvars();
end
endmodule 
