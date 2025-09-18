module g_btb();
  reg [3:0]a;
  wire [3:0]y;
  
  gray_binary dut(a,y);
  
  initial begin
    $monitor("time:%0t a=%b,y=%b",$time,a,y);
  
    repeat(5)begin
      a=$random;
      #10;
    end
  
  end
endmodule