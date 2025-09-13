module reduction_ops (
  input  [7:0] a,
  output reg and_red, nand_red,
  output reg or_red,  nor_red,
  output reg xor_red, xnor_red
);
  always @(*) begin
    and_red  = &a;   // reduction AND
    nand_red = ~&a;  // reduction NAND
    or_red   = |a;   // reduction OR
    nor_red  = ~|a;  // reduction NOR
    xor_red  = ^a;   // reduction XOR
    xnor_red = ~^a;  // reduction XNOR
  end
endmodule

module tb;
  reg [7:0] a;
  wire and_red, nand_red, or_red, nor_red, xor_red, xnor_red;
  integer i;

  // Instantiate DUT
  reduction_ops dut (
    .a(a),
    .and_red(and_red), .nand_red(nand_red),
    .or_red(or_red), .nor_red(nor_red),
    .xor_red(xor_red), .xnor_red(xnor_red)
  );

  initial begin
    for (i = 0; i < 8; i = i + 1) begin
      a = i; #5;
      $display("%4t | %b |  %b    %b  |  %b    %b  |  %b    %b", 
                $time, a, and_red, nand_red, or_red, nor_red, xor_red, xnor_red);
    end

    $finish;
  end
endmodule
