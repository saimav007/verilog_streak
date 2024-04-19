module dualedgeff(clk,d,q);
input clk,d;
output q;
reg q1,q2;
assign q=clk? q1:q2;
always @(posedge clk)begin
q1<=d;
end
always @(negedge clk)begin
q2<=d;
end
endmodule

module test();
reg clk,d;
wire q;
dualedgeff DUT(.clk(clk),.d(d),.q(q));
initial clk=0;
always #5 clk=~clk;
initial d=1'b0;
always #10; d=~d;

#50 $stop;
end
initial begin 
 $monitor("time=%d,clk=%b,d=%b,q=%b",$time,clk,d,q);
  $dumpfile("upcounter.vcd");
   $dumpvars();
  end
endmodule
