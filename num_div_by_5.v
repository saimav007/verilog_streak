/* 
 * Do not change Module name 
*/
// to shift an input number ot left by one bit and incoming bit goes to lsb, check f the number is divisible by 5

module div_by_five(input clk,rst,lsb_bit,output div_by_five_out);
reg [2:0]present_state,next_state;
parameter ZERO=0,ONE=1,TWO=2,THREE=3,FOUR=4,FIVE=5;

always@(posedge clk)begin 
if(rst==0)begin 
next_state<=0;
end
else begin
present_state<=next_state;
end
end

always@(*)begin 
case(present_state)
ZERO: begin 
next_state<=lsb_bit?ONE:ZERO;
end
ONE: begin 
next_state<=lsb_bit?THREE:TWO;
end
TWO: begin 
next_state<=lsb_bit?FIVE:FOUR;
end
THREE: begin 
next_state<=lsb_bit?TWO:ONE;
end
FOUR: begin 
next_state<=lsb_bit?FOUR:THREE;
end
FIVE: begin 
next_state<=lsb_bit?THREE:TWO;
end
default begin 
next_state<=ZERO;
end
endcase
end

assign div_by_five_out=(next_state==FIVE);

endmodule

module test;
reg  clk,rst,lsb_bit;
wire div_by_five_out;
div_by_five m1(clk,rst,lsb_bit,div_by_five_out);

initial begin
 clk=0;
 forever #5 clk=~clk;
end
 
initial begin 
rst=0;
#10;
rst=1;
#5;
lsb_bit=1;
#5;
lsb_bit=1;
#5;
lsb_bit=1;
#5;
lsb_bit=0;
#5;
lsb_bit=1;
#5;
lsb_bit=0;
#5;
lsb_bit=1;
#5;
lsb_bit=0;
#5;
lsb_bit=1;
#5;
#20 $finish;
end

initial begin
 $monitor("time=%t, clk=%d,rst=%d,lsb_bit=%d,div_by_five_out=%d",$time,clk,rst,lsb_bit,div_by_five_out);
 $dumpfile("sample.vcd");
 $dumpvars();
 end
 endmodule
 
