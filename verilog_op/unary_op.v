module unary_op(input[3:0]a,output reg[3:0] reand,renand,reor,renor,rexor,rexnor,irexnor);
  always@(*)begin
    reand=&a;
    renand=~&a;
    reor=|a;
    renor=~|a;
    rexor=^a;
    rexnor=^~a;
    irexnor=~^a;
  end
endmodule

module tb_unary();
  reg[3:0]a;
  wire reand,renand,reor,renor,rexor,rexnor,irexnor;
  
  unary_op dut(.a(a),.reand(reand),.renand(renand),.reor(reor),.renor(renor),.rexor(rexor),.rexnor(rexnor),.irexnor(irexnor));
  
  initial begin
$monitor("time:%0t,a=%b,reand=%b,renand=%b,reor=%b,renor=%b,rexor=%b,rexnor=%b,irexnor=%b",$time,a,reand,renand,reor,renor,rexor,rexnor,irexnor);
    a=4'b0110; #10;
    a=4'b1000; #10;
  end
endmodule 
  
  