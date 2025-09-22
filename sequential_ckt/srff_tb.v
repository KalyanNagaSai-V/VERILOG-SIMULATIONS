module tb_srff();
  reg s,r,clk;
  wire q, qbar;

  srff dut (
    .s(s),
    .r(r),
    .clk(clk),
    .q(q),
    .qbar(qbar)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $monitor("Time=%0t | s=%b r=%b clk=%b | q=%b qbar=%b", 
              $time, s, r, clk, q, qbar);

    s=0;r=0;
    #10 s=1;r=0;   
    #10 s=0;r=1;  
    #10 s=0;r=0;  
    #10 s=1;r=1;  
    #10 s=0;r=0;   
    #20 $finish;        
  end
endmodule