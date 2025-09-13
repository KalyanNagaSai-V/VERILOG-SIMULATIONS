module ha(input a,b,output reg s,c);
  always@(*)begin
    if(a==0 && b==0)begin
      s=0;c=0;
    end
    else if(a==0 && b==1)begin
      s=1;c=0;
    end
    else if(a==1 && b==0)begin
      s=1;c=0;
    end
    else if(a==1 && b==1)begin
      s=0;c=1;
    end
  end
endmodule


module tb_ha();
  reg a,b;
  wire s,c;
  
  ha dut(.a(a),.b(b),.s(s),.c(c));
  initial begin
    $monitor("time=%0t,a=%b,b=%b,s=%b,c=%b",$time,a,b,s,c);
    a=0;b=0;#10;
    a=0;b=1;#10;
    a=1;b=0;#10;
    a=1;b=1;#10;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_ha);
  end
endmodule 