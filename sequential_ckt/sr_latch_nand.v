module sr_latch(input s,r,output q,qb);  //gatelevel
  nand n1(q,s,qb);
  nand n2(qb,r,q);
endmodule 

module srlatch(input s, r, output reg q, qb);     //behavioral
  always @(*) begin
    case ({s, r})
      2'b00: begin  // Invalid
        q  = 1'bx;
        qb = 1'bx;
      end
      2'b01: begin  // Set
        q  = 1'b1;
        qb = 1'b0;
      end
      2'b10: begin  // Reset
        q  = 1'b0;
        qb = 1'b1;
      end
      2'b11: begin  // Hold
        q  = q;
        qb = qb;
      end
    endcase
  end
endmodule


module srlatch(input s,r,output q,qb);    //dataflow
  assign q=~(s&qb);
  assign qb=~(r&q);
endmodule 