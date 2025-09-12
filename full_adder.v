module full_ad(input a, b, c,output reg s, co);
  reg [2:0] inputs;

  always @(*) begin
    inputs = {a, b, c};
    case (inputs)
          3'b000: 
            begin 
              s=0; co=0; 
            end 
          3'b001:
            begin
              s=1; co=0; 
            end 
          3'b010: 
            begin 
              s=1; co=0;
            end
          3'b011:
            begin 
              s=0; co=1; 
            end 
          3'b100:
            begin 
              s=1; co=0;
            end 
          3'b101:
            begin 
              s=0; co=1;
            end 
          3'b110:
            begin 
              s=0; co=1;
            end 
          3'b111:
            begin
              s=1; co=1;
            end 
        endcase
  end
endmodule

estbench.sv
module tb_fa();
  reg a, b, c;
  wire s, co; 
​
  full_ad dut(.a(a), .b(b), .c(c), .s(s), .co(co));
  integer j;
  
  initial begin
    $monitor("time=%0t a=%b b=%b c=%b | sum=%b carry=%b", 
              $time, a, b, c, s, co);
    for (j = 0; j < 8; j = j + 1) begin // apply all combinations with for loop
      {a, b, c} = j; 
      #10; 
    end
  end
​
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_fa);
  end
endmodule
​

