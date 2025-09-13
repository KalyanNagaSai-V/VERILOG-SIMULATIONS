module shift_op(input[3:0]a,b,output reg[3:0]rs_a,rs_b,ls_a,ls_b,ar_a,ar_b,al_a,al_b);
  always@(*)begin
    rs_a=a>>1;
    rs_b=b>>1;
    ls_a=a<<1;
    ls_b=b<<1;
    ar_a=a>>>1;
    ar_b=b>>>1;
    al_a=a<<<1;
    al_b=b<<<1;
  end
endmodule 

module tb_shi();
  reg [3:0] a, b;
  wire [3:0] rs_a, rs_b, ls_a, ls_b, ar_a, ar_b, al_a, al_b;

  
  shift_op dut (.a(a), .b(b), .rs_a(rs_a), .rs_b(rs_b), .ls_a(ls_a),.ls_b(ls_b),.ar_a(ar_a),.ar_b(ar_b),.al_a(al_a),.al_b(al_b));

  initial begin

    $monitor("Time:%0t, rs_a=%b, rs_b=%b, ls_a=%b, ls_b=%b, ar_a=%b, ar_b=%b, al_a=%b, al_b=%b",$time, rs_a, rs_b, ls_a, ls_b, ar_a, ar_b, al_a, al_b);
    a=4'b0101; b=4'b1010; #10;
    a=4'b1001; b=4'b1111; #10;
    a=4'b1111; b=4'b0101; #10;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_shi);
  end
endmodule