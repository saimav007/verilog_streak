/* 
 * Do not change Module name 
*/
module gcd(a, b, c);
    input [3:0] a;
    input [3:0] b;
    output reg [3:0] c;
    
    reg [3:0] a_reg, b_reg;
    
    always @(*) begin
        a_reg = a;
        b_reg = b;
        
        while (a_reg != 0 && b_reg != 0) begin
            if (a_reg > b_reg) 
                a_reg = a_reg - b_reg;
            else 
                b_reg = b_reg - a_reg;
        end
        
        if (a_reg == 0)
            c = b_reg;
        else
            c = a_reg;
    end
endmodule

module test();
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] c;
    
    gcd g1(a, b, c);
    
    initial begin 
        #5;
        a = 4'b1000; // 8
        b = 4'b0110; // 6
        #5;
               #5;
        a = 4'b1111; // 8
        b = 4'b0111; // 6
        #5;
    end
    
    initial begin
        $monitor("time=%d, a=%d, b=%d, c=%d", $time, a, b, c);
        $dumpfile("gcd.vcd");
        $dumpvars();
    end
endmodule
