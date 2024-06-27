there are diff ways of prinitng in verilog

1) $ display - prints the value and puts a new line charachter in the end due to which a new statement is started in a new line.
2) $write - prints the value without any newline charachter.
3) $strobe vs $display - strobe prints the final value considering all the previous delays without needing any specific pre-delay for accurate printing. If a pre-delay before $display is not used then it does not consoder
  the modified values and prints the old value itself.

  Eg 
  module tb;
    reg [7:0] a;
    reg [7:0] b;

    initial begin 
        a = 8'h2D;
        b = 8'h2D;
        #10;
        b <= a + 1;
        $display("time=%0t a=%h b=%h", $time, a, b);
        $strobe("time=%0t a=%h b=%h", $time, a, b);
    end
endmodule

output :
time=10 a=2d b=2d
time=10 a=2d b=2e



format specifiers 

%h, %H	Display in hexadecimal format
%d, %D	Display in decimal format
%b, %B	Display in binary format
%m, %M	Display hierarchical name
%s, %S	Display as a string
%t, %T	Display in time format
%f, %F	Display 'real' in a decimal format
%e, %E	Display 'real' in an exponential format

module tb;
    reg [7:0] a;
    reg [7:0] b;

    initial begin 
        a = 8'h2A;
        b = 8'h2A;
        #10;
        b <= a + 1;
        $display("time=%0t a=%e b=%f", $time, a, b);
        $strobe("time=%0t a=%s b=%b", $time, a, b);
    end
endmodule

output:
time=10 a=4.200000e+01 b=42.000000
time=10 a=* b=00101011
