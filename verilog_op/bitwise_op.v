module bitwise_op(input[3:0]a,b,output reg[3:0]and_b,or_b,xor_b,output reg[3:0]not_a,not_b,output reg[3:0]shl,shr);
  always@(*)begin
    and_b=a&b;
    or_b=a|b;
    xor_b=a^b;
    not_a=~a;
    not_b=~b;
    shl=a<<1;
    shr=b>>1;
  end
endmodule

module t_bit();
  reg[3:0]a,b;
  wire[3:0]and_b,or_b;
  wire[3:0]not_a,not_b;
  wire[3:0]shl,shr;
  
  bitwise_op dut(.a(a),.b(b),.and_b(and_b),.or_b(or_b),.not_a(not_a),.not_b(not_b),.shl(shl),.shr(shr));
  
  initial begin $monitor("time:%0t,a=%b,b=%b,and_b=%b,or_b=%b,not_a=%b,not_b=%b,shl=%b,shr=%b",$time,a,b,and_b,or_b,not_a,not_b,shl,shr);
    a = 4'b1010; b = 4'b1100; #10;
    a = 4'b0101; b = 4'b0011; #10;
    a = 4'b1111; b = 4'b0000; #10;
    a = 4'b1001; b = 4'b0110; #10;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,t_bit);
  end
  
endmodule