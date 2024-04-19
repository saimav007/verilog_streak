module ring_counter(
    Clock,
    Reset,
    Count_out
    );
    input Clock;
    input Reset;
    output [3:0] Count_out;
    reg [3:0] Count_temp
    always @(posedge(Clock),Reset)
    begin
        if(Reset == 1'b1)   begin  
            Count_temp = 4'b0001;   end  //The Count value is reset to "0001".
        else if(Clock == 1'b1)  begin  //When the Clock is high
            //Left shift the Count value.
            Count_temp = {Count_temp[2:0],Count_temp[3]};   end 
    end
    
    //The Count value is assigned to final output port.
    assign Count_out = Count_temp;
    
endmodule

module tb_ring;
    reg Clock;
    reg Reset;
    wire [3:0] Count_out;
    ring_counter uut (
        .Clock(Clock), 
        .Reset(Reset), 
        .Count_out(Count_out)
    );

    initial Clock = 0; 
    always #2 Clock = ~Clock; 

    initial begin
        Reset = 1; 
        #50;       
        Reset = 0; 
    end
initial begin 
$monitor("time=%d,clk=%b,rst=%b,count=%b",$time,Clock,Reset,Count_out);
$dumpfile("upcounter.vcd");
 $dumpvars();
end
 initial   #100 $finish;
endmodule
