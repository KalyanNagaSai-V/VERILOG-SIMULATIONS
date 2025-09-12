module ha(input a, b, output reg s, c);
  always @(*) begin
    case ({a,b})
      2'b00:
        begin
          s = 0; c = 0;
        end
      2'b01:
        begin
          s = 1; c = 0; 
        end
      2'b10:
        begin
          s = 1; c = 0;
        end
      2'b11:
        begin 
          s = 0; c = 1; 
        end
    endcase
  end
endmodule 

// Full Adder using 2 Half Adders
module fa(input a, b, ci, output s, c);
  wire s1, c1, c2;

  ha ha1(.a(a), .b(b), .s(s1), .c(c1));

  
  ha ha2(.a(s1), .b(ci), .s(s), .c(c2));

  
  assign c = c1 | c2;
endmodule

module tb_fa();
  reg a, b, ci;
  wire s, c;
  
  
  fa dut(.a(a), .b(b), .ci(ci), .s(s), .c(c));
  
  integer j;
  initial begin
    $monitor("time=%0t | a=%b b=%b ci=%b | sum=%b cout=%b", 
              $time, a, b, ci, s, c);
    for (j = 0; j < 8; j = j + 1) begin
      {a, b, ci} = j;
      #10;   
    end
  end
endmodule
