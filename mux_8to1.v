module mux_8to1(input [7:0]a,input [2:0]s,output reg y);
  always@(*)begin
    case(s)
      3'b000 : y=a[0];
      3'b001 : y=a[1];
      3'b010 : y=a[2];
      3'b011 : y=a[3];
      3'b100 : y=a[4];
      3'b101 : y=a[5];
      3'b110 : y=a[6];
      3'b111 : y=a[7];
    endcase
  end
endmodule

module tb_m();
  reg [7:0]a;
  reg [2:0]s;
  wire y;
  
  mux_8to1 dut(.*);
  integer j;
  initial 
    $monitor("a=%b,s=%b,y=%b",a,s,y);
             initial begin
               for(j=0;j<=64;j=j+1)begin
                 {a,s}=j;
                 #10;
               end
             end
endmodule 