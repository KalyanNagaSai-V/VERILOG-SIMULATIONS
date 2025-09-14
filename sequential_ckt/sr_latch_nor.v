module sr_nor(input s,r,output q,qb);
  nor n1(qb, s, q);  
  nor n2(q,  r, qb);
endmodule 

module sr_nor(input s, r, output reg q, qb);
  always @(*) begin
    if (s==0 && r==0) begin
      q  = q;
      qb = qb;
    end
    else if (s==0 && r==1) begin
      q  = 1'b0;
      qb = 1'b1;
    end
    else if (s==1 && r==0) begin
      q  = 1'b1;
      qb = 1'b0;
    end
    else if (s==1 && r==1) begin
      q  = 1'b0;
      qb = 1'b0;
    end
  end
endmodule 

module sr_nor(input s,r,output q,qb);
  assign q=~(r|qb);
  assign qb=~(s|q);
endmodule 