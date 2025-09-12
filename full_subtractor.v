module full_sb(input a,b,c,output reg d,bo);
  reg[2:0]inputs;
  always@(*)begin
    inputs = {a,b,c};
    case(inputs)
      3'b000: 
            begin 
              d=0; bo=0; 
            end 
          3'b001:
            begin
              d=1; bo=1; 
            end 
          3'b010: 
            begin 
              d=1; bo=1;
            end
          3'b011:
            begin 
              d=0; bo=1; 
            end 
          3'b100:
            begin 
              d=1; bo=0;
            end 
          3'b101:
            begin 
              d=0; bo=0;
            end 
          3'b110:
            begin 
              d=0; bo=0;
            end 
          3'b111:
            begin
              d=1; bo=1;
            end 
        endcase
  end
endmodule

module tb_fs();
  reg a, b, c;
  wire s, co; 

  full_sb dut(.a(a), .b(b), .c(c), .d(d), .bo(bo));
  integer j;
  
  initial begin
    $monitor("time=%0t a=%b b=%b c=%b | d=%b bo=%b", 
              $time, a, b, c, d, bo);
    for (j = 0; j < 8; j = j + 1) begin // apply all combinations with for loop
      {a, b, c} = j; 
      #10; 
    end
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_fs);
  end
endmodule