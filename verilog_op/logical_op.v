module logical_op(input[3:0]a,b,output reg lo_and,lo_or,not_a,not_b);
  always@(*)begin
    if(a&&b)
      lo_and=1;
    else
      lo_and=0;
    if(a||b)
      lo_or=1;
    else
      lo_or=0;
    if(!a)
      not_a=1;
    else 
      not_a=0;
    if(!b)
      not_b=1;
    else
      not_b=0;
  end
endmodule 

module tb_logical();
  reg[3:0]a,b;
  wire lo_and,lo_or,not_a,not_b;
  
  logical_op dut(.a(a),
                 .b(b),
                 .lo_and(lo_and),
                 .lo_or(lo_or),
                 .not_a(not_a),
                 .not_b(not_b));
  
  initial begin  $monitor("Time:%0t,a=%d,b=%d,lo_and=%b,lo_or=%b,not_a=%b,not_b=%b",$time,a,b,lo_and,lo_or,not_a,not_b);               
    a = 4'd1; b = 4'd7; #10;
    a = 4'd5; b = 4'd1; #10;
    a = 4'd0; b = 4'd0; #10;
    a = 4'd8; b = 4'd3; #10;
    end 
   
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0,tb_logical);
    end
endmodule 