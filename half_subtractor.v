module ha_sub(input a,b,output reg d,bo);
  always@(*)begin
    if(a==0 && b==0)begin
      d=0;bo=0;
    end
    else if(a==0 && b==1)begin
      d=1;bo=0;
    end
    else if(a==1 && b==0)begin
      d=1;bo=1;
    end
    else if(a==1 && b==1)begin
      d=0;bo=0;
    end
  end
endmodule

module tb_hasub();
  reg a,b;
  wire d,bo; 

  ha_sub dut(.a(a),.b(b),.d(d),.bo(bo));
  initial begin
    $monitor("time=%0t,a=%b,b=%b,s=%b,c=%b",$time,a,b,d,bo);
    a=0;b=0;#10;
    a=0;b=1;#10;
    a=1;b=0;#10;
    a=1;b=1;#10;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_hasub);
  end
endmodule 