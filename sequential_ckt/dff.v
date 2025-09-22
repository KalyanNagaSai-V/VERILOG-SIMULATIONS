module dff(input d,clk,output reg q,qb);
  always@(posedge clk)begin
    if(d==1'b1)begin
       q<=d;
       qb<=1'b0;
    end
      else begin
        q<=1'b0;
        qb<=d;
    end
  end
endmodule 