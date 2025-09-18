module tb_m();
  reg[3:0]a;
  wire[3:0]y;
  binary_onecompl dut(a,y);
 
  
  initial begin
    $monitor("time:%0t a=%b,y=%b",$time,a,y);
  
    repeat(5)begin
      a=$random;
      #10;
   end
  
  end
endmodule