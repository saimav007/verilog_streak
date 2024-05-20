module tff(input in, input clk, input rst, output reg out);
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            out <= 0;
        end else if (in) begin
            out <= ~out;
        end
    end
endmodule

module syn_counter(input clk, input rst, output [2:0] q);
    wire q0, q1, q2;

    tff tff0(.in(1'b1), .clk(clk), .rst(rst), .out(q0));
    tff tff1(.in(q0), .clk(clk), .rst(rst), .out(q1));
    tff tff2(.in(q0 & q1), .clk(clk), .rst(rst), .out(q2));

    assign q = {q2, q1, q0};
endmodule

module test;
    reg clk, rst;
    wire [2:0] q;
    syn_counter s1(.clk(clk), .rst(rst), .q(q));

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1'b0;
        #5;
        rst = 1'b1;
        #200 $stop;
    end

    initial begin
        $monitor("time=%t, clk=%b, rst=%b, q=%b", $time, clk, rst, q);
        $dumpfile("jkff.vcd");
        $dumpvars(0, test);
    end
endmodule

output
VCD info: dumpfile jkff.vcd opened for output.
time=                   0, clk=0, rst=0, q=000
time=                   5, clk=1, rst=1, q=001
time=                  10, clk=0, rst=1, q=001
time=                  15, clk=1, rst=1, q=010
time=                  20, clk=0, rst=1, q=010
time=                  25, clk=1, rst=1, q=011
time=                  30, clk=0, rst=1, q=011
time=                  35, clk=1, rst=1, q=100
time=                  40, clk=0, rst=1, q=100
time=                  45, clk=1, rst=1, q=101
time=                  50, clk=0, rst=1, q=101
time=                  55, clk=1, rst=1, q=110
time=                  60, clk=0, rst=1, q=110
time=                  65, clk=1, rst=1, q=111
time=                  70, clk=0, rst=1, q=111
time=                  75, clk=1, rst=1, q=000
time=                  80, clk=0, rst=1, q=000
time=                  85, clk=1, rst=1, q=001
time=                  90, clk=0, rst=1, q=001
time=                  95, clk=1, rst=1, q=010
time=                 100, clk=0, rst=1, q=010
time=                 105, clk=1, rst=1, q=011
time=                 110, clk=0, rst=1, q=011
time=                 115, clk=1, rst=1, q=100
time=                 120, clk=0, rst=1, q=100
time=                 125, clk=1, rst=1, q=101
time=                 130, clk=0, rst=1, q=101
time=                 135, clk=1, rst=1, q=110
time=                 140, clk=0, rst=1, q=110
time=                 145, clk=1, rst=1, q=111
time=                 150, clk=0, rst=1, q=111
time=                 155, clk=1, rst=1, q=000
time=                 160, clk=0, rst=1, q=000
time=                 165, clk=1, rst=1, q=001
time=                 170, clk=0, rst=1, q=001
time=                 175, clk=1, rst=1, q=010
time=                 180, clk=0, rst=1, q=010
time=                 185, clk=1, rst=1, q=011
time=                 190, clk=0, rst=1, q=011
time=                 195, clk=1, rst=1, q=100
time=                 200, clk=0, rst=1, q=100
