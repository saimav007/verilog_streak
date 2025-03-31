module adder_4bit(a, b, sum, cout);
  output [3:0] sum;
  output cout;

  input [3:0] a;
  input [3:0] b;

  wire [2:0] s;

  full_adder u0(a[0], b[0], 1'b0, sum[0], s[0]);
  full_adder u1(a[1], b[1], s[0], sum[1], s[1]);
  full_adder u2(a[2], b[2], s[1], sum[2], s[2]);
  full_adder u3(a[3], b[3], s[2], sum[3], cout);
endmodule

module full_adder(a, b, cin, sum, cout);
  output sum;
  output cout;

  input a;
  input b;
  input cin;

  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);
endmodule


module adder_4bit(a, b, cin, s, cout);
  input [3:0] a;
  input [3:0] b;
  input cin;
  output reg [3:0] s;
  output reg cout;

  reg [3:0] w;
  integer i;

  always @(*)
  begin
    s[0] = a[0] ^ b[0] ^ cin;
    w[0] = a[0] & b[0] | b[0] & cin | a[0] & cin;

    for (i = 0; i < 3; i = i + 1)
    begin
      s[i + 1] = a[i + 1] ^ b[i + 1] ^ w[i];
      w[i + 1] = a[i + 1] & b[i + 1] | b[i + 1] & w[i] | a[i + 1] & w[i];
    end

    cout = w[3];
  end
endmodule

module test();
  reg [3:0] a;
  reg [3:0] b;
  reg cin; 
  wire [3:0] s;
  wire cout;

  adder_4bit DUT (.a(a), .b(b), .cin(cin), .s(s), .cout(cout));

  initial begin
    a = 4'b1011;
    b = 4'b0110;
    cin = 1'b1;
    #10;
    a = 4'b1111;
    b = 4'b0010;
    cin = 1'b0;
    #10;
    a = 4'b1110;
    b = 4'b0110;
    cin = 1'b1;
    #10;
    a = 4'b0001;
    b = 4'b0110;
    cin = 1'b0;
    #10;
  end

  initial begin
    $monitor("time=%0t, A=%b, B=%b ,CIN=%b, SUM=%b, COUT=%b", $time, a, b, cin, s, cout);
    $dumpfile("adder_4bit.vcd");
    $dumpvars();
    #200 $finish;
  end
endmodule
