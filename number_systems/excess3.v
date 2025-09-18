module excess3(input [3:0]a,output reg[3:0]y);
  always@(*)begin
  y=a+4'b0011;
  end
endmodule 