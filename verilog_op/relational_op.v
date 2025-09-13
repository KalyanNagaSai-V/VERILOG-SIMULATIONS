module relational_op(input[3:0]a,b,output reg gre,less,eq,leq,geq,noteq);
  always@(*)begin   
  gre=0;    //default values need to be declared first 
  less=0;
  eq=0;
  leq=0;
  geq=0;
  noteq=0;
  
    if(a<b)
      less=1;
    else if(a>b)
      gre=1;
    
    if(a>=b)
      geq=1;
    if(a<=b)
      leq=1;
    if(a==b)
      eq=1;
    if(a!=b)
      noteq=1;
    
  end
endmodule


module tb_rel();
  reg[3:0]a,b;
  wire gre,less,eq,leq,geq,noteq;
  
  relational_op dut(.a(a),.b(b),.gre(gre),.less(less),.eq(eq),.leq(leq),.geq(geq),.noteq(noteq));
  
  initial begin
    $monitor("Time:%0t,a=%d,b=%d ,gre=%b,less<%b,eq==%b,leq<=%b,geq>=%b,noteq!=%b",$time,a,b,gre,less,eq,leq,geq,noteq);
    a = 4'd6; b = 4'd8; #10; 
    a = 4'd0; b = 4'd0; #10; 
    a = 4'd9; b = 4'd3; #10;  
    a = 4'd5; b = 4'd5; #10;
    a = 4'd2; b = 4'd7; #10; 
    $finish;
  end
                 initial begin
                   $dumpfile("dump.vcd");
                   $dumpvars(0,tb_rel);
                 end
endmodule
                  