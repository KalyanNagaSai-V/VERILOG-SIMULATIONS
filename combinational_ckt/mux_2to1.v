module mux_2to1(input i0,i1,s,output reg y); //behavioral 
  always@(*)begin
    if(s==0)
      y=i0;
    else
      y=i1;
  end
endmodule

module mux_tb();
  reg i0,i1,s;
  wire y;
  
  mux_2to1 dut(.*);
  integer i;
  initial 
    $monitor("i0=%b,i1=%b,s=%b,y=%b",i0,i1,s,y);
  initial begin
    for(i=0;i<=7;i=i+1)begin
      {i0,i1,s}=i;
      #10;
    end
  end
endmodule 