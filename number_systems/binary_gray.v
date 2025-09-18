module bi_gr(input [3:0]a,output reg[3:0]y);
  always@(*)begin
  y[3]=a[3];
  y[2]=(a[3])^(a[2]);
  y[1]=(a[2])^(a[1]);
  y[0]=(a[1])^(a[0]); 
  end
endmodule 