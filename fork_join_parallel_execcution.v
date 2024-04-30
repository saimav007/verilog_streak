module fork_join();
reg x,y;
reg [1:0]z,w;
initial begin 
x=1'b0;
#5 y=1'b1;
fork 
#10 z={x,y};
#20 w={y,x};
join
#2 x=1;
end
initial begin
$monitor("time=%d,x=%b,y=%b,z=%b,w=%b",$time,x,y,z,w);
$dumpfile("fsm_moore.vcd");
$dumpvars();
end
endmodule

OUTPUT
VCD info: dumpfile fsm_moore.vcd opened for output.
time=                   0,x=0,y=x,z=xx,w=xx
time=                   5,x=0,y=1,z=xx,w=xx
time=                  15,x=0,y=1,z=01,w=xx
time=                  25,x=0,y=1,z=01,w=10
time=                  27,x=1,y=1,z=01,w=10
