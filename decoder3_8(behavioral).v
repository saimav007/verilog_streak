module decoder(in,en,out);
input [2:0]in;
input en;
output reg [7:0]out;
always @(*) begin
if(en) begin
out<=8'b0;
end
else begin 
 out[0] = (~in[0]) & (~in[1]) & (~in[2]);
        out[1] = (~in[0]) & (~in[1]) & (in[2]);
        out[2] = (~in[0]) & (in[1]) & (~in[2]);
        out[3] = (~in[0]) & (in[1]) & (in[2]);
        out[4] = (in[0]) & (~in[1]) & (~in[2]);
        out[5] = (in[0]) & (~in[1]) & (in[2]);
        out[6] = (in[0]) & (in[1]) & (~in[2]);
        out[7] = (in[0]) & (in[1]) & (in[2]);
  end
  end
endmodule
module test();
reg [2:0]in;
reg en;
wire [7:0]out;
decoder d1(in,en,out);
initial begin 
en=1'b1;
#5;
en=1'b0;
#5;
in=3'b000;
#5;
in=3'b001;
#5;
in=3'b010;
#5;
in=3'b100;
#5;
in=3'b110;
#5;
in=3'b111;
#5;
in=3'b011;
#5;
in=3'b101;
#10 $stop();

end
initial begin
    $monitor("time=%0t, en=%b,in=%b,out=%b", $time,en,in,out);
    $dumpfile("adder_4bit.vcd");
    $dumpvars();
  end
endmodule
