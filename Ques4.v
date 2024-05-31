Q29) Is there any problem in the following code: (a) For simulations (b) For synthesis
and for post synthesis
always @(cntrl,a,b)
begin
if(cntrl)
a <= b;
end

soln 
(a) There is no error or problem in the code for simulations.
(b) But as it forms the latch, it may create problem at later stages of the design.
Ideal design should not have code which forms this type of latches.
