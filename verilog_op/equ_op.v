module equ_op(input[3:0]a,b,output reg loeq,loiq,caq,caiq);
  always@(*)begin
    if(a==b)
      loeq=1;
    else
      loeq=0;
    if(a!=b)
      loiq=1;
    else
      loiq=0;
    if(a===b)
      caq=1;
    else
      caq=0;
    if(a!==b)
      caiq=1;
    else
      caiq=0;
  end
endmodule 

module tb_eqop();
  reg a,b;
  wire loeq,loiq,caq,caiq;
  
  equ_op dut(.a(a),.b(b),.loeq(loeq),.loiq(loiq),.caq(caq),.caiq(caiq));
  
  initial begin    $monitor("time:%0t,a=%d,b=%d,loeq=%b,loiq=%b,caq=%b,caiq=%b",$time,a,b,loeq,loiq,caq,caiq);
    a = 4'd1;  b = 4'd1;  #10;  // equal
    a = 4'd0;  b = 4'd4;  #10;  // not equal
    a = 4'd7;  b = 4'd3;  #10;  // not equal
    a = 4'd5;  b = 4'd5;  #10;  // equal
    a = 4'd8;  b = 4'd2;  #10;  // not equal
    a = 4'd9;  b = 4'd9;  #10;  // equal
    a = 4'd15; b = 4'd0;  #10;  // boundary test
    a = 4'd0;  b = 4'd0;  #10;  // both zero
    $finish;
  end
endmodule 