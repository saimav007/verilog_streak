/* 
 * Do not change Module name 
*/
module swap_with_temp(a, b,a_out,b_out);
    input [3:0] a, b;
    output reg [3:0] a_out, b_out;
    // reg [3:0]a_new;
    always @(*) begin
     a_out=a+b;
     b_out=a_out-b;
     a_out=a_out-b_out;
    end
endmodule

module test();
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] a_out;
    wire [3:0] b_out;
    swap_with_temp s1(a, b, a_out, b_out);
    initial begin 
        a = 4'b1001; // 9
        b = 4'b0111; // 7
        #5;
    end
    initial begin
        $monitor("time=%d, a=%d, b=%d, a_out=%d, b_out=%d", $time, a, b, a_out, b_out);
        $dumpfile("swap.vcd");
        $dumpvars();
    end
endmodule
