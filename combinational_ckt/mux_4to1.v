module mux_4to1(input[3:0]i,input[1:0]s,output reg y);  //behavioral
  always@(*)begin
    case(s)
      2'b00 : y=i[0];
      2'b01 : y=i[1];
      2'b10 : y=i[2];
      2'b11 : y=i[3];
    endcase
  end
endmodule

module tb_mux();
  reg[3:0]i;
  reg[1:0]s;
  wire y;
  
  mux_4to1 dut(.*);
  
  integer j;
  initial
    $monitor("i=%b,s=%b,y=%b",i,s,y);
  initial begin
    for(j=0;j<=64;j=j+1)begin
      {i,s}=j;
      #10;
    end
  end
endmodule 