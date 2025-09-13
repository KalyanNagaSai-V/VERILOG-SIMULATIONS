module arithmetic_op(input  [7:0] a, b, output reg [7:0] sum, diff, prod, quot, mod_result);
  always @(*) begin
    sum        = a + b;
    diff       = a - b;
    prod       = a * b;
    quot       = a / b;
    mod_result = a % b;
  end
endmodule

// ================= Testbench =================
module tb;
  reg [7:0] a, b;
  wire [7:0] sum, diff, prod, quot, mod_result;
  integer i;

  // Instantiate DUT
  arithmetic_ops dut (
    .a(a), .b(b),
    .sum(sum), .diff(diff), .prod(prod),
    .quot(quot), .mod_result(mod_result)
  );

  initial begin
    a = 10; 
    b = 3;

    #5;
    $display("DUT Results:");
    $display("a = %0d, b = %0d", a, b);
    $display("a + b = %0d", sum);
    $display("a - b = %0d", diff);
    $display("a * b = %0d", prod);
    $display("a / b = %0d", quot);
    $display("a %% b = %0d", mod_result);

    // Extra: Using for loop
    $display("\nMultiplication table of a using DUT:");
    for (i = 1; i <= 5; i = i + 1) begin
      #5 b = i;
      #1 $display("%0d * %0d = %0d", a, b, prod);
    end

    $finish;
  end
endmodule
