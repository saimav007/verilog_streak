16) What is the period of “clk” in the following verilog code?
`timescale 10 ns / 1 ps
reg clk;
initial clk = 0;
always #5 clk = ~clk;

period =2*5*10ns = 100ns
