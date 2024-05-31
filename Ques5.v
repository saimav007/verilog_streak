Q30) What is “OUT” if the wire “sel” is X(unknown)?
always@(sel) begin
if(sel)
OUT <= 1;
else
OUT <= 0;
end

soln 
out =0

Q2) The above code is compressed to a single line code as follows:
always@(sel)
OUT <= sel;
Is there any difference between the two verilog codes?

out: 
Both the codes are not same. In the first code, the OUT will get either 0 or 1 always
even if sel is unknown(X). But in the second code sel is passed to OUT as it is, so if sel is
X, OUT will also be X. However, this matters only in simulations.
