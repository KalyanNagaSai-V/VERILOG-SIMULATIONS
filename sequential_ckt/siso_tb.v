module siso_tb();
  reg di, clk;
  wire q_out;
  siso dut(
    .di(di), 
    .clk(clk), 
    .q_out(q_out)   
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0; 
    di  = 0;
    
    $monitor("time=%0t | di=%b clk=%b q_out=%b", $time, di, clk, q_out);
    
    #10 di = 0;
    #10 di = 1;
    #10 di = 1;
    #10 di = 0;
    #10 $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_m);
  end
endmodule