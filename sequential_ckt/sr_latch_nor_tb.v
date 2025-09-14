module sr_tb();
  reg s, r;
  wire q, qb;
  
  sr_nor dut(s, r, q, qb);
  
  initial begin
    $monitor("time=%0t | s=%b r=%b | q=%b qb=%b", $time, s, r, q, qb);
    
    s=0; r=0; #10;   
    s=0; r=1; #10;  
    s=1; r=0; #10;  
    s=1; r=1; #10;   
    s=0; r=0; #10;   
    
    $finish;
  end
endmodule