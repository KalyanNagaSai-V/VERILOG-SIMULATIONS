module demux_1to2(input a,s,output reg y0,y1);
  always@(*)begin
    case(s)
      1'b0: 
      begin
        y0=a;
        y1=1'b0;
      end
      
      1'b1: 
        begin
        y0=1'b1;
        y1=a;
        end
   endcaseS
  end
endmodule 

module tb;
  reg a, s;
  wire y0, y1;

  demux_1to2 dut (.*);

  initial begin
    repeat (8) begin
      a = $random;  
      s = $random;   
      #10;
      $display("a=%b, s=%b, y0=%b, y1=%b", a, s, y0, y1);
    end
  end
endmodule
