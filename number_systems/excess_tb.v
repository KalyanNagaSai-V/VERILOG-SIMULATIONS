module excess_tb();
  reg [3:0]a;
  wire [3:0]y;
  
 excess3 dut(a,y);
  integer i;
  initial begin
    $monitor("time:%0t a=%b,y=%b",$time,a,y);
    for(i=0;i<=9;i=i+1)begin
      a=i;
    #10;
    end
  end
endmodule 