module concatenation(input[1:0]a,b,output reg[3:0]y);
  always@(*)begin
    y={a,b};
  end
endmodule 

module tb_c();
  reg[1:0]a,b;
  wire[3:0]y;
  
  concatenation dut(.a(a),.b(b),.y(y));
  
  initial begin
    $monitor("time:%0t,a=%b,b=%b,y=%b",$time,a,b,y);
    a=2'b11;b=2'b10; #10;
    a=2'b01;b=2'b00; #10;
  end
endmodule