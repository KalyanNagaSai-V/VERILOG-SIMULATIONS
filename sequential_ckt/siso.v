module siso(input di,clk,output reg[3:0]q);
  integer i;
  always@(posedge clk)begin
    q[3]<=di;
    i=0;
    while(i<3)begin
      q[i]=q[i+1];
    i=i+1;
    end
  end
endmodule