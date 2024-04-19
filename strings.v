module strings();
  reg [8*30:0] string1;
  reg [8*30:0] string2;
  reg [8*60:0] string3; // Increased size to accommodate both strings
  
  initial begin
    string1 = "whatsup sai";
    string2 = "whatsup megha";
    $sformat(string3, "%s%s", string1, string2); // Concatenate string1 and string2 into string3
    $display("%s\n", string3);
  end 
endmodule
