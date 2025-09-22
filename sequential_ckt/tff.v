module tff(input t,clk,output reg q);
  always@(posedge clk)begin
    if(t==1'b1)begin
      q<=~q;
    end
    else begin
      q<=q;
    end
  end 
endmodule 