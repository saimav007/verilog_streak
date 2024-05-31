/* 
 * Do not change Module name 
*/
module a(clk,out);
input clk;
output reg out;
always @(posedge clk)begin 
out=0;
out<=1;
$display(out);
end
endmodule
module test();
reg clk;
wire out;
a a1(clk,out);
initial begin 
clk=1'b0;
#5;
clk=1;
#5;
clk=0;
#10 $stop();
end
endmodule

output 
0
//  blocking statement alots the value to the lhs immidiatrely after computation ...
// non blovking doesent 
