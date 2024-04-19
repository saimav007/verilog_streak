module mux81(a,s,o);
input [7:0] a;
input [2:0] s;
output o;
wire x,y,z,q,u,l;

mux m1(a[0],a[1],s[2],x);
mux m2(a[2],a[3],s[2],y);
mux m3(a[4],a[5],s[2],z);
mux m4(a[6],a[7],s[2],q);
mux m5(x,y,s[1],u);
mux m6(z,q,s[1],l);
mux m7(u,l,s[0],o);

endmodule

module mux(e,f,d,j);
input e,f;
input d;
output j;

assign j= d ? f:e ;
endmodule

module test();
reg [7:0] a;
reg [2:0] s;
wire o;


mux81 DUT (.a(a),.s(s),.o(o));
initial begin 
#10;
a=8'b10010011;
s=3'b101;
#10;
a=8'b11111000;
s=3'b111;
#10;
a=8'b10101010;
s=3'b100;
#10;
a=8'b11111111;
s=3'b001;
#10;
a=8'b1101001;
s=3'b001;
#10;
a=8'b01101001;
s=3'b011;
end 

initial begin
$monitor("time=%0t, A=%b, S=%b ,OUTPUT=%b", $time, a, s, o);
     $dumpfile("mux81.vcd");
     $dumpvars();
end
endmodule
