module mux21(a,b,c,d);
input a,b,c;
output d;
assign d=c?b:a;
endmodule

module mux31(in1,in2,in3,s1,s2,out);
input in1,in2,in3,s1,s2;
output out;
wire w1;
mux21 m1(in1,in2,s1,w1);
mux21 m2(w1,in3,s2,out);
endmodule

module mux29_1(inp,sel,outp);
input [28:0]inp;
input [7:0]sel;
output outp;
wire [12:0]w;
mux31 m3(inp[0],inp[1],inp[2],sel[0],sel[1],w[0]);
mux31 m4(inp[3],inp[4],inp[5],sel[0],sel[1],w[1]);
mux31 m5(inp[6],inp[7],inp[8],sel[0],sel[1],w[2]);
mux31 m6(inp[9],inp[10],inp[11],sel[0],sel[1],w[3]);
mux31 m7(inp[12],inp[13],inp[14],sel[0],sel[1],w[4]);
mux31 m8(inp[15],inp[16],inp[17],sel[0],sel[1],w[5]);
mux31 m9(inp[18],inp[19],inp[20],sel[0],sel[1],w[6]);

mux31 m10(w[0],w[1],inp[21],sel[2],sel[3],w[7]);
mux31 m11(w[2],w[3],inp[22],sel[2],sel[3],w[8]);
mux31 m12(w[4],w[5],inp[23],sel[2],sel[3],w[9]);
mux31 m13(w[6],inp[24],inp[25],sel[2],sel[3],w[10]);

mux31 m14(w[7],w[8],inp[26],sel[4],sel[5],w[11]);
mux31 m15(w[9],w[10],inp[27],sel[4],sel[5],w[12]);
mux31 m16(w[11],w[12],inp[28],sel[6],sel[7],outp);
endmodule

module test();
reg [28:0]inp;
reg [7:0]sel;
wire outp;
mux29_1 mm(inp,sel,outp); // when we dont instantiate output is given to high impedance by default
initial begin 
inp=29'b11100011100011100011100011100;
sel=8'b01011001;
#10;
inp=29'b11100010100011100011111110100;
sel=8'b01111111;
#10;
inp=29'b00000011100011100011100011111;
sel=8'b00001111;
#10;
inp=29'b01000001001111110111100011100;
sel=8'b11001111;
#10;
#20 $stop();
end
 initial begin 
 $monitor("time=%t,inp=%b,sel=%b,outp=%b",$time,inp,sel,outp);
 $dumpfile("jkff.vcd");
 $dumpvars();
 end
endmodule
